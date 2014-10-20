//
//  ViewController.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 18/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var editor: markdownEditor!
  
  var firstTime = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
    
   
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidHide:", name: UIKeyboardDidHideNotification, object: nil)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    if(firstTime) {
     let bodyFontSize = SGMDHelper.bodyFontSize()
    
    // Do any additional setup after loading the view, typically from a nib.
    editor.createTextView("#Hello\nThis is a markdown editor written in **Swift**. I *hope* you will like it.")
      
    editor.becomeFirstResponder()
      firstTime = false;
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Keyboard Delegate
  
  func keyboardDidShow(notification: NSNotification) {
    if let rectValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue {
      let keyboardSize = rectValue.CGRectValue().size
      editor.updateTextViewSizeForKeyboardHeight(keyboardSize.height)
    }
  }
  
  func keyboardDidHide(notification: NSNotification) {
    editor.updateTextViewSizeForKeyboardHeight(0)
  }


}

