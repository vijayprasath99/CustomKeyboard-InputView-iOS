//
//  Constants.swift
//  CustomInputView_test1
//
//  Created by Pattur Mohankumar, Vijay Prasath on 8/14/17.
//  Copyright © 2017 Pattur Mohankumar, Vijay Prasath. All rights reserved.
//

import Foundation


class SuperScript {
    public static let shared = SuperScript()
    
    public func getSuperScriptUnicode(char : String) -> String{
        if char == "0" {
            return "\u{00B3}"
        } else if char == "1" {
            return "\u{00B9}"
        } else if char == "2" {
            return "\u{00B2}"
        } else if char == "3" {
            return "\u{00B3}"
        } else if char == "4" {
            return "\u{2074}"
        } else if char == "5" {
            return "\u{2075}"
        } else if char == "6" {
            return "\u{2076}"
        } else {
            return "\u{3c7}"
        }
        
    }
}
