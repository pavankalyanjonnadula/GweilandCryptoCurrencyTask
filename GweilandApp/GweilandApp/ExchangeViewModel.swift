//
//  ExchangeViewModel.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 17/11/23.
//

import Foundation

class ExchangeViewModel {
    var arrayOfCoins: [Data]?
    var coinIconURL: [Int: String] = [:]
    private var completedApiCalls = 0
    var sortPriceAction = "H-L"
    var sortVolumeAction = "H-L"

    // Add properties and methods as needed

    func getAllCoinsList(completion: @escaping () -> Void) {
        ApiClient.shared.getRequest(url: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") { (coinlist: CryptoList?, error) in
            self.arrayOfCoins = coinlist?.data ?? []
            let sortedObjects = self.arrayOfCoins?.sorted { $0.cmcRank < $1.cmcRank }
            self.arrayOfCoins = Array(sortedObjects?.prefix(20) ?? [])
            
            DispatchQueue.global(qos: .background).async {
                self.getAllIconsForCoins(completion: completion)
            }
        }
    }

    func getAllIconsForCoins(completion: @escaping () -> Void) {
        guard let arrayOfCoins = arrayOfCoins else {
            completion()
            return
        }

        arrayOfCoins.forEach { coinData in
            ApiClient.shared.getRequest(url: "https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=\(coinData.id)") { (coinMetaData: CoinMetaData?, error) in
                print("the coin id", error as Any, coinData.id)
                self.completedApiCalls += 1

                if let coinIconData = coinMetaData {
                    self.coinIconURL[coinData.id] = coinIconData.data["\(coinData.id)"]?.logo ?? ""
                }

                if self.completedApiCalls == 20 {
                    print("the final icons", self.coinIconURL)
                    completion()
                }
            }
        }
    }
}
