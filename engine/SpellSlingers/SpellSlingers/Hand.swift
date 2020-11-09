//
//  Hand.swift
//  SpellSlingers
//
//  Created by Shreyas Ramanujam on 11/8/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI


struct Hand: View{
    @State var cards:Array<Card> = []
    
    func addToHand(card: Card) {
        self.cards.append(card)
    }
    
    func removeFromHand(card: Card) {
        //remove from hand
    }
    
//    func addToHand
    var body: some View {
        Group {
            if(self.cards.count > 0){
            HStack{
             ForEach(self.cards, id: \.self) { card in
                Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
             }
          }
        }
    }
  }
}
