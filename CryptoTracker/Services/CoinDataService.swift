//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/27/26.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    NetworkingManager.handleCompletion(completion: completion)
                },
                receiveValue: { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins
                    self?.coinSubscription?.cancel()
                    
                }
            )
    }
    
}

