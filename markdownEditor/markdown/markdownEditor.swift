//
//  markdownEditor.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 18/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//

import UIKit

class markdownEditor: UIView , UITextViewDelegate {

  var textView:UITextView!
  var textStorage: SyntaxHighlightTextStorage!
  var shouldChangeText:String!
  var shouldChangeInRange:NSRange!
  
  func createTextView(content:String) {
    
    
    let font = UIFont(name: SGMDHelper.DEFAULT_FONT, size: SGMDHelper.bodyFontSize())
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "preferredContentSizeChanged:",
      name: UIContentSizeCategoryDidChangeNotification,
      object: nil)
    
    let attrs = [NSFontAttributeName : font]
    let attrString = NSAttributedString(string: content, attributes: attrs)
    textStorage = SyntaxHighlightTextStorage()
    textStorage.appendAttributedString(attrString)
    let newTextViewRect = self.frame
    
    
    let layoutManager = NSLayoutManager()
    let containerSize = CGSize(width: newTextViewRect.width, height: CGFloat.max)
    let container = NSTextContainer(size: containerSize)
    container.widthTracksTextView = true
    layoutManager.addTextContainer(container)
    textStorage.addLayoutManager(layoutManager)
    
    
    textView = UITextView(frame: newTextViewRect, textContainer: container)
    textView.delegate = self
    self.addSubview(textView)
    
    self.textView.font = font;

  }
  
  func updateTextViewSizeForKeyboardHeight(keyboardHeight: CGFloat) {
    textView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - keyboardHeight)
  }
  
  override func becomeFirstResponder() -> Bool {
    return textView.becomeFirstResponder()
  }
  
  func preferredContentSizeChanged(notification: NSNotification) {
    textStorage.update()
  }

}
