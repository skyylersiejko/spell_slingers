//
//  Hand.swift
//  SpellSlingers
//
//  Created by Shreyas Ramanujam on 11/8/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI

//
//  test.swift
//  SpellSlingers
//
//  Created by Shreyas Ramanujam on 12/13/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import SwiftUI

class Hand: ObservableObject {
    @Published var value=Pile()
}


//struct Hand: View{
//    @State var cards:Array<Card> = []
//
//    func addToHand(card: Card) {
//        self.cards.append(card)
//    }
//
//    func removeFromHand(card: Card) {
//        //remove from hand
//    }
//
////    func addToHand
//    var body: some View {
//        Group {
//            if(self.cards.count > 0){
//                /*HStack{
//                 ForEach(self.cards, id: \.self) { card in
//                    Card(_id: card._id, name: card.name,power:card.power, owner:card.owner )
//                 }
//              }*/
//        }
//    }
//  }
//}
