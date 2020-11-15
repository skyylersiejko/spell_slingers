//
//  ContentView.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/2/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//


import SwiftUI

struct ContentView: View {

    @Binding var ViewState: Int
   
var body: some View {

        Group{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
           
           
                  /* Image("back")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height:175, alignment: .center)
                    .cornerRadius(30.0)*/
                  
                Spacer()
            
           
            MakeView {
                       switch self.ViewState {
                       case 0:
                           return AnyView(Menu())
                       case 1:
                        Game().start()
                        return AnyView(Game())
                       case 2:
                        return AnyView(Menu())
                       default:
                        return AnyView(Menu())
                       }
            }
                
            
              
                    /*.padding(.leading, 20)
                    .foregroundColor(.white)*/
                    
                Spacer()
    
    }
    
    }

    struct ContentView_Previews: PreviewProvider {
       
        static var previews: some View {
            StatefulPreview(0) {ContentView(ViewState: $0)}
           
        }
    }
}



struct MakeView: View {
    let make: () -> AnyView

    var body: some View {
        make()
    }
}
