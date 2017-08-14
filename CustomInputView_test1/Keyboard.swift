//
//  Keyboard.swift
//  CustomInputView_test1
//
//  Created by Pattur Mohankumar, Vijay Prasath on 8/11/17.
//  Copyright © 2017 Pattur Mohankumar, Vijay Prasath. All rights reserved.
//

import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
    func doneEditing(_ value : Bool)
}

class Keyboard: UIView {
    
     let initialSubview = "Keyboard"
    
    var keyboardPlaceHolderView : UIView!
    var scrollView : UIScrollView!
    var viewsToAdd = [UIView]()
    var contentOffSetArray = [CGFloat]()
    var contentSize : CGFloat = 0.0
    
    
    var superScriptModeIsEnabled : Bool = false
    
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    weak var delegate: KeyboardDelegate?
    
    // MARK:- keyboard initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews(withXibFileName: initialSubview)
        initializeScrollView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews(withXibFileName: initialSubview)
        initializeScrollView()
    }
    
    func initializeSubviews(withXibFileName subviewName : String) {
        //MAIN KEYBOARD VIEW
        let xibFileName = subviewName
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)?[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        
        //LETTERS SUBVIEW
        let xibFileName2 = "Letters"
        let view2 = Bundle.main.loadNibNamed(xibFileName2, owner: self, options: nil)?[0] as! UIView
        
        //NUMBERS SUBVIEW
        let xibFileName3 = "Numbers"
        let view3 = Bundle.main.loadNibNamed(xibFileName3, owner: self, options: nil)?[0] as! UIView
        
        keyboardPlaceHolderView = view
        scrollView = view.viewWithTag(1001) as! UIScrollView
        viewsToAdd.append(view2)
        viewsToAdd.append(view3)
    }
    
    func initializeScrollView(){
        for i in 0..<viewsToAdd.count {
            let currentViewToAdd = viewsToAdd[i]
            scrollView.addSubview(currentViewToAdd)
            
            let newX : CGFloat = currentViewToAdd.frame.width * CGFloat(i)
            contentOffSetArray.append(newX)
            contentSize += currentViewToAdd.frame.width
            
            currentViewToAdd.frame = CGRect(x: newX, y: 0, width: currentViewToAdd.frame.width, height: currentViewToAdd.frame.height)
        }
        scrollView.contentSize = CGSize(width: contentSize, height: scrollView.frame.height)
    }
    
    // MARK:- To Toggle Superscript Mode
    func superScriptToggle(){
        superScriptModeIsEnabled = !superScriptModeIsEnabled
    }
    
    
    
    // MARK:- Button actions from .xib file
    @IBAction func keyTapped(sender: UIButton) {
        // When a button is tapped, send that information to the
        // delegate (ie, the view controller)
        self.delegate?.keyWasTapped(character: sender.titleLabel!.text!) // could alternatively send a tag value
    }
    
    // MARK:- Button to initiate Transition between pages
    @IBAction func transitionInitiated(sender: UIButton) {
        var contentOffSet = scrollView.contentOffset
        contentOffSet.x = contentOffSetArray[sender.tag]
        scrollView.setContentOffset(contentOffSet, animated: true)
    }
    
    // MARK:- Button to end Editing
    @IBAction func bringDownKeyboard(sender: UIButton) {
        self.delegate?.doneEditing(true)
    }
}
