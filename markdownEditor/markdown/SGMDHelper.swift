//
//  markdownHelper.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 18/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//

import UIKit

struct SGMDHelper {
  
  static let DEFAULT_FONT = "Menlo-Regular"
  static let DEFAULT_BOLD_FONT = "Menlo-Bold"
  static let DEFAULT_ITALIC_FONT = "Menlo-Italic"
  static let DEFAULT_BOLD_ITALIC_FONT = "Menlo-BoldItalic"
  
  static func bodyFontSize() -> CGFloat
  {
    let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
    return bodyFontDescriptor.fontAttributes()[UIFontDescriptorSizeAttribute] as CGFloat
  }
  

  
}
