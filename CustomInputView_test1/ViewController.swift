//
//  ViewController.swift
//  CustomInputView_test1
//
//  Created by Pattur Mohankumar, Vijay Prasath on 8/11/17.
//  Copyright © 2017 Pattur Mohankumar, Vijay Prasath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize custom keyboard
        let keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 400))
        keyboardView.delegate = self // the view controller will be notified by the keyboard whenever a key is tapped
        
        // replace system keyboard with custom keyboard
        textField.inputView = keyboardView
    }
    
    // required method for keyboard delegate protocol
    func keyWasTapped(character: String) {
        textField.insertText(character)
    }
    
    func doneEditing(_ value: Bool) {
        view.endEditing(value)
    }
}
