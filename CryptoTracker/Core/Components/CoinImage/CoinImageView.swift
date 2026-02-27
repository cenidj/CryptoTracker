//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/27/26.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject private var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        self._vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinImageView(coin: MockData.coin)
        .padding()
}
