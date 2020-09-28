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
    var distance_km = ["1", "2", "3", "4", "5k", "6", "7", "8", "9", "10k", "11", "12", "13", "14", "15", "16", "10 mi", "17", "18", "19", "20", "21", "1/2 Marathon", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "Marathon", "43", "44", "45", "46", "47", "48", "49", "50k"]
    var distance_mi = ["1", "2", "3", "5k", "4", "5", "6", "10k", "7", "8", "9", "10 mi", "11", "12", "13", "1/2 Marathon", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "Marathon", "27", "28", "29", "30", "31", "50k"]
    @State private var selectionUnit: Int = UserDefaults.standard.integer(forKey: "selectionUnit")
    @State private var minute_TextField: String = UserDefaults.standard.object(forKey: "minutes_text") as? String ?? "4"
    @State private var second_TextField: String = UserDefaults.standard.object(forKey: "seconds_text") as? String ?? "36"
    @State private var seconds: Int = UserDefaults.standard.integer(forKey: "seconds") == 0 ? 258 : UserDefaults.standard.integer(forKey: "seconds")
    @State private var saved: Bool = false
    
    
    
    fileprivate func getTime(distnace: Float) -> String {
        let interval = round((distnace + 1) * Float(seconds))
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: TimeInterval(interval))!
        print(formattedString)
        return formattedString
    }
    
    var body: some View {
        let pickerSelection = Binding<Int>(get: {
            return self.selectionUnit
        }, set: {
            var interval: Int = 0
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .positional
            formatter.allowedUnits = [.minute, .second]
            if self.selectionUnit == 0 && $0 == 1 {
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
                UserDefaults.standard.set(self.second_TextField, forKey: "seconds_text")
            } else if formatted_string.count == 2 {
                self.minute_TextField = String(formatted_string[0])
                UserDefaults.standard.set(self.minute_TextField, forKey: "minutes_text")
                self.second_TextField = String(formatted_string[1])
                UserDefaults.standard.set(self.second_TextField, forKey: "seconds_text")
            }
            UserDefaults.standard.set(self.selectionUnit, forKey: "selectionUnit")
        })
        return NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Picker("Units", selection: pickerSelection) {
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
                                    self.seconds = ((Int(self.minute_TextField) ?? 0) * 60) + (Int(self.second_TextField) ?? 0)
                                    UserDefaults.standard.set(self.minute_TextField, forKey: "minutes_text")
                                    UserDefaults.standard.set(self.second_TextField, forKey: "seconds_text")
                                    UserDefaults.standard.set(self.seconds, forKey: "seconds")
                                    UserDefaults.standard.set(self.selectionUnit, forKey: "selectionUnit")
                                }).foregroundColor(Color(UIColor.orange))
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
                                    ForEach(0..<distance_km.count, id: \.self) { index in
                                        HStack(alignment: .center) {
                                            VStack {
                                                Text(self.distance_km[index]).fontWeight([4,9,16,22,44,52].contains(index) ? .bold : .semibold)
                                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                            VStack {
                                                Text(self.getTime(distnace: Float(index))).fontWeight(.semibold)
                                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                        }.listRowBackground([4,9,16,22,44,52].contains(index) ? Color(UIColor.systemGray3) : Color(UIColor.systemBackground))
                                    }
                                } else {
                                    ForEach(0..<distance_mi.count, id: \.self) { index in
                                        HStack(alignment: .center) {
                                            VStack {
                                                Text(self.distance_mi[index]).fontWeight([3,7,11,15,29,35].contains(index) ? .bold : .semibold)
                                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                            VStack {
                                                Text(self.getTime(distnace: Float(index))).fontWeight(.semibold)
                                            }.frame(minWidth: 0, maxWidth: .infinity / 2)
                                        }.listRowBackground([3,7,11,15,29,35].contains(index) ? Color(UIColor.systemGray3) : Color(UIColor.systemBackground))
                                    }
                                }
                            }
                        }.listStyle(InsetListStyle())
                }
            }
            .navigationBarTitle(Text("Pace Calculator"))
//            .navigationBarItems(
//                trailing: Button(action:{self.saved = !self.saved}) {
//                    self.saved ? Image(systemName: "star.fill") : Image(systemName: "star")
//                }
//            )
        }
    }
}

struct PaceUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaceUIView()
    }
}

