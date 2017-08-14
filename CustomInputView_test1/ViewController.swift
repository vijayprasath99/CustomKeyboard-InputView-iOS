//
//  ViewController.swift
//  CustomInputView_test1
//
//  Created by Pattur Mohankumar, Vijay Prasath on 8/11/17.
//  Copyright © 2017 Pattur Mohankumar, Vijay Prasath. All rights reserved.
//

import UIKit
import Foundation

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
        if character == "Backspace" {
            if let text = textField.text, text.characters.count > 0{
                let index = text.index(text.startIndex, offsetBy: text.characters.count-1)
                let shorterText = text.substring(to:index)
                textField.text = shorterText
            }
        } else {
            textField.insertText(character)
        }
    }
    
    func doneEditing(_ value: Bool) {
        view.endEditing(value)
    }
    
    func keyWasTapped(character : String, withOption : Bool) {
        let str = SuperScript.shared.getSuperScriptUnicode(char: character)
        textField.insertText(str)
    }
}
