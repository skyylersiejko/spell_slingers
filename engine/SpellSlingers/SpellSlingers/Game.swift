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
   
    @State var player_IsActive = false
    @State var opponent_IsActive = false
    @State var GameState:Int = 0
    
    func start() {
//        player
        self.GameState = 1
    }
    
    func switchPriority(){
        if(self.opponent_IsActive){
            self.opponent_IsActive = false
            self.player_IsActive = true
        }else if(self.player_IsActive){
            self.player_IsActive = false
            self.opponent_IsActive = true
        }else{
            self.player_IsActive = false
            self.opponent_IsActive = false
        }
    }
    
    func update(){
        switch self.GameState{
            case 0: // start
                self.start()
            case 1:// switch priority
                self.switchPriority()
            case 2: // update stack
                if(self.opponent_IsActive) {
                    Stack(stack: $stack,
                          items: Opponent(isActive:  $opponent_IsActive).$hand,
                          blue_points: Player(isActive: $player_IsActive).$points,
                          red_points: Opponent(isActive: $opponent_IsActive).$points).update()
                } else {
                    Stack(stack: $stack,
                          items: Player(isActive:  $player_IsActive).$hand,
                          blue_points: Player(isActive: $player_IsActive).$points,
                          red_points: Opponent(isActive: $opponent_IsActive).$points).update()
                }
                self.GameState += 1
            case 3: //resolve stack 
                Stack(stack: $stack,
                      items: Player(isActive:  $player_IsActive).$hand,
                      blue_points: Player(isActive: $player_IsActive).$points,
                      red_points: Opponent(isActive: $opponent_IsActive).$points).resolve()
            default:
                self.start()
            
                
        }
    }
    
   var body: some View {
        VStack {
            Opponent(isActive: $opponent_IsActive)
            HStack {
            Stack(stack: $stack,
                  items: Player(isActive: $player_IsActive).$hand,
                  blue_points: Player(isActive: $player_IsActive).$points,
                  red_points: Opponent(isActive: $opponent_IsActive).$points)
            Discard(discard: $discard, items: $stack)
            }
            Player(isActive: $player_IsActive)
    }
       
    }
}
