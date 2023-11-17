//
//  ExchangeViewController.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 16/11/23.
//

import Foundation
import UIKit

class ExchangeViewController : UIViewController {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var coinListTableView: UITableView!
    var arrayOfCoins : [Data]?
    var coinIconURL : [Int : String] = [:]
    var completedApiCalls = 0

    override func viewDidLoad() {
        filterView.layer.borderWidth = 2
        filterView.layer.borderColor = UIColor.lightGray.withAlphaComponent(10).cgColor
        filterView.layer.masksToBounds = false
        getAllCoinsList()
        coinListTableView.dataSource = self
        coinListTableView.register(UINib(nibName: "CryptoListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }
    
    func getAllCoinsList(){
        ApiClient.shared.getRequest(url: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") { (coinlist : CryptoList?, error) in
            
            self.arrayOfCoins = coinlist?.data ?? []
            print("initial the coin list",self.arrayOfCoins?.count ?? 0)
            
            let sortedObjects = self.arrayOfCoins?.sorted { $0.cmcRank < $1.cmcRank}
            
            self.arrayOfCoins = Array(sortedObjects?.prefix(20) ?? [])
            print("Final the coin list",self.arrayOfCoins?.count ?? 0)
            DispatchQueue.global(qos: .background).async {
                self.getAllIconsForCoins()
            }
            DispatchQueue.main.async {
                self.coinListTableView.reloadData()
            }
        }
    }

    func getAllIconsForCoins(){
        self.arrayOfCoins?.forEach({ coinData in
            ApiClient.shared.getRequest(url: "https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=\(coinData.id)") { (coinMetaData : CoinMetaData?, error) in
                print("the coin id",error as Any,coinData.id)
                self.completedApiCalls = self.completedApiCalls + 1
                if let coinIconData = coinMetaData{
                    self.coinIconURL[coinData.id] = coinIconData.data["\(coinData.id)"]?.logo ?? ""
                }
                if self.completedApiCalls == 20{
                    print("the final icons",self.coinIconURL)
                }
            }
        })
    }
}

extension ExchangeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCoins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! CryptoListTableViewCell
        let price = arrayOfCoins?[indexPath.row].quote.USD.price ?? 0.0
        let percentageChangein24Hr = arrayOfCoins?[indexPath.row].quote.USD.percentChange24h ?? 0.0
        
        cell.symbolId.text = arrayOfCoins?[indexPath.row].symbol ?? ""
        cell.symbolName.text = arrayOfCoins?[indexPath.row].name ?? ""
        cell.coinrateLabel.text = String(format: "%.1f", price) + " USD"
        cell.precentChange.text = String(format: "%.1f", percentageChangein24Hr) + "%"
        if percentageChangein24Hr > 0{
            cell.precentChange.textColor = UIColor(hex: "#00CE08")
            cell.gainGraphImage.image = UIImage(named: "gainGraph")
        }else{
            cell.precentChange.textColor = UIColor(hex: "#FF3D00")
            cell.gainGraphImage.image = UIImage(named: "lossGraph")
        }
        
      
        return cell
    }
    
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
