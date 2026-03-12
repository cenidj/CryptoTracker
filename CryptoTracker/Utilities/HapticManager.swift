//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 3/12/26.
//

import Foundation
import SwiftUI


class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
