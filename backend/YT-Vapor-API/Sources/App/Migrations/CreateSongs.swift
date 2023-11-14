//
//  CreateSongs.swift
//  
//
//  Created by Aziz's MacBook Air on 26.04.2023.
//

import Fluent

struct CreateSongs: Migration {
    
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs").delete()
    }
    
    
}
