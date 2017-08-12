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



# phantomjs

```shell
sudo yum -y install gcc gcc-c++ make flex bison gperf ruby \
  openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
  libpng-devel libjpeg-devel

git clone git://github.com/ariya/phantomjs.git
cd phantomjs
git submodule init
git submodule update
python build.py
```























