//
//  Color.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/26/26.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme.self
    
}

enum ColorTheme {
    static let accent = Color("AccentColor")
    static let background = Color("BackgroundColor")
    static let green = Color("GreenColor")
    static let red = Color("RedColor")
    static let secondaryText = Color("SecondaryTextColor")
}
