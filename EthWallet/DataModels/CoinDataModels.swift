//
//  CoinDataModels.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import Foundation

struct CoinListItemMetricsDataModel: Codable {
    let price_usd: Float
}

struct CoinListItemMetricsModel: Codable {
    let market_data: CoinListItemMetricsDataModel
}


struct CoinListItemModel: Codable,Identifiable {
    var id = UUID().uuidString
    let slug: String
    let symbol: String
    let metrics: CoinListItemMetricsModel
}

struct CoinListStatusModel: Codable {
    let elapsed: Int
    let timestamp: String
}

struct CoinListModel: Codable {
    let status: CoinListStatusModel
    let data: [CoinListItemModel]
}
