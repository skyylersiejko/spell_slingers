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
   
    @State var owner: String
    @State var cards:Array<Card> = []
    @Binding var items:Array<Card>
    @State private var CARD_POWER = [1,2,3, 0, 0,1,3]
    @State private var CARD_AMOUNT = [4,4,4, 4, 4,40,4]
    @State private var CARDS = ["resource", "spell", "recycle", "resolve","cancel"]

   /* init(count_:Int, owner_:String){
        self.owner = owner_
        self.count = count_
    }*/
    
    init( owner:String,items:Binding<Array<Card>>!){
        
        _items = items
        _owner = State(initialValue: owner)
        
    }
    
    
    func create() -> Array<Card>{
        for cardIndex in 0...CARDS.count-1 {
            for i in 0...CARD_AMOUNT.count-1 {
                for _ in 0...CARD_AMOUNT[i] {
                self.cards.append(Card(_id:cardIndex,name: CARDS[cardIndex], power: CARD_POWER[cardIndex], owner: self.owner ))
                }
            }
        }
        
        if(self.cards.count > 1){
          
            return self.shuffle()
           
        }else{
            return self.cards
        }
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
        print(self.cards)
        return self.cards
    }
    
    
    func chooseCard() {
        let card = self.cards.removeFirst()
        self.items.append(card)
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

            for _ in 1...7 {
                self.chooseCard()
            }
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
