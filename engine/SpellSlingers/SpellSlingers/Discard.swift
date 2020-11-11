//
//  Discard.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/9/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//


import Foundation
import Foundation

import SwiftUI

//Card : ID, name, power, owner
struct Discard: View{

    @Binding var discard:Array<Card>
    @Binding var items: Array<Card>
    @State private var OPEN = false
    
    


    func update(){
        for i in 0...self.items.count{
            if(self.items[i].isCasted && self.items.contains(self.items[i])){
                self.discard.append(self.items[i])
                self.items.remove(at:i)
            }
        }
    }
    
    func showAllDiscard() -> AnyView{
            return  AnyView(HStack{
                  ForEach(self.discard, id: \.self) { card in
                     Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
          
                  }
              })
          
    }
    
    
    
    func toggle() {
        //toggle true or false
        self.OPEN = self.OPEN ? false : true
    }
    
    
    
    
    
    
    
    var body: some View {
        Group{
            if(self.discard.count > 0){
                ZStack{
                    ForEach(self.discard, id: \.self) { card in
                       Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
            
                    }
                }
                
                
                Button(action: {
                    self.toggle()
                }){
                    if(self.OPEN){
                        self.showAllDiscard()
                        Text("Close Discard")
                    }else{
                        Text("Open Discard")
                    }
                }
                
                if(self.OPEN){
                    self.showAllDiscard()
                }else{
                          
                }
                
            }
        }
    }

}
