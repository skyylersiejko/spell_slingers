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
    
    @State var hand:Array<Card> = []
    @Binding var deck:Deck
    @Binding var isActive:Bool
    @State var points:Int = 25
   
    init(Active: Binding<Bool>, deck_:Binding<Deck>){
        _isActive = Active
        _deck = deck_
        
       
    }
    
  
    
    func getDeck() -> Deck? {
        return(self.deck)
    }
    
    func getHand() -> Array<Card>? {
        return(hand)
    }
    
      var body: some View {
        VStack {
            self.deck
//            self.deck.create()
//            if(isActive) {
//                self.deck.chooseCard()
//            }
         
         Text("Player")
            .foregroundColor(.blue)
         HStack{
             ForEach(self.hand, id: \.self) { card in
                VStack{
                    Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                }
            }
         }
      }
    }
}
