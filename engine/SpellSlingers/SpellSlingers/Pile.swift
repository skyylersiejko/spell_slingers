//
//  Pile.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/17/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI

struct Pile: View {
    public var card_name = [""]
    public var card_text = [""]
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
    
//    mutating func draw() {
//        for card in items {
//            CardView(card_name: card.name, owner: card.owner)
//        }
//    }
    
    mutating func returnLast() -> Card? {
        if !items.isEmpty {
            return items.last
        }
        return nil
    }
    var body: some View {
        HStack{
            ForEach(items, id: \.name) { card in
                CardView(card_name: card.name, owner: card.owner)
            }
        }
    }
}
