//
//  CartCollectionViewModel.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/05/10.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

struct CartTableViewModel {
    let cartManager = CartManager.shared
    let data: Observable<[ShoppingCartSectionModel]>
    
//    let cartItemViewModel = CartItemViewModel()
    let cartTypeViewModel = CartTypeViewModel()
    
    // ViewModel -> ParentViewController (ShoppingcartVC)
    let tappedTypeLabel: Signal<ShoppingCartType>
    
    init() {
        self.data = cartManager.getDataObserver()
        self.tappedTypeLabel = cartTypeViewModel.tappedTypeLabel.asSignal()
    }
    
    func dataSource() -> RxTableViewSectionedReloadDataSource<ShoppingCartSectionModel> {
        let dataSource = RxTableViewSectionedReloadDataSource<ShoppingCartSectionModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                switch dataSource[indexPath.section] {
                case .cartMenuSection(items: let items):
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as? CartItemCell else { return UITableViewCell() }
                    cell.setData(data: items[indexPath.row], indexPath: indexPath)
                    return cell
                case .cartTypeSection(items: let items):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CartTypeCell.self)
                    cell.setData(type: items[indexPath.row].type)
                    cell.bind(cartTypeViewModel)
                    return cell
                case .cartPriceSection(items: let items):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CartPriceCell.self)
                    cell.setData(data: items[indexPath.row])
                    return cell
                case .cartWarningMessageSection(items: let items):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CartWarningMessageCell.self)
                    cell.setData(data: items[indexPath.row])
                    return cell
                }
            })
        return dataSource
    }
}
