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
    public var card_name = ["cancel", "resolve", "resource", "recycle", "spell"]
    public var card_text = ["delete the top card of the stack", "resolve the Stack", "gain power to cast spells", "add your hand to your deck, shuffle it, draw taht many cards.", "deal damage equal to your power"]
    public var isActive = false;
    public var items = [Card]() // Empty items array
    mutating func push(_ item: Card) {
        items.append(item)
    }
    
//    mutating func getItems() -> Array<Card>{
//        return(items)
//    }
//    
//    mutating func setItems(_ item: Array<Card>) {
//        self.items = item
//    }
    
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
    var body: some View {
        HStack{
                ForEach(items, id: \.name) { card in
                    Card(name:card.name, power: card.power, owner: card.owner)
                }
        }
    }
}
