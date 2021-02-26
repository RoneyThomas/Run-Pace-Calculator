//
//  ConversionView.swift
//  Run Pace
//
//  Created by Roney Thomas on 2021-02-24.
//

import SwiftUI

struct ConversionView: View {
    @State private var km_TextField: String = "4";
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color(UIColor.systemBackground))
                        VStack(alignment: .leading) {
                            HStack(alignment: .top){
                                Text("Distance Conversion")
                                .font(.title)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.bottom, 14)
                            HStack(alignment: .center){
                                VStack {
                                    Text("Km").font(.title3).fontWeight(.semibold)
                                }.frame(minWidth: 0, maxWidth: .infinity)
                                VStack {
                                    TextField("5", text: $km_TextField)
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                }.frame(minWidth: 0, maxWidth: .infinity)
                            }
                            HStack(alignment: .center){
                                VStack {
                                    Text("Mi").font(.title3).fontWeight(.semibold)
                                }.frame(minWidth: 0, maxWidth: .infinity)
                                VStack {
                                    TextField("5", text: $km_TextField)
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                }.frame(minWidth: 0, maxWidth: .infinity)
                            }
                        }
                        .padding(20)
                    }
                    .padding()
                }
            }
            Spacer()
            Text("dsfsdf")
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
