//
//  ong.swift
//  YT-Vapor-iOS-App
//
//  Created by Aziz's MacBook Air on 26.04.2023.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
