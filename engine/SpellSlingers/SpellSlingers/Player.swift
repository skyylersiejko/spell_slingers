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
//    @property class *callStack:NSArray<NSString *>
    @State var deck:Deck?
    @Binding var isActive:Bool
    @State var points:Int = 25
    @ObservedObject var hand = Hand()
//    {
//        willSet {
//            self.setDeck()
//        }
//    }
    
    init(Active: Binding<Bool>){
        _isActive = Active
    }
    
    func setDeck() {
        self.deck = Deck(hand: $hand.value)
    }
    
    func addtoPile() {
        if let decks = self.deck{
            decks.chooseCard()
        }else{
            print ("deck not defined in Player")
        }
    
    }
    
    func getDeck() -> Deck? {
        return(self.deck)
    }
    
    func getHand() -> Pile {
        return(hand.value)
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
//            Deck(hand: $hand)
            Text(String(self.hand.value.items.count))
         Text("Player")
            .foregroundColor(.blue)
         HStack{
            ForEach(self.hand.value.items, id: \.self) { card in
                VStack{
                    Card(_id: card._id, name: card.name,power:card.power, owner:card.owner)
                }
            }
         }
        }.onAppear() {
            self.setDeck()
            if let decks = self.deck{
                decks.chooseCard()
            }else{
                print ("deck not defined in Player")
            }
//            self.addtoPile()
        }
    }
}
