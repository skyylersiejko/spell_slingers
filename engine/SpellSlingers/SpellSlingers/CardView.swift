//
//  CardView.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 12/21/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI

enum DragInfo {
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

struct CardView : View {
    
    
    @GestureState var dragInfo = DragInfo.inactive
    var card_name:String
    var owner:String
    var power: Int
  
    init(card_name: String, owner: String, power: Int) {
        self.card_name = card_name
        self.owner = owner
        self.power = power
       
    }
    

    
    
    
    var body: some View {
      /*  let gesture = DragGesture()
            .updating($dragInfo) { (value, dragInfo, _) in
                dragInfo = .active(translation: value.translation)
              
        }
        .onChanged { value in
            
            
        }.onEnded{ value in
            
          
        }
        */
        
        
        return ZStack() {
            Image(self.card_name+self.owner).resizable()
                       .cornerRadius(10)
                       .frame(width: 200, height: 320)
            .offset(x: 0, y: 80)
                   .animation(.spring())
                .padding(.horizontal, -25)
                       
            Text(self.card_name)
                           .font(.largeTitle)
                           .bold()
                           .foregroundColor(.white)
                   }.shadow(radius: 6)
              /*  .offset(dragInfo.translation)
                .gesture(gesture)*/
            
        }
       
    }





