//
//  FHStyle
//  Freqhelper
//
//  Created by Andrey Agafonov on 05/12/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation
import UIKit

class FHStyle {
    static let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static let font = UIFont.systemFontOfSize(20)

    static let rangeItemColor = UIColor(red:0.00, green:0.60, blue:0.30, alpha:1.0)
    static let rangeItemDisabledColor = UIColor(red:0.48, green:0.60, blue:0.54, alpha:1.0)
    
    // Override -intrinsicContentSize: for Auto layout code
    static func intrinsicContentSize(size:CGSize) -> CGSize {
        let width = size.width + padding.left + padding.right
        let heigth = size.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
    // Override -sizeThatFits: for Springs & Struts code
    static func sizeThatFits(size: CGSize) -> CGSize {
        let width = size.width + padding.left + padding.right
        let heigth = size.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}
