//
//  StatsiticView.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 3/5/26.
//

import SwiftUI

struct StatisticView: View {
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.green  : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
        
    }
}

#Preview {
    StatisticView(stat: MockData.stat1)
}

#Preview {
    StatisticView(stat: MockData.stat2)
}

#Preview {
    StatisticView(stat: MockData.stat3)
}
