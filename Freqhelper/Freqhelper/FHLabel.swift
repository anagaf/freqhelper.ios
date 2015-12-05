//
//  FHLabel
//  Freqhelper
//
//  Created by anagaf on 29/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation
import UIKit

class FHLabel : UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.font = FHStyle.font
        self.textColor = UIColor.redColor()
    }
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, FHStyle.padding))
    }
    
    // Override -intrinsicContentSize: for Auto layout code
    override func intrinsicContentSize() -> CGSize {
        return FHStyle.intrinsicContentSize(super.intrinsicContentSize())
    }
    
    // Override -sizeThatFits: for Springs & Struts code
    override func sizeThatFits(size: CGSize) -> CGSize {
        return FHStyle.sizeThatFits(super.sizeThatFits(size))
    }
}
