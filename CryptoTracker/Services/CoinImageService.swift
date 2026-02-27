//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/27/26.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        self.getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(
                receiveCompletion: { completion in
                    NetworkingManager.handleCompletion(completion: completion)
                },
                receiveValue: { [weak self] (returnedImage) in
                    self?.image = returnedImage
                    self?.imageSubscription?.cancel()
                }
            )
    }
}
