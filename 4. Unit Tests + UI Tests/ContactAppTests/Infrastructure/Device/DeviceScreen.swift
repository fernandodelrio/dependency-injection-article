//
//  DeviceScreen.swift
//  UnitTests
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

enum DeviceScreen: String, CaseIterable {
    case iPhoneX
    case iPhone8Plus
    case iPhone8
    case iPadPro10_5inch
    case iPadPro12_9inch
    case iPadPro9_7inch
    
    func size(orientation: UIInterfaceOrientation) -> CGSize {
        let value: CGSize
        switch self {
        case .iPhoneX:
            value = CGSize(width: 375, height: 812)
        case .iPhone8Plus:
            value = CGSize(width: 414, height: 736)
        case .iPhone8:
            value = CGSize(width: 375, height: 667)
        case .iPadPro10_5inch:
            value = CGSize(width: 834, height: 1112)
        case .iPadPro12_9inch:
            value = CGSize(width: 1024, height: 1366)
        case .iPadPro9_7inch:
            value = CGSize(width: 768, height: 1024)
        }
        if orientation == .portrait || orientation == .portraitUpsideDown {
            return value
        } else {
            return CGSize(width: value.height, height: value.width)
        }
    }
}
