//
//  SendView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI
fileprivate let navUIModel = NavUIModel(title: "Send to", leftItem: nil, rightItem: NavItemModel(title: "Cancel", isImage: false))



struct SendView: View {
    @State private var inputMessage: String = ""
    @FocusState private var focusedField: Bool
    // For dismiss this view
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            NavView(model: navUIModel) { isLeft in
                self.presentationMode.wrappedValue.dismiss()
            }
            Button(action:{
                print("clicked")
            }){
                HStack {
                    Text("From:").padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 20)).foregroundColor(.black).font(.system(size: 16)).frame(width: 80)
                    HStack {
                        Image("av").resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            .clipShape(Circle())
                            .background(Circle().stroke(Color.accentColor, lineWidth: 2)).scaledToFill()
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Louis").padding(EdgeInsets(top: 4, leading: 0, bottom: 2, trailing: 0)).foregroundColor(.black).font(.system(size: 14))
                            Text("Balance:0ETH").padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                                .foregroundColor(.gray).font(.system(size: 12))
                        }
                        Spacer()
                        Image(systemName: "arrowtriangle.down.fill").padding(10).foregroundColor(.black)
                    }.overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                                
                    )
                }
            }.padding(10)
            
            HStack {
                Text("To:").padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 20)).font(.system(size: 16)).frame(width: 80)
                HStack {
                    TextField("Search,public address (0x),or NES", text:$inputMessage).font(.system(size: 16)).padding(10).focused($focusedField).onAppear {
                        focusedField.toggle()
                    }
                    Spacer()
                    Image(systemName: "qrcode.viewfinder").padding(10).foregroundColor(.black)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
                            
                )
            }.padding(10)
            Spacer()
        }.accentColor(Color(red: 21.0/255.0, green: 122.0/255.0, blue: 199.0/255.0))
    }
}

