//
//  CoinListViewModel.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import Foundation
import SwiftUI

fileprivate let url = URL(string: "https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd")

final class CoinListViewModel: ObservableObject {
    /// Send fetch state to subscripter
    @Published var isFetching = false
    
    /// Send fetch result to subscripter
    @Published var coinListDatas: [CoinListItemModel] = [CoinListItemModel]()
    
    func fetchDatas() {
        isFetching = true
        Network.Api.get(url!, nil, CoinListModel.self) { data, error in
            self.isFetching = false
            guard error == nil, let items = data?.data else {
                return
            }
            self.coinListDatas = items
        }
    }
}
