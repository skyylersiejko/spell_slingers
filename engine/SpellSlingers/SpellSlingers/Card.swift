//
//  Card.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/3/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//
//UIScreen.main.bounds.width
import Foundation
import SwiftUI



struct Card: View,Hashable{
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.offset == rhs.offset
        
            
    }
    var _id: Int
    var name: String
    var power: Int
    var owner: String
    var isCasted: Bool = false
    var isDiscard:Bool = false
    var removal: (() -> Void)?  = nil
    @State private var offset = CGSize.zero
    
    init(_id:Int, name: String, power: Int, owner:String){
        self._id = _id
        self.name = name
        self.power = power
        self.owner = owner
        
       
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self._id)
    }
    
  var body: some View {
        VStack{
            if(self.isCasted || self.isDiscard){
                Image(self.name+self.owner)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height:175, alignment: .bottomLeading)
//                .cornerRadius(30.0)
//                .padding(0)
            }else{
               
                
                        Image(self.name+self.owner)
                            .renderingMode(.original)
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                            .padding(0)
                            .frame(width:30, height: 175)
                            .offset(x: offset.width, y:offset.height)
                            .animation(.spring())
                            //.rotationEffect(.degrees(Double(offset.width / 5 )))
                           // .opacity(2-Double(abs(offset.width / 50)))
                            .gesture(DragGesture()
                            .onChanged{ gesture in
                                self.offset = gesture.translation
                        }
                        .onEnded{ _ in
                             //self.offset = .zero
                           if abs(self.offset.height) > 100{
                                //self.removal?()
                            
                            }else {
                                self.offset = .zero
                            }
                        
                    }
                        
                        )//gesture

                }
                
            }
    }
}
