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
    @State var stack_items:Array<Card> = []
    @State var stack:Stack!
    @State var discard:Array<Card> = []
    @State var player_IsActive = true
    @State var opponent_IsActive = false
    @State var player:Player!
    @State var opponent:Opponent!
    @State var GameState:Int = 0
    
    func setStack() {
        self.stack = Stack(stack: $stack_items,
        items: self.opponent.$hand,
        blue_points: self.player.$points,
        red_points: self.opponent.$points)
    }
    func setPlayers() {
        self.player = Player(Active: $player_IsActive)
        self.opponent = Opponent(Active: $opponent_IsActive)
    }
    
    func start() {
        self.player.setDeck()
        self.opponent.setDeck()
        self.GameState = 2
        GameLoop(loop: self.gameLoop)
    }
    
    func gameLoop() {
        self.update()
    }
    
//    func addToStackItems() {
//        var lastCard = self.player.addtoPile()!
//        if(lastCard != nil) {
//            self.stack_items.append(lastCard)
//        }
//    }
    
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
                    self.stack = Stack(stack: $stack_items,
                                             items: self.opponent.$hand,
                                             blue_points: self.player.$points,
                                             red_points: self.opponent.$points)
                } else {
                    self.stack = Stack(stack: $stack_items,
                                       items: self.player.$hand,
                                       blue_points: self.player.$points,
                                       red_points: self.opponent.$points)
                }
                self.stack.update()
//                print(self.stack_items.count)
//                self.GameState += 1
            case 3: //resolve stack 
                self.stack = Stack(stack: $stack_items,
                                   items: self.player.$hand,
                      blue_points: self.player.$points,
                      red_points: self.opponent.$points)
                
//                self.stack.resolve()
//                print(self.stack_items.count)
            default:
                self.start()
            
                
        }
    }
    
   var body: some View {
        VStack {
            self.opponent
            HStack {
//            Stack(stack: $stack,
//                  items: self.player.$hand,
//                  blue_points: self.player.$points,
//                  red_points: self.player.$points)
            self.stack
            Discard(discard: $discard, items: $stack_items)
            }
            self.player
        }.onAppear() {
            self.setPlayers()
            self.start()
            self.setStack()
    }
       
    }
}
