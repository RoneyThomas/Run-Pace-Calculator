//
//  PaceUIView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-02-19.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI
import Foundation

struct PaceUIView: View {
    var units = ["min/km", "min/mi"]
    @State private var selectionUnit: Int = 0
    @State private var minute_TextField: String = "4"
    @State private var second_TextField: String = "18"
    @State private var seconds: Int = 258
    fileprivate func getTime(distnace: Float) -> String {
        let interval = round((distnace+1) * Float(seconds))
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: TimeInterval(interval))!
        print(formattedString)
        return formattedString
    }
    
    var body: some View {
        let pi = Binding<Int>(get: {
            return self.selectionUnit
        }, set: {
            var interval: Int = 0
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .positional
            formatter.allowedUnits = [.minute, .second]
            if self.selectionUnit == 0 && $0 == 1{
                self.selectionUnit = $0
                interval = Int(round(1.609344 * Float(self.seconds)))
            } else if self.selectionUnit == 1 && $0 == 0 {
                self.selectionUnit = $0
                interval = Int(round(0.62137119223733 * Float(self.seconds)))
            }
            self.seconds = interval
            let formatted_string = (formatter.string(from: TimeInterval(interval))!).split(separator: ":")
            if formatted_string.count == 1 {
                self.second_TextField = String(formatted_string[0])
            } else if formatted_string.count == 2 {
                self.minute_TextField = String(formatted_string[0])
                self.second_TextField = String(formatted_string[1])
            }
        })
        return NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Picker("Units", selection: pi) {
                            ForEach(0..<units.count) { index in
                                Text(self.units[index])
                                    .tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.bottom)
                        HStack {
                            VStack {
                                TextField("5", text: $minute_TextField)
                                    .keyboardType(.numberPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            VStack {
                                TextField("36", text: $second_TextField)
                                    .keyboardType(.numberPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            VStack {
                                Button("Set Pace", action: {
                                    UIApplication.shared.endEditing()
                                    self.seconds = ((Int(self.minute_TextField) ?? 0)*60) + (Int(self.second_TextField) ?? 0)
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
                                Text("\(minute_TextField)" + ":" + "\(second_TextField)").font(.headline)
                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                        }.padding(.vertical)) {
                            if selectionUnit == 0 {
                                ForEach(0..<50, id: \.self) { index in
                                    HStack(alignment: .center) {
                                        VStack {
                                            Text("\(index + 1)").fontWeight(.semibold)
                                        }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                        VStack {
                                            Text(self.getTime(distnace: Float(index))).fontWeight(.semibold)
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
                                            Text(self.getTime(distnace: Float(index))).fontWeight(.semibold)
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
