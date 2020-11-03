//
//  ContentView.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/2/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    @State private var cardIndexA = 2
    @State private var cardIndexB = 2
    @State  private var POWERA = 0
    @State private var POWERB = 0
    @State private var CURRENT_COLOR = "_blue"
    @State private var CARDS = ["spell", "spell", "spell", "recycle", "empty", "resource","cancel"]
    @State private var CARD_POWER = [1,2,3, 0, 0,1,3]
    @State private var cards:Array<Card> = []
   
    
    
    
   func getRandomCard() -> Card?{
    let id = Int.random(in: 0...CARDS.count-1);
    return Card(_id: id, name: CARDS[id], power: CARD_POWER[id],
        owner: CURRENT_COLOR)
    }
    
    
   
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
                        
                                         
                      if(self.cards.count > 0){
                          
                        ZStack(alignment: .leading) {
                          ForEach(self.cards, id: \.self) { card in
                              Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                               
                               
                             }
                             Spacer()
                         }
                         
                      }
                      
                  }
                
               
                       
                   }
                
                Spacer()
                Spacer()
            
            /*
             
             Button(action: {
             
             handler logic
             }){
             
             UI rerender With
             }
             
             
             
             
             */
                
                
                
                Button(action:{
                    if(Int.random(in:0...1) < 1){
                        self.CURRENT_COLOR = "_red"
                    }else{
                         self.CURRENT_COLOR = "_blue"
                    }
                 
                    
                        
                        let id = Int.random(in: 0...self.CARDS.count-1);
                        self.cards.append( Card(_id: id, name: self.CARDS[id],  power: self.CARD_POWER[id],owner: self.CURRENT_COLOR))
                    
                    
                  
                    
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





struct Card: View, Hashable {
    var _id: Int
    var name: String
    var power: Int
    var owner: String
    
    init(_id:Int, name: String, power: Int, owner:String){
        self._id = _id
        self.name = name
        self.power = power
        self.owner = owner
    }
    
  
    
        
  var body: some View {
    
    
    Image(self.name+self.owner)
    .renderingMode(.original)
    .resizable()
    .frame(width: 150, height:175, alignment: .center)
    .cornerRadius(30.0)
    .padding(0)
    
    }
            
}


    


    
    
/*func drawOnImage(_image: UIImage) -> UIImage{
         
         // Create a context of the starting image size and set it as the current one
         UIGraphicsBeginImageContext(_image.size)
         
         // Draw the starting image in the current context as background
         _image.draw(at: CGPoint.zero)

         // Get the current context
         let context = UIGraphicsGetCurrentContext()!

         // Draw a red line
         context.setLineWidth(2.0)
         context.setStrokeColor(UIColor.red.cgColor)
         context.move(to: CGPoint(x: 100, y: 100))
         context.addLine(to: CGPoint(x: 200, y: 200))
         context.strokePath()
         
         // Draw a transparent green Circle
         context.setStrokeColor(UIColor.green.cgColor)
         context.setAlpha(0.5)
         context.setLineWidth(10.0)
         context.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
         context.drawPath(using: .stroke) // or .fillStroke if need filling
         
         // Save the context as a new UIImage
        
         
         // Return modified image
        
    }*/



    
    
    




class Deck {
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
