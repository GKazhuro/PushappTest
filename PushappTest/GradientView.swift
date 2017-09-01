//
//  GradientView.swift
//  PushappTest
//
//  Created by Георгий Кажуро on 31.08.17.
//  Copyright © 2017 Георгий Кажуро. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable
    var firstColor : UIColor = .white
    
    @IBInspectable
    var secondColor : UIColor = .white

    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [firstColor.cgColor, secondColor.cgColor]
    }
}
