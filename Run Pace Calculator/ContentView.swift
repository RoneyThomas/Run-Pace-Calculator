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
        ZStack {
            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
