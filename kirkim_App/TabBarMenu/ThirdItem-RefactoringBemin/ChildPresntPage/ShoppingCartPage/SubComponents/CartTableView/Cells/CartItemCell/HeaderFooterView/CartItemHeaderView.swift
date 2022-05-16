//
//  CartItemHeaderView.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/05/12.
//

import UIKit
import SnapKit
import Reusable

class CartItemHeaderView: UITableViewHeaderFooterView, Reusable {
    private let thumbnailImageView = UIImageView()
    private let storeNameLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData( _ storeName: String, _ thumbnail: UIImage) {
        self.storeNameLabel.text = storeName
        self.thumbnailImageView.image = thumbnail
    }
    
    private func attribute() {
        
    }
    
    private func layout() {
        [thumbnailImageView, storeNameLabel].forEach {
            self.contentView.addSubview($0)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
}
