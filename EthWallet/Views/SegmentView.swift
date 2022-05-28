//
//  SegmentView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI

fileprivate struct SegmentItem: Identifiable {
    let id = UUID().uuidString
    let title: String
    let index: UInt
}

fileprivate let SegmentItems = [
    SegmentItem(title: "TOKENS", index: 0),
    SegmentItem(title: "NFTs", index: 1)
]

struct SegmentView: View {
    @Binding var selectedIndex: Int
    @Namespace var animation
    
    private struct SegmentItemView: View {
        var model: SegmentItem
        @Binding var currentIndex: Int
        var onTapped: ()->Void
        var body: some View {
            Button {
                onTapped()
            } label: {
                Text(model.title).font(.system(size: 14)).bold()
                    .foregroundColor(currentIndex == model.index ? Color.accentColor : .gray)
            }.frame(maxWidth: .infinity)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0 ..< SegmentItems.count) { i in
                    let item = SegmentItems[i]
                    VStack {
                        SegmentItemView(model: item, currentIndex: $selectedIndex) {
                            withAnimation{
                                selectedIndex = i
                            }
                        }.frame(height:20)
                        Spacer()
                        if selectedIndex == i {
                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(height:3)
                                .matchedGeometryEffect(id: "animation", in: animation)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 3)
                        }
                    }.frame(height: 23)
                }
            }
        }
    }
}

