//
//  NavView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI

struct NavItemModel {
    let title: String
    let isImage: Bool
}
struct NavUIModel {
    let title: String
    let leftItem: NavItemModel?
    let rightItem: NavItemModel?
}

struct NavView: View {
    @Environment(\.colorScheme) var currentMode
    let model: NavUIModel
    var onClickedBarButton: (_ isLeft: Bool)->Void
    var body: some View {
        ZStack(alignment: .center) {
            if model.leftItem != nil {
                HStack {
                    Button(action:{
                        onClickedBarButton(true)
                    }){
                        if model.leftItem!.isImage {
                            Image(systemName: model.leftItem!.title).font(.title)
                        }
                        else {
                            Text(model.leftItem!.title).font(.system(size: 16))
                        }
                    }.padding(10)
                    Spacer()
                }
            }
            VStack {
                Spacer()
                Text(model.title).font(.system(size: 16)).foregroundColor(currentMode == .dark ? .white : .black)
                HStack {
                    Spacer()
                    Image(systemName: "circle.fill").font(.system(size: 4)).foregroundColor(.green)
                    Text("Etherem Main Network").font(.system(size: 12)).foregroundColor(currentMode == .dark ? .white : .black)
                    Spacer()
                }
                Spacer()
            }
            if model.rightItem != nil {
                HStack {
                    Spacer()
                    Button(action:{
                        onClickedBarButton(false)
                    }) {
                        if model.rightItem!.isImage {
                            Image(systemName: model.rightItem!.title)
                                .font(.title)
                        }
                        else {
                            Text(model.rightItem!.title).font(.system(size: 16))
                        }
                        
                    }.padding(10)
                }
            }
        }.frame(height: 44).accentColor(Color(red: 21.0/255.0, green: 122.0/255.0, blue: 199.0/255.0))
    }
}
