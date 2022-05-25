//
//  SideMenuView+Protocol.swift
//  kirkim_App
//
//  Created by 김기림 on 2022/03/23.
//

import UIKit

enum SideMenuSection: Int {
    case one
    case two
    case three
    static var count: Int {
        return 3
    }
}

protocol SideMenuViewProtocol {
    static var sideMenuViewInfo: SideMenuViewInfo { get }
}

enum UIType {
    case xib
    case onlyCode(className: UIViewController)
}

struct SideMenuViewInfo {
    var uiType: UIType
    var thumnailImage: String?
    var mainTitle: String?
    var section: SideMenuSection?
    var identifier: String?
}
