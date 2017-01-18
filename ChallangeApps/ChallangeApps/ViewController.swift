//
//  ViewController.swift
//  ChallangeApps
//
//  Created by connect on 2017. 1. 18..
//  Copyright © 2017년 udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var randomColorTextField: UITextField!
    @IBOutlet weak var canModifySwitch: UISwitch!
    
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashDelegate
        self.randomColorTextField.delegate = randomColorDelegate
        cashTextField.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func canModify(_ sender: Any) {
        if canModifySwitch.isOn{
            randomColorTextField.isEnabled = true
        }else{
            randomColorTextField.isEnabled = false
        }
    }

}

