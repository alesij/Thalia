//
//  AllPlays.swift
//  Thalia
//
//  Created by Jonathan Ng on 23/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI

struct AllPlays: View {
    init() {
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Plays")
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .padding(.leading, 25.0)
                .foregroundColor(Color("lable"))
            HStack {
                PlayCell(playName: "Angels in America")
                Spacer()
                PlayCell(playName: "Antigone")
                Spacer()
                PlayCell(playName: "Doubt")
            }
            HStack {
                PlayCell(playName: "Hamlet")
                Spacer()
                PlayCell(playName: "Jack the Ripper")
                Spacer()
                PlayCell(playName: "Les Miserables")
            }
            HStack {
                PlayCell(playName: "Life of Pi")
                Spacer()
                PlayCell(playName: "Life of a Salesman")
                Spacer()
                PlayCell(playName: "Macbeth")
            }
            HStack {
                PlayCell(playName: "Noise Off")
                Spacer()
                PlayCell(playName: "Romeo and Juliet")
                Spacer()
                PlayCell(playName: "The Great Gatsby")
            }
            HStack {
                PlayCell(playName: "The Lion King")
                Spacer()
                PlayCell(playName: "The Seagull")
                Spacer()
                PlayCell(playName: "Wicked")
            }
            
        }
    }
}

struct PlayCell: View{
    
    var playName: String
    var body: some View{
        
        VStack {
            Image(systemName: "doc.circle.fill")
//                change this after adding functionality
                .foregroundColor(Color("IconColor"))
                
                .font(Font.system(size: 60.0))
                .padding()
            HStack {
                Spacer()
                Text(playName)
//                    change this after adding functionality
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("lable"))
                Spacer()
            }.padding()
            .disabled(true)

        }
        .padding(30.0)
        
        
    }
}

struct AllPlays_Previews: PreviewProvider {
    static var previews: some View {
        AllPlays().previewDevice("iPad Air 2")
    }
}
