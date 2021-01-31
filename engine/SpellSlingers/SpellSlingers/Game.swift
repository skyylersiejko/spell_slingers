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
    @State var player_deck: Pile = Pile()
    @State var player_hand: Pile = Pile()
    @State var player:Player?
    @State var opponent: Player?
    
    func start() {
        self.player = Player(deck: $player_deck, hand:$player_hand)
        GameLoop(loop: self.gameLoop)
        
       
    }
    func test_pile() {
       // self.Stack.push(Card(name: "cancel",power:10,owner:"_blue"))
       // self.Stack.push(Card(name: "cancel",power:10,owner:"_blue"))
//        self.player.deck.push(Card(name: "recycle",power:10,owner:"_red"))
        
    }
    
    
    func gameLoop(){
        self.update()
    }
    
    func update(){
          self.cast()
        if(self.player != nil){
            self.cast()
          
            
            
            
            
        }
        
    }
    
    
    func cast(){
        
        if(self.player?.isActive == true){
            //do player casting logic
            if( true){ //self.Stack.isActive == true
                for i in 0..<self.player_hand.items.count{
                    print(self.player_hand.items[i].getActive())
                    if(self.player_hand.items[i].getActive()){
                        self.Stack.push(self.player_hand.items[i])
                        print("hit stack")
                    }
                }
            }
            
            
        }else{
            //do computer opponent casting
        }
        
       
    }
    
    
    func switchPriority(){
        if(self.player?.isActive == true){
            self.player?.isActive = false
            self.opponent?.isActive = true
        }else{
            self.player?.isActive = true
            self.opponent?.isActive = false
        }
    }
    
    
    
   var body: some View {
    VStack(spacing:0) {
              //self.player_deck
            self.Stack
            //self.player.deck
            self.player_hand
        
        }.onAppear {
            //self.test_pile()
           self.start()
            self.player?.createDeck()
             self.player?.shuffleDeck()
            self.player?.drawCard()
//            self.player.drawFromDeck()
//            self.player.drawFromDeck()
    }
   
    }
}
