//
//  CardViewUIView.swift
//  Run Pace Calculator
//
//  Created by Roney Thomas Mannoocheril on 2020-02-19.
//  Copyright © 2020 Roney Thomas Mannoocheril. All rights reserved.
//

import SwiftUI

struct CardViewUIView: View {

    var body: some View {
        VStack {
            Text("Plain Text")
        }
//            https://www.appcoda.com/swiftui-card-view/
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
            .padding([.top, .horizontal])
    }
}

struct CardViewUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardViewUIView()
    }
}
