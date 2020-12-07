//
//  Pile.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/17/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation


struct Pile {
    public var items = [Card]() // Empty items array
    mutating func push(_ item: Card) {
        items.append(item)
    }
    
    mutating func pop() -> Card? {
        if !items.isEmpty {
           return items.removeLast()
        }
        return nil
    }
    
    mutating func remove(index: Int) {
        items.remove(at: index)
    }
    
    mutating func returnLast() -> Card? {
        if !items.isEmpty {
            return items.last
        }
        return nil
    }
}
