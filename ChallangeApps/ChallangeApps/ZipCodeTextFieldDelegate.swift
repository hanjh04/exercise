//
//  ZipCodeTextFieldDelegate.swift
//  ChallangeApps
//
//  Created by connect on 2017. 1. 18..
//  Copyright © 2017년 udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var text = textField.text! as NSString
        text = text.replacingCharacters(in: range, with: string) as NSString
        
        let length = text.length
        if length >= 6{
            return false
        }
        return true
        
    }
    
}
