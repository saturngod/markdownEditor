Markdown Editor is using TextKit Framework and written in Swift language.
It support following syntax highlight for now

- Bold
- Italic
- Header
- Link
- Image Link
- List
- Inline Code
- Code Block

I am using **Text** but I didn't use the edit `self.editedRange` because it will have a lot of problem for syntax highlighting. Example , I put the `**bold**` and then do the backspace. It will be like `**bold`. But text is still bold. editedRange change and didn't get that bold character text range.

So, I use syntax highlighting for visual text range only. It's fast in iPhone because there is no so much text range on iphone screen. However, in iPad 2 , a bit slow becuase it's old devices. So, I put the timer in there.

Another reason for adding timer is , shouldn't do syntaxhihglighting again and agan when user doing non stop typing. Syntax highlight should do when user typing finish.

### Screenshot

![Image](http://cl.ly/Y87e/Screen%20Shot%202014-10-21%20at%2012.39.32%20am.png)

### Todo

- Tested on iPad 2 and it's too slow for so many words and syntax color. In iPhone 5s , it really fast and reduce the timer rate. 
- Should redo syntax highlighting after scrolling 