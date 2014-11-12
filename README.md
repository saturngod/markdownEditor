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

I am using **TextKit** but I didn't use the edit `self.editedRange` because it will have a lot of problem for syntax highlighting. Example , I put the `**bold**` and then do the backspace. It will be like `**bold`. But text is still bold. editedRange change and didn't get that bold character text range.

Another problem is code block and header. After line breaking edit range has been changed and header color attribute didn't reset. So, if I want to use header color, I can't use code block. If I want to use code block , I can't use header color if I am using editRange. (may be I am wrong).

So, I use syntax highlighting for visual text range only. It's fast in iPhone because there is no so much text range on iphone screen. However, in iPad 2 , a bit slow becuase it's old devices. So, I put the timer in there.

Another reason for adding timer is , shouldn't do syntaxhihglighting again and agan when user doing non stop typing. Syntax highlight should do when user typing finish.

### Screenshot

![Image](http://cl.ly/Y87e/Screen%20Shot%202014-10-21%20at%2012.39.32%20am.png)

### Todo

- Tested on iPad 2 and it's too slow for so many words and syntax color.
- ~~Should redo syntax highlighting after scrolling~~ 
