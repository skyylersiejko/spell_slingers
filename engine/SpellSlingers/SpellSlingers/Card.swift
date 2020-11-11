//
//  Card.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/3/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI


struct Card: View, Hashable {
    var _id: Int
    var name: String
    var power: Int
    var owner: String
    var isCasted: Bool = false
    var isDiscard:Bool = false
    
    init(_id:Int, name: String, power: Int, owner:String){
        self._id = _id
        self.name = name
        self.power = power
        self.owner = owner
    }
    
  var body: some View {
        Group{
            Image(self.name+self.owner)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height:175, alignment: .bottomLeading)
            .cornerRadius(30.0)
            .padding(0)
        }
    }
}
