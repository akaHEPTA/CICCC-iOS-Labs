//
//  UIDevice+Notch.swift
//  NavbarAnimation
//
//  Created by Richard Cho on 2020-05-15.
//  Copyright © 2020 Richard Cho. All rights reserved.
//
//  Reference:
//  https://gist.github.com/cafielo/682f76ed9b526ed253b38df6f2ac0f2e#file-uidevice-notch-swift
//  https://stackoverflow.com/questions/57134259/how-to-resolve-keywindow-was-deprecated-in-ios-13-0
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
