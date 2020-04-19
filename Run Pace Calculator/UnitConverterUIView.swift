//
//  UnitConverterUIView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-02-19.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI

struct UnitConverterUIView: View {
    @State var name: String = "6"
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(alignment: .firstTextBaseline) {
                        Text("Mi")
                        TextField("Name's placeholder", text: $name)
                            .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                        Text("Km")
                        TextField("Name's placeholder", text: $name)
                            .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                    }
                    Divider()
                    HStack(alignment: .firstTextBaseline) {
                        Text("Mi/hr")
                        TextField("Name's placeholder", text: $name)
                            .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                        Text("Km/hr")
                        TextField("Name's placeholder", text: $name)
                            .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                    }
                    Divider()
                    Spacer()
                }.padding()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
            .navigationBarTitle(Text("Unit Converter"))
        }
    }
}

struct UnitConverterUIView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterUIView()
    }
}
