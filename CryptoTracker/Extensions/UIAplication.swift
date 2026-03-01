//
//  UIAplication.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/28/26.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
