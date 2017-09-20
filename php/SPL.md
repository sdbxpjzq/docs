[TOC]

https://my.oschina.net/kakoi/blog/522133



# 双链表  SplDoublyLinkedList



```php
<?php  
$obj = new SplDoublyLinkedList();  
$obj->push(1);  
$obj->push(2);  
$obj->push(3);  
$obj->unshift(10);   //unshifit 替换双向链表的首部  
$obj->rewind();     //  使用current 必须调用rewind,把节点指针指向bottom节点  
 $obj->next();    //    next 指向下一个节点  
$obj->prev();   // 指针指向上一个节点  
echo $obj->current();   //  指针指向当前结点  
if($obj->current())  
{  
    echo "y";  
}else{
    echo "n";  
}  

    if($obj->valid()){  
        //如果当前节点是有效节点 valid则返回true  
    }  
$obj->pop();    
    //var_dump($obj);  
print_r($obj);  
```





