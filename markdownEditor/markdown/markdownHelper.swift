//
//  markdownHelper.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 18/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//

import UIKit

struct markdownHelper {
  
  static func bodyFontSize() -> NSNumber
  {
    let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
    return bodyFontDescriptor.fontAttributes()[UIFontDescriptorSizeAttribute] as NSNumber
  }
  
}
