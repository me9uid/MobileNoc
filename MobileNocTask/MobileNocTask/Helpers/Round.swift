//
//  RoundButton.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/20/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.height / 2.0
        self.layer.masksToBounds = true
    }
}

class RoundImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.height / 2.0
        self.layer.masksToBounds = true
    }
}
