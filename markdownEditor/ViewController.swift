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
    editor.createTextView("#Life is not fair\nSometime we told ourselves, it’s not fair. Why does it happen to me? We did the same thing, he did approve and I got rejected. Why! We hate it. We angry about that. Finally , we are not happy at all.\n\nYes, life is not fair. Some living things are born with animal. Some are born with human. Some have a parent, Some people don’t have a parent. Some people born with rich. Some people born with poor. Life is not fair.\n\nActually, we don’t know who to blame when we feel not fair. I always same feel like that until I realized myself.\n\nNot The Same\nAll the living things are not the same. Monkey like banana. Tiger like meat. Dog like a bone. All the living things are not the same, but beautiful. If you are living now, it’s just enough for now. Just accept it, all the living things are not the same. So, you and your friends are not same, too. Born , living, learning , reading , playing, everything can’t be same. We may be same when we are young, but we can’t same now or future. Some people found a good teacher , some people couldn’t find the good teacher. Some people found themselve. If we are living , we can’t be same.\n\n# Desire\nSometime, we want to die. We don’t want to live very hard. Why we feel like that? It’s not only happening in you. Some people have a same feeling too. I realized, if I desire are not fulfilled, I am not happy. Angry. Feel not fair. Blame myself. I hate the other people who have I can’t get it until I forget that desire. Yes, the problem is desire. We want it. We want to do it. We want to get it. If we got it, we pride ourself. We feel, we are awesome. We got it because we are amazing person, awesome guy.\n\nIf we didn’t, we hate it. We blame it. We fight back until we got it or we lost everything. Sometimes we forget to think about ourself. Some of the things, we can fix it and get back. Some things, we can’t.\n\nUntil we have desire, we will feel like that again and again. So, it’s just a normal. Sometime, I feel not fair, I think about that. Why feel like that? Because of desire? Why I want this one? After that, my anger goes a ways and I am thinking how to fix it. Stop blaming myself or another. Just find a way to fix the problem.\n\nNot Fair ?\nSometime, teacher or criticism or parent are not fair. We hate them. We angry. But how long will we hate them? How long we will be together with them? Can’t be the whole life. We will old, we will die in some days. Just ignore it. Don’t live with their decision and try to leave ourself. Don’t rely on their review. Actually, we don’t need to angry. They are not fair, but they may have a reason why not fair. We can’t know it. Just ignore it. We will forget that thing in the future. We need to do other things. We are not living for these things only. So, ignore it or try to fix it. Life is not fair. Just accept it.")
      
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

