//
//  Deck.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/3/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation

import SwiftUI

//Card : ID, name, power, owner
struct Deck: View{
   
    
    var count: Int
    var owner: String
    @Binding var cards:Array<Card>
    @State private var CARD_POWER = [1,2,3, 0, 0,1,3]
    @State private var CARD_AMOUNT = [4,4,4, 4, 4,40,4]
    @State private var CARDS = ["spell", "spell", "spell", "recycle", "empty", "resource","cancel"]
    
   
    
   /* init(count_:Int, owner_:String){
        self.owner = owner_
        self.count = count_
    }*/
    
    
    func create() -> Array<Card>{
        for cardIndex in 0...CARDS.count-1{
            for _ in 0...CARD_AMOUNT.count-1{
                   
                self.cards.append(Card(_id:cardIndex,name: CARDS[cardIndex], power: CARD_POWER[cardIndex], owner: self.owner ))
                
            }
        }
        
      
        return self.cards
    }
    
    
    func getRandomCard() -> Card?{
        let id = Int.random(in: 0...CARDS.count-1);
        return Card(_id: id, name: CARDS[id], power: CARD_POWER[id],
                    owner: self.owner)
    }
    
    
    
   
    
    

    
  
    
        
  var body: some View {
    Group{
        Button(action:{
            if(self.cards.count < 1){
                self.cards = self.create()
            }
    }){
       Text("Create Deck")
    }
        
    
   
        if(self.cards.count > 0){
           VStack{
            ForEach(self.cards, id: \.self) { card in
                Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                   
                   }
                                         
                                         
           }
       }

        
   
    
   /* Image(self.name+self.owner)
    .renderingMode(.original)
    .resizable()
    .frame(width: 150, height:175, alignment: .center)
    .cornerRadius(30.0)
    .padding(0)*/
    
    }
            

}
}
