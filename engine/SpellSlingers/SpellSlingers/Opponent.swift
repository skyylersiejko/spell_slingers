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
    @State var isActive:Bool
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
            HStack{
                ForEach(self.hand, id: \.self) { card in
                    Image("back")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height:175, alignment: .topLeading)
                        .cornerRadius(30.0)
                        .padding(0)
            }
            Deck(owner: "_red",cards: $deck, items: $hand)
            Text("Opponent")
            .foregroundColor(.red)
//            Text(String(self.hand.count))
        }
        }
    }
}
