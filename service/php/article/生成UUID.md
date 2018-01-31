

# 生成UUID

## 什么是UUID

UUID是指在一台机器上生成的数字，它保证对在同一时空中的所有机器都是唯一的。通常平台会提供生成的API。按照开放软件基金会(OSF)制定的标准计算，用到了以太网卡地址、纳秒级时间、芯片ID码和许多可能的数字 
UUID由以下几部分的组合： 
（1）当前日期和时间，UUID的第一个部分与时间有关，如果你在生成一个UUID之后，过几秒又生成一个UUID，则第一个部分不同，其余相同。 
（2）时钟序列。 
（3）全局唯一的IEEE机器识别号，如果有网卡，从网卡MAC地址获得，没有网卡以其他方式获得。 
UUID的唯一缺陷在于生成的结果串会比较长。关于UUID这个标准使用最普遍的是微软的GUID(Globals Unique Identifiers)。在ColdFusion中可以用CreateUUID()函数很简单地生成UUID，其格式为：xxxxxxxx-xxxx- xxxx-xxxxxxxxxxxxxxxx(8-4-4-16)，其中每个 x 是 0-9 或 a-f 范围内的一个十六进制的数字。 
而 标准的UUID格式为：xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx (8-4-4-4-12)，可以从cflib 下载CreateGUID() UDF进行转换。 

## php生成UUID

### 方法一

```php
function create_guid(){ 
    $microTime = microtime(); 
    list($a_dec, $a_sec) = explode(" ", $microTime); 
    $dec_hex = dechex($a_dec* 1000000); 
    $sec_hex = dechex($a_sec); 
    ensure_length($dec_hex, 5); 
    ensure_length($sec_hex, 6); 
    $guid = ""; 
    $guid .= $dec_hex; 
    $guid .= create_guid_section(3); 
    $guid .= '-'; 
    $guid .= create_guid_section(4); 
    $guid .= '-'; 
    $guid .= create_guid_section(4); 
    $guid .= '-'; 
    $guid .= create_guid_section(4); 
    $guid .= '-'; 
    $guid .= $sec_hex; 
    $guid .= create_guid_section(6); 
    return $guid; 
} 

function ensure_length(&$string, $length){    
    $strlen = strlen($string);    
    if($strlen < $length)    
    {    
        $string = str_pad($string,$length,"0");    
    }    
    else if($strlen > $length)    
    {    
        $string = substr($string, 0, $length);    
    }   
 } 

function create_guid_section($characters){ 
    $return = ""; 
    for($i=0; $i<$characters; $i++) 
    { 
        $return .= dechex(mt_rand(0,15)); 
    } 
    return $return; 
} 


echo create_guid();

```



### 方法二

```php
function create_uuid($prefix = ""){    //可以指定前缀
    $str = md5(uniqid(mt_rand(), true));   
    $uuid  = substr($str,0,8) . '-';   
    $uuid .= substr($str,8,4) . '-';   
    $uuid .= substr($str,12,4) . '-';   
    $uuid .= substr($str,16,4) . '-';   
    $uuid .= substr($str,20,12);   
    return $prefix . $uuid;
}

echo create_uuid();
```







