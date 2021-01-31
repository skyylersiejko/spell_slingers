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
    public var isActive: Bool = false
    @State var cardView: CardView?
    
    mutating func getActive() -> Bool{
        print( "stuff",((self.cardView?.isActive) != nil))
            self.isActive = ((self.cardView?.isActive) != nil)
        return self.isActive
        
    }
    
    
    func load(){
        self.cardView = CardView(card_name:self.name, owner:self.owner, power:self.power)
    }
    
    var body: some View {
        VStack {
           /* Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 210, height: 320) //w:320, height : 210 */
           
            self.cardView
           
        } .onAppear{
            self.load()
        }
        
    }
}

