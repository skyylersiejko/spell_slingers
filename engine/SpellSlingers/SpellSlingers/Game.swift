//
//  Game.swift
//  SpellSlingers
//
//  Created by Shreyas Ramanujam on 11/8/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI


struct Game: View{
    @State var Stack: Pile = Pile()
    @State var decktmp: Pile = Pile()
    @State var player:Player?
    
    func setPlayer() {
        self.player = Player(deck: $decktmp)
    }
    func test_pile() {
        self.Stack.push(Card(name: "cancel",power:10,owner:"_blue"))
        self.Stack.push(Card(name: "cancel",power:10,owner:"_blue"))
//        self.player.deck.push(Card(name: "recycle",power:10,owner:"_red"))
        
    }
   var body: some View {
        VStack {
//              self.decktmp
            self.Stack
//            self.player.deck
//            self.player.hand
        }.onAppear {
            self.test_pile()
//            self.setPlayer()
//            self.player?.createDeck()
//            self.player.shuffleDeck()
//            self.player.drawFromDeck()
//            self.player.drawFromDeck()
//            self.player.drawFromDeck()
    }
    }
}
