//
//  Player.swift
//  SpellSlingers
//
//  Created by Shreyas Ramanujam on 11/8/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI

struct Player: View {
    @State var deck:Array<Card> = []
    @State var hand:Array<Card> = []
    @Binding var isActive:Bool
    @State var points:Int = 25
    
    func getDeck() -> Array<Card>? {
        return(deck)
    }
    
    func getHand() -> Array<Card>? {
        return(hand)
    }
    
      var body: some View {
        VStack {
            Deck(owner: "_blue",cards: $deck, items: $hand)
//            self.deck.create()
//            if(isActive) {
//                self.deck.chooseCard()
//            }
         
         Text("Player")
            .foregroundColor(.blue)
         HStack{
             ForEach(self.hand, id: \.self) { card in
                Button(action:{
                //            if(self.)
                    //print("coo " + String(card._id))
                }) {
                 Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                }
            }
         }
      }
    }
}
