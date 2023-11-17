//
//  ExchangeViewController.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 16/11/23.
//

import Foundation
import UIKit
import SDWebImage

class ExchangeViewController: UIViewController {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var coinListTableView: UITableView!

    var viewModel = ExchangeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFilterView()
        setupTableView()
        viewModel.getAllCoinsList {
            DispatchQueue.main.async {
                self.coinListTableView.reloadData()
            }
        }
    }

    fileprivate func initializeFilterView() {
        filterView.layer.borderWidth = 1.5
        filterView.layer.borderColor = UIColor(hex: "#0B0B0B",alpha: 0.3).cgColor
        filterView.layer.masksToBounds = false
        filterView.isUserInteractionEnabled = true
        filterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(filterViewClicked)))
    }
    
    
    @objc func filterViewClicked(){
        let actionSheet = UIAlertController(title: "SORT", message: "High to Low -- Low to High", preferredStyle: .actionSheet)

        let action1 = UIAlertAction(title: "Price (\(viewModel.sortPriceAction))", style: .default) { action in
            if self.viewModel.sortPriceAction == "H-L"{
                let sortedObjects = self.viewModel.arrayOfCoins?.sorted { $0.quote.USD.price > $1.quote.USD.price}
                self.viewModel.arrayOfCoins = sortedObjects
                self.viewModel.sortPriceAction = "L-H"
            }else{
                let sortedObjects = self.viewModel.arrayOfCoins?.sorted { $0.quote.USD.price < $1.quote.USD.price}
                self.viewModel.arrayOfCoins = sortedObjects
                self.viewModel.sortPriceAction = "H-L"
            }
            self.coinListTableView.reloadData()
        }
        let action2 = UIAlertAction(title: "Volume (\(viewModel.sortVolumeAction))", style: .default) { action in
            if self.viewModel.sortVolumeAction == "H-L"{
                let sortedObjects = self.viewModel.arrayOfCoins?.sorted { $0.quote.USD.volume24h > $1.quote.USD.volume24h }
                self.viewModel.arrayOfCoins = sortedObjects
                self.viewModel.sortVolumeAction = "L-H"
            }else{
                let sortedObjects = self.viewModel.arrayOfCoins?.sorted { $0.quote.USD.volume24h < $1.quote.USD.volume24h }
                self.viewModel.arrayOfCoins = sortedObjects
                self.viewModel.sortVolumeAction = "H-L"
            }
            self.coinListTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancelled")
        }
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }


    // Existing code for other functions

    private func setupTableView() {
        coinListTableView.dataSource = self
        coinListTableView.register(UINib(nibName: "CryptoListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }
}

extension ExchangeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfCoins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! CryptoListTableViewCell
        let price = viewModel.arrayOfCoins?[indexPath.row].quote.USD.price ?? 0.0
        let percentageChangein24Hr = viewModel.arrayOfCoins?[indexPath.row].quote.USD.percentChange24h ?? 0.0
        let symId = viewModel.arrayOfCoins?[indexPath.row].id ?? 0
        cell.symbolId.text = viewModel.arrayOfCoins?[indexPath.row].symbol ?? ""
        cell.symbolName.text = viewModel.arrayOfCoins?[indexPath.row].name ?? ""
        cell.coinrateLabel.text = "$" + String(format: "%.1f", round(price * 10) / 10) + " USD"
        cell.precentChange.text = String(format: "%.1f", percentageChangein24Hr) + "%"
        if percentageChangein24Hr > 0{
            cell.precentChange.textColor = UIColor(hex: "#00CE08")
            cell.gainGraphImage.image = UIImage(named: "gainGraph")
        }else{
            cell.precentChange.textColor = UIColor(hex: "#FF3D00")
            cell.gainGraphImage.image = UIImage(named: "lossGraph")
        }
        if viewModel.coinIconURL.count == 20{
            cell.configureLogo(with: URL(string : viewModel.coinIconURL[symId] ?? "")!)
        }
        return cell
    }
}
