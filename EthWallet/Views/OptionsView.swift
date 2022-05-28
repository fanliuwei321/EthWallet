//
//  OptionsView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI

fileprivate let options: [OptionItemModel] = [
    OptionItemModel(image: "arrow.down.to.line.alt", text: "Receive"),
    OptionItemModel(image: "creditcard", text: "Buy"),
    OptionItemModel(image: "arrow.up.right", text: "Send"),
    OptionItemModel(image: "arrow.left.arrow.right", text: "Swap")
]

struct OptionItemModel: Identifiable {
    let id = UUID().uuidString
    let image: String
    let text: String
}

struct OptionsView: View {
    var onTappedItem: (_ model: OptionItemModel, _ index: Int)->Void
    private struct OptionItemView: View {
        var model: OptionItemModel
        var tappedCallback: ()->Void
        var body: some View {
            Button(action: {
                tappedCallback()
            }) {
                VStack {
                    Image(systemName: model.image).resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(14)
                        .background(Color.accentColor).cornerRadius(40).foregroundColor(.white)
                    Text(model.text).font(.system(size: 12))
                }
            }
        }
    }
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0 ..< options.count) {i in
                let item = options[i]
                OptionItemView(model: item) {
                    onTappedItem(item, i)
                }
            }
        }
    }
}
