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
            case 2: //resolve stack <--- HOLY SHIT LOOK AT TTHE BELOW
                Stack(stack: $stack, items: Player(isActive:  $player_IsActive).$hand, blue_points: Player(isActive: $player_IsActive).$points, red_points: Opponent(isActive: $opponent_IsActive).$points).resolve()
            default:
                self.start()
            
                
        }
    }
    
    
   var body: some View {
        Group{
            Opponent(isActive: $opponent_IsActive)
            Player(isActive: $player_IsActive)
            Stack(stack: $stack, items: Player(isActive: $player_IsActive).$hand, blue_points: Player(isActive: $player_IsActive).$points, red_points: Opponent(isActive: $opponent_IsActive).$points)
            Discard(discard: $discard, items: $stack)
        
    }
       
    }
}
