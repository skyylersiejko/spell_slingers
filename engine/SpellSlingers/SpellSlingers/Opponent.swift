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
    
   var body: some View {
        VStack {
            ZStack{
                ForEach(self.hand, id: \.self) { card in
                    Image("back")
                        .resizable()
                        .aspectRatio(0.90, contentMode: .fill)
                        .frame(width: 30, height:175, alignment: .topLeading)
                        .overlay(Image("back"),alignment: .topLeading)
//                        .cornerRadius(30.0)
//                        .padding(0)
                    
            }
        }
        Deck(owner: "_red",cards: $deck, items: $hand)
        Text("Opponent")
        .foregroundColor(.red)
        }
    }
}
