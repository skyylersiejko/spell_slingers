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
 
    @State var hand:Array<Card> = []
    @State var deck:Deck
    @Binding var isActive:Bool
    @State var points:Int = 25
   
    init(Active: Binding<Bool>, deck_:Deck!){
        _isActive = Active
        _deck = State(initialValue: deck_)
    }
    
    
//    init() {
//         Deck(owner: "_red", cards: $deck)
//    }
    

    func getDeck() -> Deck? {
        return(self.deck)
    }
    
    func getHand() -> Array<Card>? {
        return(hand)
    }
    
   var body: some View {
        VStack {
            HStack{
                ForEach(self.hand, id: \.self) { card in
                    Image("back")
                        .resizable()
                        .aspectRatio(0.90, contentMode: .fill)
                        .frame(width: 30, height:175, alignment: .topLeading)
//                        .cornerRadius(30.0)
//                        .padding(0)
                    
            }
        }
           
        Text("Opponent")
        .foregroundColor(.red)
        }
    }
}
