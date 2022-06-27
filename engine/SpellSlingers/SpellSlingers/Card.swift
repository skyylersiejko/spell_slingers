//
//  Card.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 1/23/21.
//  Copyright © 2021 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI

enum Dragable {
    case inactive
    case active(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .active(let t):
            return t
        }
    }
    
    var isActive: Bool {
        switch self {
        case .inactive: return false
        case .active: return true
        }
    }
}


struct Card : View {
    
    let name: String
    let power: Int
    let owner : String
    @State private var isActive: Bool = false
    @State var cardView: CardView?
    @GestureState var dragable = Dragable.inactive
    
    func getActive() -> Bool{
        print("get", self.isActive)
        return self.isActive
        
    }
    
    
    func load(){
        self.cardView = CardView(card_name:self.name, owner:self.owner, power:self.power)
    }
    
    var body: some View {
        
       let gesture = DragGesture()
           .updating($dragable) { (value, dragInfo, _) in
               dragInfo = .active(translation: value.translation)
           
             
       }
       .onChanged { value in
        self.isActive = true
          print("cast card", self.isActive)
       }.onEnded{ value in
           
        self.isActive = false
        print("cast end", self.isActive)
       }
       
      return   VStack {
           /* Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 210, height: 320) //w:320, height : 210 */
           
            self.cardView
           
        } .onAppear{
            self.load()
        }  .offset(dragable.translation)
                       .gesture(gesture)
        
    }
}

