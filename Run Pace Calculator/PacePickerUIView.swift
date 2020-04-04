//
//  PacePickerUIView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-04-03.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI

struct PacePickerUIView: View {
    var units = ["min/km", "min/mi"]
    @State private var selectionUnit = 0
    @State private var minute = "4"
    @State private var second = "38"
    var body: some View {
        VStack {
            Picker("Units", selection: $selectionUnit) {
                ForEach(0 ..< units.count) { index in
                    Text(self.units[index])
                        .tag(index)
                }
                
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
            HStack {
                TextField("5", text: $minute)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("36", text: $second)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            }.padding()

    }
}

struct PacePickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        PacePickerUIView()
    }
}
