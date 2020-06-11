//
//  ContentView.swift
//  Thalia
//
//  Created by Samuel Kebis on 21/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Homescreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPad Air 2")
    }
}
