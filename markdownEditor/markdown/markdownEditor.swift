//
//  markdownEditor.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 18/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//

import UIKit

class markdownEditor: UIView , UITextViewDelegate , NSLayoutManagerDelegate , UIScrollViewDelegate {

  var textView:SGTextView!
  var textStorage: SyntaxHighlightTextStorage!
  var shouldChangeText:String!
  var shouldChangeInRange:NSRange!
  var timer:NSTimer!
  func createTextView(content:String) {
    
    let font = UIFont(name: SGMDHelper.DEFAULT_FONT, size: SGMDHelper.bodyFontSize())
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "preferredContentSizeChanged:",
      name: UIContentSizeCategoryDidChangeNotification,
      object: nil)
    
    let attrs = [NSFontAttributeName : font!]
    //let attrString = NSAttributedString(string: content, attributes: attrs)
    let attrString = NSAttributedString(string: content, attributes: attrs)
    textStorage = SyntaxHighlightTextStorage()
    textStorage.appendAttributedString(attrString)
    let newTextViewRect = self.frame
    
    
    let layoutManager = NSLayoutManager()
    layoutManager.delegate = self;
    let containerSize = CGSize(width: newTextViewRect.width, height: CGFloat.max)
    let container = NSTextContainer(size: containerSize)
    container.widthTracksTextView = true
    layoutManager.addTextContainer(container)
    textStorage.addLayoutManager(layoutManager)
    
    
    textView = SGTextView(frame: newTextViewRect, textContainer: container)
    textView.delegate = self
    self.addSubview(textView)
    
    self.textView.font = font;
    updateSyntaxHighlight()
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
  
  func textViewDidChange(textView: UITextView) {
    if let t = timer {
      t.invalidate()
      timer = nil
    }
    
    timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "updateSyntaxHighlight", userInfo: nil, repeats: false)

  }
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    
    if let t = timer {
      t.invalidate()
      timer = nil
    }
    
    timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "updateSyntaxHighlight", userInfo: nil, repeats: false)
    
  }
  
  func updateSyntaxHighlight() {
    var visibleRange: NSRange = visibleRangeOfTextView(textView)
    textStorage.defaultStyleInRange(visibleRange)
    textStorage.applyStylesToRange(visibleRange)
  }
  
  
  func visibleRangeOfTextView(textView:UITextView) -> NSRange {
    
    var bounds:CGRect = textView.bounds
    var start = textView.beginningOfDocument
    var end = textView.endOfDocument
    var startpoint = textView.characterRangeAtPoint(bounds.origin)
    if let s = startpoint {
      start = s.start
    }
    
    
    var endpoint = textView.characterRangeAtPoint(CGPointMake(CGRectGetMaxX(bounds),CGRectGetMaxY(bounds)))
    
    if let e = endpoint {
      end = e.end
    }
    
    var loc = textView.offsetFromPosition(textView.beginningOfDocument, toPosition:start)
    
    var length = textView.offsetFromPosition(start, toPosition: end)
    
    return NSMakeRange(loc, length)
  }

  //line spacing
  func layoutManager(layoutManager: NSLayoutManager, lineSpacingAfterGlyphAtIndex glyphIndex: Int, withProposedLineFragmentRect rect: CGRect) -> CGFloat {
    
    return CGFloat(20)
  }

}



