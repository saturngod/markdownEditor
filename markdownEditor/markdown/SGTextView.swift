//
//  SGTextEditor.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 22/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//


import UIKit

/**
Create Child of UITextView because of carect size. 
After line sizing , caret size is too big.
So, need to resize it.
*/

class SGTextView: UITextView {


  override func caretRectForPosition(position: UITextPosition!) -> CGRect {
    var originalRect = super.caretRectForPosition(position)
    originalRect.size.height = 19
    return originalRect
  }
  

}
