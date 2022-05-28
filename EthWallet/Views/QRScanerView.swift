//
//  QRScanerView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI

struct QRScanerView: View {
    // For dismiss this view
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            VStack {
                CameraView()
                Spacer().navigationBarHidden(true).statusBar(hidden: true)
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark").foregroundColor(.white).font(.system(size: 20)).frame(width: 30, height: 40, alignment: .center).opacity(0.6)
                    }.padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 20))
                }
                Spacer()
            }
            VStack {
                Image(systemName: "viewfinder").font(.system(size: 200)).foregroundColor(.white).opacity(0.6)
                Text("Scanning...").foregroundColor(.white).font(.system(size: 16)).opacity(0.6)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

