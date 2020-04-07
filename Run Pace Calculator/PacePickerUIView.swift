//
//  PacePickerUIView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-04-03.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI
import Combine

struct PacePickerUIView: View {
    @Binding var minute: String
    @Binding var second: String
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("5", text: $minute)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.frame(minWidth: 0, maxWidth: .infinity)
                VStack {
                    TextField("36", text: $second)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.frame(minWidth: 0, maxWidth: .infinity)
                VStack {
                    Button("Set Pace", action: {
                        UIApplication.shared.endEditing()
                        print(self.minute, self.second)
                    })
                }.frame(minWidth: 0, maxWidth: .infinity)
            }
        }.padding()
    }
}

struct PacePickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        PacePickerUIView(minute: .constant("4"), second:.constant("18"))
    }
}

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    
}
