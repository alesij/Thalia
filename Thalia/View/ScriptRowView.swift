//
//  ScriptRowView.swift
//  Thalia
//
//  Created by Samuel Kebis on 05/03/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI

struct ScriptRowView: View {
    var sentence: Sentence
    var isSelected: Bool
    var audioExist: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            Text(sentence.character + ":")
                .font(.title)
                .fontWeight(.ultraLight)
                .padding(.leading)

            Text(sentence.line)
                .font(.title)
                .fontWeight(.semibold)

            Spacer()
            VStack {
                if audioExist {
                    Image(systemName: "recordingtape").foregroundColor(Color("tapeIconColor"))
                } else {
                    Spacer()
                }
            }.frame(width: 30)
        }
        .padding()
        .background(isSelected ? Color("Highlighter") : Color.clear)
    }
}
