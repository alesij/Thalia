//
//  Homescreen.swift
//  Thalia
//
//  Created by Jonathan Ng on 23/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI

struct Homescreen: View {
   
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "lable")]
        
        
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Recents()
                        .padding(.bottom, 35.0)
                        .animation(.default)
                    Spacer()
                    AllPlays()
                        .animation(.default)
                }
            }
            .navigationBarTitle(Text("Thalia")
            , displayMode: .automatic)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        print("Search button pressed")
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(Font.title)
                        }
//                        delete this after adding this functionality
                    .disabled(true)
                        
                        
                    .shadow(radius: 20, x: 0, y: 20)
                    .padding()
                    Spacer()
                    Button(action: {
                        print("Plus button pressed")
                    }) {
                        Image(systemName: "plus")
                            .font(Font.title)
                    }
//                        delete this after adding this functionality
                    .disabled(true)
                        
                        
                    .shadow(radius: 20, x: 0, y: 20)
                    .padding()
                    
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen().previewDevice("iPad Air 2")
    }
}
