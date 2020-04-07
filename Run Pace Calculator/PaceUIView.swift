//
//  PaceUIView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-02-19.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI
import Combine

struct PaceUIView: View {
    var units = ["min/km", "min/mi"]
    @State private var selectionUnit: Int = 0
    @State private var minute: String = "4"
    @State private var second: String = "18"
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Picker("Units", selection: $selectionUnit) {
                            ForEach(0..<units.count) { index in
                                Text(self.units[index])
                                    .tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.bottom)
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
                                })
                            }.frame(minWidth: 0, maxWidth: .infinity)
                        }
                    }.padding()
                    List {
                        Section(header: HStack(alignment: .center) {
                            VStack {
                                Text("Dist \(selectionUnit == 0 ? "km" : "mi")").font(.headline)
                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                            VStack {
                                Text("\(minute)" + ":" + "\(second)").font(.headline)
                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                        }.padding(.vertical)) {
                            if selectionUnit == 0 {
                                ForEach(0..<50, id: \.self) { index in
                                    HStack(alignment: .center) {
                                        VStack {
                                            Text("\(index + 1)").fontWeight(.semibold)
                                        }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                        VStack {
                                            Text("\(self.minute):\(self.second)").fontWeight(.semibold)
                                        }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                    }
                                }
                            } else {
                                ForEach(0..<35, id: \.self) { index in
                                    HStack(alignment: .center) {
                                        VStack {
                                            Text("\(index + 1)").fontWeight(.semibold)
                                        }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                        VStack {
                                            Text("\(self.minute):\(self.second)").fontWeight(.semibold)
                                        }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                    }
                                }
                            }
                        }
                    }.listStyle(DefaultListStyle())
                }
                //                    navigationBarItems(trailing:
                //                        Button("Help") {
                //                            UIApplication.shared.windows.forEach { $0.endEditing(true)}
                //                        }
                //                        .modifier(AdaptsToSoftwareKeyboard())
                //                    )
            }
                .navigationBarTitle(Text("Pace Calculator"))
        }
    }
}

struct PaceUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaceUIView()
    }
}
