//
//  SideBarMenuValue.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/02/21.
//

import UIKit

struct SideMenuSize {
    static let headerHeight: CGFloat = 100
    static let headerImageViewFrame = CGRect(x: 20, y: 20, width: 40, height: 40)
    static let headerLabelFrame = CGRect(x: SideMenuSize.headerImageViewFrame.maxX+20, y: 20, width: 200, height: 50)
    static let labelFont = UIFont.systemFont(ofSize: 20, weight: .medium)
}

struct MainMenuSize {
    static let bannerFrame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2)
}
