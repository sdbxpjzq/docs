#  点击滑动

```js
animate: function($iDomLi,closestParentDom) {
                    var $li =$iDomLi;
                    var $ul = $li.closest(closestParentDom);
                    var sl = $ul.scrollLeft()+$li.offset().left-($ul.innerWidth()-$li.width())/2;
                    $ul.stop().animate({
                        'scrollLeft':sl
                    },100);
                },
```



