//
//  RandomColorTextFieldDelegate.swift
//  ChallangeApps
//
//  Created by connect on 2017. 1. 18..
//  Copyright © 2017년 udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate{
    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    func randomColor() -> UIColor {
        // @TODO: return a random color
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // @TODO: Set the color of your text here!
        textField.textColor = randomColor()
        return true
    }
}
