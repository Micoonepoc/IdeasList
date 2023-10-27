//
//  HapticManagerModel.swift
//  TodoList
//
//  Created by Михаил on 27.10.2023.
//

import Foundation
import UIKit

class HapticManager {
    
    static let shared = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
