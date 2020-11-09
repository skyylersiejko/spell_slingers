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
   @State var stack:Array<Card> = []
   @State var discard:Array<Card> = []
//   var opponent = Opponent(isActive: false)
//   var player = Player(isActive: false)
   @State var GameState:Int = 0
    
    func start() {
//        player
        GameState = 1
    }
   var body: some View {
        VStack {
//            Text("Cool")
//            if(GameState != 0) {
//                Text("cool")
//            } else {
//                self.start()
//            }
            Opponent(isActive: false)
            Player(isActive: false)
        }
    }
}
