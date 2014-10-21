//
//  SGMDTag.swift
//  markdownEditor
//
//  Created by Htain Lin Shwe on 20/10/14.
//  Copyright (c) 2014 comquas. All rights reserved.
//

import UIKit

struct SGMDTag {
  
  
  // MARK: Default Value
  
  static let COLOR_RED = UIColor(red: 0.862, green: 0.196, blue: 0.184, alpha: 1)
  static let COLOR_LIGHT_RED = UIColor(red: 0.796, green: 0.294, blue: 0.086, alpha: 1)
  static let COLOR_PURPLE = UIColor(red: 0.423, green: 0.443, blue: 0.768, alpha: 1)
  static let COLOR_DARK_PURPLE = UIColor(red: 0.305, green: 0.152, blue: 0.603, alpha: 1)
  static let COLOR_LIGHT_PINK = UIColor(red: 0.811, green: 0, blue: 0.603, alpha: 1)
  static let COLOR_GREEN = UIColor(red: 0 , green: 0.549 , blue: 0, alpha: 1)
  static let COLOR_BLUE_GRAY = UIColor(red: 0.576, green: 0.631, blue: 0.632, alpha: 1)
  
  
  
  // MARK: Tags Variable
  
  static let Italic = "((_|\\*)\\w+(\\s\\w+)*(_|\\*))"
  static let Bold = "((__|\\*\\*)\\w+(\\s\\w+)*(__|\\*\\*))"
  static let Header = "(((^#+|\\n#+)(.*)))"
  static let Link = "(\\[([^\\]]+)\\]\\(([^\\)]+)\\))"
  static let ImageLink = "(!\\[([^\\]]+)\\]\\(([^\\)]+)\\))"
  static let Code = "(`(.*?)`)"
  static let CodeBlock = "(```\\w*\\n[\\w\\s\\n]*\\n```)"
  static let List = "((^\\-|\\n\\-|^\\*|\\n\\*)\\s)"
  static let Clear = "(^[\\w\\s\\$\\&\\+\\,\\:\\;\\=\\?\\@\\|\\'\\<\\>\\.\\^\\*\\(\\)\\%\\!\\-])"
  
  // MARK: Attribute
  static func defaultAttribute() -> [NSObject : AnyObject] {
    
    let font = UIFont(name: "Menlo-Regular", size: SGMDHelper.bodyFontSize())
      var dict = [NSFontAttributeName : font! , NSForegroundColorAttributeName : UIColor.blackColor(),NSBackgroundColorAttributeName: UIColor.clearColor()]
      return dict
  }
  
  static func boldAtribute() -> [NSObject : AnyObject] {
    let boldFont = UIFont(name: "Menlo-Bold", size: SGMDHelper.bodyFontSize())
    return [NSFontAttributeName : boldFont!,NSForegroundColorAttributeName:COLOR_RED]
  }
  
  static func italicAtribute() -> [NSObject : AnyObject] {
    let italicFont = UIFont(name: "Menlo-Italic", size: SGMDHelper.bodyFontSize())
    return [NSFontAttributeName : italicFont!,NSForegroundColorAttributeName:COLOR_RED]
  }
  
  static func boldItalicAttribute() -> [NSObject : AnyObject] {
    //bold and italic
    let boldItalicFont = UIFont(name: "Menlo-BoldItalic", size: SGMDHelper.bodyFontSize())
    return [NSFontAttributeName : boldItalicFont!]
  }
  
  static func headerAttribute() -> [NSObject : AnyObject] {
    let boldFont = UIFont(name: "Menlo-Bold", size: SGMDHelper.bodyFontSize())
    return [NSFontAttributeName : boldFont!,NSForegroundColorAttributeName : COLOR_PURPLE]
  }
  
  static func linkAttribute() -> [NSObject : AnyObject] {
    return [NSForegroundColorAttributeName : COLOR_DARK_PURPLE]
  }
  
  static func imageLinkAttribute() -> [NSObject : AnyObject] {
    return [NSForegroundColorAttributeName : COLOR_LIGHT_PINK]
  }
  
  static func codeAttribute() -> [NSObject : AnyObject] {
    return [NSForegroundColorAttributeName : COLOR_GREEN]
  }
  
  static func listAttribute() -> [NSObject : AnyObject] {
    return [NSForegroundColorAttributeName : COLOR_BLUE_GRAY]
  }

  
  
  
}
