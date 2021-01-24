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

struct CardTest : View {
    
    @GestureState var dragInfo = DragInfo.inactive
    
    var body: some View {
        let gesture = DragGesture()
            .updating($dragInfo) { (value, dragInfo, _) in
                dragInfo = .active(translation: value.translation)
                
            }
        
        
        
        return ZStack {
        
            CardView(name: "cancel", color: .black, owner: "_blue")
                .offset(dragInfo.translation)
                .gesture(gesture)
        }
        .offset(x: 0, y: 80)
        .animation(.spring())
    }
}




struct CardView : View {
    
    let name: String
    let color: Color
    let owner : String
    
    var body: some View {
        ZStack {
           /* Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 210, height: 320) //w:320, height : 210 */
             
            
            Image(name+owner).resizable()
            .cornerRadius(10)
            .frame(width: 210, height: 320)
            
            Text(name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }.shadow(radius: 6)
    }
}
