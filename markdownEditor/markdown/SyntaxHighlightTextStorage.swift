//
//  SyntaxHighlightTextStorage.swift
//  SwiftTextKitNotepad
//
//  Created by Htain Lin Shwe on 18/10/14.
//  Copyright (c) 2014 Gabriel Hauber. All rights reserved.
//

import UIKit

class SyntaxHighlightTextStorage: NSTextStorage {
  
  let backingStore = NSMutableAttributedString()
  
  override var string: String {
    return backingStore.string
  }
  
  override init() {
    super.init()
    createHighlightPatterns()
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func attributesAtIndex(index: Int, effectiveRange range: NSRangePointer) -> [NSObject : AnyObject] {
    return backingStore.attributesAtIndex(index, effectiveRange: range)
  }
  
  
  
  
  override func replaceCharactersInRange(range: NSRange, withString str: String) {
    
    beginEditing()
    backingStore.replaceCharactersInRange(range, withString:str)
    edited(.EditedCharacters | .EditedAttributes, range: range, changeInLength: (str as NSString).length - range.length)
    endEditing()
  }
  
  override func setAttributes(attrs: [NSObject : AnyObject]!, range: NSRange) {
    
    beginEditing()
    backingStore.setAttributes(attrs, range: range)
    edited(.EditedAttributes, range: range, changeInLength: 0)
    endEditing()
  }
  
  func defaultStyleInRange(styleRange:NSRange)
  {
    addAttributes(SGMDTag.defaultAttribute(), range: styleRange)
  }
  
  func applyStylesToRange(searchRange: NSRange) {
    
    
    // iterate over each replacement
    for (pattern, attributes) in replacements {
      
      let regex = NSRegularExpression(pattern: pattern, options: nil, error: nil)
      
      regex?.enumerateMatchesInString(backingStore.string, options: nil, range: searchRange) {
        match, flags, stop in
        
        let range = match!.range
        
        let matchRange = match.rangeAtIndex(1)
        self.addAttributes(attributes, range: matchRange)
        

        let maxRange = matchRange.location + matchRange.length
        
        if maxRange < self.length {
          self.addAttributes(SGMDTag.defaultAttribute(), range: NSMakeRange(maxRange, 1))
        }
        
      }
    }
    
    
  }
  
  
  func performReplacementsForRange(changedRange: NSRange) {
    var extendedRange = NSUnionRange(changedRange, NSString(string: backingStore.string).lineRangeForRange(NSMakeRange(changedRange.location, 0)))
    
    extendedRange = NSUnionRange(changedRange, NSString(string: backingStore.string).lineRangeForRange(NSMakeRange(NSMaxRange(changedRange), 0)))
    
    applyStylesToRange(extendedRange)
  }
  
  override func processEditing() {
    super.processEditing()
    //performReplacementsForRange(self.editedRange)
  }
  
  
  func update() {
    // update the highlight patterns
    createHighlightPatterns()
    addAttributes(SGMDTag.defaultAttribute(), range: NSMakeRange(0, length))
    // re-apply the regex matches
    applyStylesToRange(NSMakeRange(0, length))
  }
  
  var replacements: [String : [NSObject : AnyObject]]!
  
  func createHighlightPatterns() {
    
    // construct a dictionary of replacements based on regexes
    replacements = [
      //SGMDTag.Clear : SGMDTag.defaultAttribute(),
      SGMDTag.Italic : SGMDTag.italicAtribute(),
      SGMDTag.Bold : SGMDTag.boldAtribute(),
      SGMDTag.Link : SGMDTag.linkAttribute(),
      SGMDTag.ImageLink : SGMDTag.imageLinkAttribute(),
      SGMDTag.Code : SGMDTag.codeAttribute(),
      SGMDTag.CodeBlock : SGMDTag.codeAttribute(),
      SGMDTag.Header : SGMDTag.headerAttribute(),
      SGMDTag.List : SGMDTag.listAttribute(),
    ]
    
  }
  
}
