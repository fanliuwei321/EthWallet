//
//  HomePage.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI

fileprivate let navUIModel = NavUIModel(title: "Wallet", leftItem: NavItemModel(title: "line.horizontal.3", isImage: true), rightItem: NavItemModel(title: "qrcode.viewfinder", isImage: true))
struct HomePage: View {
    @State private var selectedIndex: Int = 0
    @State private var presentScanKey = false
    @State private var presentSendKey = false
    
    private struct UserInfoView: View {
        var body: some View {
            VStack(spacing: 8) {
                Image("av").resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .background(Circle().stroke(Color.accentColor, lineWidth: 3)).scaledToFill()
                Text("Louis").font(.system(size: 18))
                Text("$1000.00").font(.system(size: 16))
                Text("0xaf00dd99ddffddff").font(.system(size: 12)).padding(8).background(Color.accentColor.opacity(0.2)).cornerRadius(20)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavView(model: navUIModel) { isLeft in
                        if !isLeft {
                            self.presentScanKey.toggle()
                        }
                    }
                    UserInfoView()
                    OptionsView { _, index in
                        if index == 2 {
                            self.presentSendKey.toggle()
                        }
                    }.padding(10)
                    SegmentView(selectedIndex: $selectedIndex) // Tab bar for TOKENS and NFTs
                    TabView(selection: $selectedIndex) {
                        CoinListView().tag(0)
                        CoinListView().tag(1)
                    }.tabViewStyle(
                        PageTabViewStyle(indexDisplayMode: .never))
                    Spacer().navigationBarHidden(true)
                }.accentColor(Color(red: 21.0/255.0, green: 122.0/255.0, blue: 199.0/255.0))
                .fullScreenCover(isPresented: $presentScanKey, content: {
                    QRScanerView()
                })
                .fullScreenCover(isPresented: $presentSendKey, content: {
                    SendView()
                })
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
