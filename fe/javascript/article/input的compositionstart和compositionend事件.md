[TOC]

# input 的 compositionstart 和 compositionend 事件

   在input中输入中文的时候，在没有选定文字前，输入的每一个拼音字母也会触发input事件，这显然不是我们想要的。我们需要 `compositionstart` 和 `compositionend` 事件来处理这个问题。

`compositionstart`会在用户开始进行非直接输入的时候触发，

`compositionend`会在点选候选词或者点击「选定」按钮之后触发。

我们可以在`compositionstart`的时候将input事件上锁，让其不执行，在`compositionend`的时候再解锁，注意：`compositionend` 事件是在 input 事件后触发的

