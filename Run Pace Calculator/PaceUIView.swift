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
    let rows: Int = 50
    @State var keyboardVisible: Bool = true

    private let keyboardWillOpen = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map { (notification) -> Bool in
            print("Keyboard opening")
            return true
        }

    private let keyboardWillHide =  NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { (notification) -> Bool in
            return false
        }

    private func subscribeToKeyboardEvents() {
        _ = Publishers.Merge(keyboardWillOpen, keyboardWillHide)
            .subscribe(on: RunLoop.main)
            .assign(to: \.keyboardVisible, on: self)
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
                VStack {
                    PacePickerUIView()
//                    .background(SwiftUI.Color.secondary)
                    List {
                        Section(header: HStack(alignment: .center) {
                            VStack {
                                Text("Dist km").font(.headline)
                            }.frame(minWidth: 0, maxWidth: .infinity/2)
                            VStack {
                                Text("4:37").font(.headline)
                            }.frame(minWidth: 0, maxWidth: .infinity/2)
                        }.padding(.vertical)) {
                            ForEach(0 ..< rows, id: \.self) { row in
                                HStack(alignment: .center) {
                                    VStack {
                                        Text("1 Km").fontWeight(.semibold)
                                    }.frame(minWidth: 0, maxWidth: .infinity/2)
                                    VStack {
                                        Text("4:37").fontWeight(.semibold)
                                    }.frame(minWidth: 0, maxWidth: .infinity/2)
                                }
                            }
                        }
                    }.listStyle(DefaultListStyle())
                    if self.keyboardVisible {
                        navigationBarItems(trailing:
                            Button("Help") {
                                UIApplication.shared.windows.forEach { $0.endEditing(true)}
                            }
                        )
                    }
                }
                .navigationBarTitle(Text("Pace Calculator"))
            }
        }
    }
}

struct PaceUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaceUIView()
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
