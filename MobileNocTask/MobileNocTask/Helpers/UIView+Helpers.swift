//
//  UIView+Helpers.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/20/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius}
        set { layer.cornerRadius =  newValue
            layer.masksToBounds = newValue > 0 }
    }
}
