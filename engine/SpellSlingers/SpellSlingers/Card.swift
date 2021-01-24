//
//  Card.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 1/23/21.
//  Copyright © 2021 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI


struct Card : View {
    
    let name: String
    let power: Int
    let owner : String
    
    var body: some View {
        ZStack {
           /* Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 210, height: 320) //w:320, height : 210 */
             
            CardView(card_name:self.name, owner:self.owner, power:self.power)
            
           
        }.shadow(radius: 6)
    }
}

