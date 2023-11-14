//
//  Song.swift
//  
//
//  Created by Aziz's MacBook Air on 26.04.2023.
//

import Fluent
import Vapor

final class Song: Model, Content {
    
    static let schema: String = "songs"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String?
    
    init() { }
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
    
}
