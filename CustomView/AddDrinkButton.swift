//
//  AddDrinkButton.swift
//  Drinkathon
//
//  Created by Johnson on 4/25/19.
//  Copyright © 2019 JohnsonZhang. All rights reserved.
//

import UIKit

class AddDrinkButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = UIColor(red: 243/255, green: 129/255, blue: 129/255, alpha: 1)
        titleLabel?.font    = UIFont(name: "avenirNextCondensedDemiBold", size: 53)
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
}
