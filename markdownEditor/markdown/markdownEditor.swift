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
  
  func createTextView(font:UIFont,content:String) {
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "preferredContentSizeChanged:",
      name: UIContentSizeCategoryDidChangeNotification,
      object: nil)
    


      
    

    
    let attrs = [NSFontAttributeName : font]
    let attrString = NSAttributedString(string: content, attributes: attrs)
    textStorage = SyntaxHighlightTextStorage()
    textStorage.appendAttributedString(attrString)
    let newTextViewRect = self.frame
    
    // 2. Create the layout manager
    let layoutManager = NSLayoutManager()
    let containerSize = CGSize(width: newTextViewRect.width, height: CGFloat.max)
    let container = NSTextContainer(size: containerSize)
    container.widthTracksTextView = true
    layoutManager.addTextContainer(container)
    textStorage.addLayoutManager(layoutManager)
    
    // 4. Create a UITextView
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

  
  func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    
    self.shouldChangeText = text
    self.shouldChangeInRange = range
    return true
  }
  func textViewDidChange(textView: UITextView) {

      if(self.shouldChangeText == "\n") {
        if(self.shouldChangeInRange.location+1 == self.textView.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        {
          self.textView.text = self.textView.text.stringByAppendingString("\n ")
          self.textView.selectedRange = NSMakeRange(self.shouldChangeInRange.location+1, 0)
        }
        textStorage.updateStylesAll();
      }
    
  }
}
