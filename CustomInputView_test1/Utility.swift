//
//  Utility.swift
//  CustomInputView_test1
//
//  Created by Pattur Mohankumar, Vijay Prasath on 8/14/17.
//  Copyright © 2017 Pattur Mohankumar, Vijay Prasath. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    public static let sharedInstance = Utility()
   
    func getSuperScript(forCharacter str : String) -> String {
        let aString = NSMutableAttributedString(string: str)
        let myFont = UIFont(name: "Helvetica", size: 10.0)
        let superscriptAttributes: [String : Any] = [ NSBaselineOffsetAttributeName: 5, NSFontAttributeName:  myFont! ]
        aString.addAttributes(superscriptAttributes, range: NSRange(location: 0, length: str.characters.count))
        return aString.string
    }
}
