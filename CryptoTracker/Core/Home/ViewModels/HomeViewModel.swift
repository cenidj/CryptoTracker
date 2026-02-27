//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/27/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(MockData.coin)
            self.portfolioCoins.append(MockData.coin)
        }
    }
}
