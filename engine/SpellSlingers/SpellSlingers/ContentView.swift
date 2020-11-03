//
//  ContentView.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/2/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//


import SwiftUI

struct ContentView: View {

    @State  private var POWERA = 0
    @State private var POWERB = 0
    @State private var CURRENT_COLOR = "_blue"
    var deck = Deck(count_:64, owner_:"_blue")
   
   
    
    

    
    
   
    var body: some View {
        
   
       
        ZStack{
            
           
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //Image("")
                Spacer()
            
            
             
                   
                   HStack{
                      Text("HASTACK")
                    Text(String(self.deck.cards.count))
                    
                     
                      
                  }
                
               
                       
                   }
                
                Spacer()
                Spacer()
            
          
                
                
                Button(action:{
                    if(Int.random(in:0...1) < 1){
                        self.CURRENT_COLOR = "_red"
                    }else{
                         self.CURRENT_COLOR = "_blue"
                    }
                    self.deck.create();
                    
                    
                     /*
                        let id = Int.random(in: 0...self.CARDS.count-1);
                        self.cards.append( Card(_id: id, name: self.CARDS[id],  power: self.CARD_POWER[id],owner: self.CURRENT_COLOR))
                    
                    */
                  
                    
                }){
                    
                    
                   Image("back")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height:175, alignment: .center)
                    .cornerRadius(30.0)
                }.padding()
                Spacer()
                
                HStack{
                    VStack{
                        Text("player")
                        Text(String(self.POWERA))
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    Spacer()
                    VStack{
                        Text("CPU")
                        Text(String(self.POWERB))
                    }
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
                    
                    
                }///h
                Spacer()
                
                   }//v
        }
        
       
       
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
