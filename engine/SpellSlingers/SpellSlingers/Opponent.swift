//
//  Opponent.swift
//  SpellSlingers
//
//  Created by Shreyas Ramanujam on 11/8/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI


struct Opponent: View {
    @State var deck:Array<Card> = []
    @State var hand:Array<Card> = []
    @Binding var isActive:Bool
    @State var points:Int = 25
    
//    init() {
//         Deck(owner: "_red", cards: $deck)
//    }
    

    func getDeck() -> Array<Card>? {
        return(deck)
    }
    
    func getHand() -> Array<Card>? {
        return(hand)
    }
    
    func drawCard() {
//        var card = $deck.chooseCard()
//        if(card != nil) {
//            self.hand.append($deck.chooseCard())
//        }
//        print("adding card to hand")
    }
    
   var body: some View {
        VStack {
            Deck(owner: "_red",cards: $deck, items: $hand)
            Text("Opponent")
            .foregroundColor(.red)
//            Text(String(self.hand.count))
            HStack{
                ForEach(self.hand, id: \.self) { card in
                    Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                }
            }
        }
    }
}
