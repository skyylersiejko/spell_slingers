//
//  Stack.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/9/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import Foundation

import SwiftUI

//Card : ID, name, power, owner
struct Stack: View{

    @Binding var stack:Array<Card>
//    @Binding var items: Array<Card>
    @Binding var items: Pile
    @Binding var blue_points: Int
    @Binding var red_points: Int
    


    func update(){
//        self.add()
        if(self.items.items.count > 0) {
            for i in 0...self.items.items.count{
                if(self.items.items[i].isCasted && self.items.items.contains(self.items.items[i])){
                    self.stack.insert(self.items.items[i], at: 0 )
                    self.items.remove(index: i)
            }
        }
      }
    }
    
//    func add() {
//        self.items.append(Card(_id: 10, name: "cool",power: 4, owner:"blue" ))
//    }
    
    func resolve(){
        while self.stack.count > 0{
            let card = self.stack.removeFirst()
            if (card.owner == "_blue" && card.name != "resource" ){
                switch card.name{
                    case "spell":
                            red_points -= card.power
                    case "cancel":
                        self.stack.removeFirst()
                    default:
                        break
                    
                }
            
            } else if (card.owner == "_red" && card.name != "resource")  { // we could use else, but i use for exit case
                switch card.name{
                   case "spell":
                           blue_points -= card.power
                   case "cancel":
                       self.stack.removeFirst()
                   default:
                       break
                }
                
            }else{
                print("No cards were resolved. Something went wrong...")
                break
            }
            
        } //end loop
    }
    
    
    
    
    var body: some View {
        Group{
            if(self.stack.count < 1) {
                Image("stack_pile")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height:175, alignment: .center)
                    .cornerRadius(30.0)
            } else {
                ForEach(self.stack, id: \.self) { card in
                    Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
                }
            }
        }
    }
}
