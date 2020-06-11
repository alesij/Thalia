//
//  Recents.swift
//  Thalia
//
//  Created by Jonathan Ng on 23/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI

struct Recents: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recents")
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .padding(.leading, 25.0)
                .foregroundColor(Color("lable"))
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack {
                    
                    NavigationLink(destination: DetailView()) {
                        CollectionViewCell(imageName: "romeojuliet", playName: "Romeo and Juliet")
                    }
                    
                    Spacer()
                    CollectionViewCell(imageName: "hamlet", playName: "Hamlet")
                    
                    Spacer()
                    CollectionViewCell(imageName: "gatsby", playName: "The Great Gatsby")
                    
                    Spacer()
                    CollectionViewCell(imageName: "doubt", playName: "Doubt")
                    
                    Spacer()
                    CollectionViewCell(imageName: "salesman", playName: "Life of a Salesman")
                    
                }
                
                
            }.padding(.vertical)
        }
    }
}

struct CollectionViewCell: View {
    
    var imageName: String
    var playName: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16.0) {
            Image(imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 180)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
            
            HStack {
                Spacer()
                Text(playName)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("lable"))
                Spacer()
            }
        }.padding(.horizontal, 10.0)
    }
    
}


struct Recents_Previews: PreviewProvider {
    static var previews: some View {
        Recents().previewDevice("iPad Air 2")
    }
}
