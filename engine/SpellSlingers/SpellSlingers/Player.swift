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
    
    @State var deck:Deck = nil
    @Binding var isActive:Bool
    @State var points:Int = 25
    @State var hand:Pile = Pile()
//    {
//        willSet {
//            self.setDeck()
//        }
//    }
   
    init(Active: Binding<Bool>){
        _isActive = Active
    }
    
    func setDeck() {
        self.deck = Deck(hand: $hand)
    }
    
//    func addtoPile() -> Card?{
//        self.deck?.chooseCard()
//    }
    
    func getDeck() -> Deck? {
        return(self.deck)
    }
    
    func getHand() -> Pile {
        return(hand)
    }
    
      var body: some View {
        VStack {
//            self.deck
//            self.deck = Deck(hand: $pile)
//            self.deck.create()
//            if(isActive) {
//                self.deck.chooseCard()
//            }
            self.deck
         Text("Player")
            .foregroundColor(.blue)
         HStack{
            ForEach(self.hand.items, id: \.self) { card in
                VStack{
                    Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                }
            }
         }
        }.onAppear() {
            self.setDeck()
        }
    }
}
