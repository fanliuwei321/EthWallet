//
//  CoinListView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI
import UIKit


struct LoadingView: UIViewRepresentable {
    var isAnimating: Bool
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        }
        else {
            uiView.stopAnimating()
        }
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    
}

struct CoinListView: View {
    @ObservedObject var viewModel = CoinListViewModel()
    private struct CoinListItemView: View {
        let model: CoinListItemModel
        var body: some View {
            HStack(spacing: 10) {
                Image("av").resizable().frame(width: 60, height: 60, alignment: .center).padding(10)
                VStack(alignment: .leading, spacing: 10) {
                    Text(model.symbol)
                    Text("\(model.metrics.market_data.price_usd)")
                }
                Spacer()
            }
        }
    }
    
    var body: some View {
        ZStack {
            List (viewModel.coinListDatas) { model in
                CoinListItemView(model: model).listRowInsets(EdgeInsets())
            }.listStyle(.plain)
            .onAppear {
                fetchDatas()
            }
            LoadingView(isAnimating: viewModel.isFetching)
        }
    }
    func fetchDatas() {
        if viewModel.isFetching {
            return
        }
        viewModel.fetchDatas()
    }
}

