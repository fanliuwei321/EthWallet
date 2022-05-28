# EthWallet App for SwiftUI Demo

该工程作为Demo，主要完成 首页、扫描二维码、发送 三个页面

## 工程结构：
### 目录结构如下：
|----ViewModels  
|&emsp;|----CoinListViewModel.swift  
|----DataModels  
|&emsp;|----CoinDataModels.swift  
|----Network  
|&emsp;|----Network.swift  
|----Views  
|&emsp;|----NavView.swift  
|&emsp;|----QRScanerView.swift  
|&emsp;|----SegmentView.swift  
|&emsp;|----SendView.swift  
|&emsp;|----HomePage.swift  
|&emsp;|----CameraView.swift  
|&emsp;|----CoinListView.swift  
|&emsp;|----OptionsView.swift  
|----EthWalletApp.swift  

目录解析：
1. Views: 存储App的View
2. ViewModel: 存储供View使用的ViewModel（由于是Demo工程，故只有CoinListView使用了MVVM架构）
3. DataModels: 存储数据模型，用于Format出网络数据
4. Network: 网络请求API，接口为Network.Api.get

### 项目架构：
1. 数据交互部分使用MVVM架构，共分4层：View层，ViewModel层、DataModel层，Network(DataProvider)层，实现低耦合的目的。  
2. 对方法和类使用适当的权限控制，遵守开闭原则。
### UI层架构：
1. 细粒度拆分组件：将公用UI组件拆分为可复用组件，为UI组件创建UIModel。  
2. UIModel的使用主要体现在NavView中，支持配置title，LeftItem，RightItem。达到NavView复用目的。    
3. 部分仅用于当前页面的View组件，使用内部类+Private方式包装，不对外暴露，达到高内聚的目的。  

## 应用详情：
主要完成三个页面(首页、扫描二维码、Send页面)
### 首页：
1. 首页主要实现页面布局及数据交互部分，使用[获取代币数据列表Api https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd](https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd)获取网络数据，填充TOKENS列表
2. 列表部分使用MVVM架构实现
### 扫描二维码：
1. 实现扫描二维码页面布局
2. 主要展现SwiftUI调用UIKit组件过程，其中CameraView是由UIKit封装而来
### Send页面：
1. 实现Send页面布局



