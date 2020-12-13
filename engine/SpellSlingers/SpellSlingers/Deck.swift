//
//  Deck.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/3/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation

import SwiftUI


@propertyWrapper struct Field<T> {
    var wrappedValue: T
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}








//Card : ID, name, power, owner
struct Deck: View{
   
    @State var owner: String = "_blue"
    @State var cards:Array<Card> = []
    @Binding var hand:Pile
    @State private var CARD_POWER = [1,2,3, 0, 0,1,3]
    @State private var CARD_AMOUNT = [4,4,4, 4, 4,40,4]
    @State private var CARDS = ["resource", "spell", "recycle", "resolve","cancel"]

  
    func create() -> Array<Card>{
        for cardIndex in 0..<CARDS.count {
            for i in 0..<CARD_AMOUNT.count {
                for _ in 0...CARD_AMOUNT[i] {
                self.cards.append(Card(_id:cardIndex,name: CARDS[cardIndex], power: CARD_POWER[cardIndex], owner: self.owner ))
                }
            }
        }
        
        if(self.cards.count > 1){
            self.chooseCard()
//            print("cards count : ",self.cards.count)
            return self.shuffle()
           
        }else{
            self.cards = self.shuffle()
            print(self.cards)
        }
//        print("cards count : ",self.cards.count)
        return self.cards
    }
    
    
    func getRandomCard() -> Card?{
        let id = Int.random(in: 0...CARDS.count-1);
        return Card(_id: id, name: CARDS[id], power: CARD_POWER[id],
                    owner: self.owner)
    }
    
    
    func shuffle() -> Array<Card>{
        var newDeck:Array<Card> = []
        while(self.cards.count > 0){
            let i = Int.random(in: 0..<self.cards.count)
            let card = self.cards[i]
            newDeck.append(card)
            self.cards.remove(at: i )
        }
        
        self.cards = newDeck
        return self.cards
    }
    
    
    func chooseCard() {
        if(self.cards.count > 0){
            print("choose",self.cards.count)
            let card = self.cards.removeFirst()
        
            print("card to add",card.name)
//            print(" remove card", card)
            hand.push(card)
//            print("items", self.hand.items)
        }
    }
    
    
  
    

  var body: some View {
    Group{
        Button(action:{
//            if(self.)
            self.chooseCard()
        }) {
            ZStack {
                Image("back")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height:175, alignment: .center)
                    .cornerRadius(30.0)
                
                }.padding()
        }
    }.onAppear {
        if(self.cards.count < 1){
            self.cards = self.create()
        }
    }
//        Button(action:{
//            if(self.cards.count < 1){
//                self.cards = self.create()
//            }
//    }){
//       Text("Create Deck")
//    }
//
//        if(self.cards.count > 0){
//           HStack{
//            ForEach(self.cards, id: \.self) { card in
//                Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
//
//                   }
//           }
//       }

    
   /* Image(self.name+self.owner)
    .renderingMode(.original)
    .resizable()
    .frame(width: 150, height:175, alignment: .center)
    .cornerRadius(30.0)
    .padding(0)*/
    
    }

}
//}
