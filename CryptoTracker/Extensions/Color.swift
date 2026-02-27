//
//  Color.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/26/26.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
