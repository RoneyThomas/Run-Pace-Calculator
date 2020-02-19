//
//  ContentView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-02-19.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            PaceUIView()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Running Pace")
                    }
                }
                .tag(0)
            UnitConverterUIView()
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Unit Converter")
                    }
                }
                .tag(1)
//            Text("Third View")
//            .font(.title)
//            .tabItem {
//                VStack {
//                    Image("first")
//                    Text("Settings")
//                }
//            }
//            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
