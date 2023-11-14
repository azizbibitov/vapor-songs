//
//  ModalType.swift
//  YT-Vapor-iOS-App
//
//  Created by Aziz's MacBook Air on 27.04.2023.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return  "update"
        }
    }
    
    case add
    case update(Song)
}
