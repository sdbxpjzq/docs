[TOC]

PHP 过滤器用于对来自非安全来源的数据（比如用户输入）进行验证和过滤。

| 函数                                       | 描述                   | PHP  |
| ---------------------------------------- | -------------------- | ---- |
| [filter_has_var()](http://www.w3school.com.cn/php/func_filter_has_var.asp) | 检查是否存在指定输入类型的变量。     | 5    |
| [filter_id()](http://www.w3school.com.cn/php/func_filter_id.asp) | 返回指定过滤器的 ID 号。       | 5    |
| [filter_input()](http://www.w3school.com.cn/php/func_filter_input.asp) | 从脚本外部获取输入，并进行过滤。     | 5    |
| [filter_input_array()](http://www.w3school.com.cn/php/func_filter_input_array.asp) | 从脚本外部获取多项输入，并进行过滤。   | 5    |
| [filter_list()](http://www.w3school.com.cn/php/func_filter_list.asp) | 返回包含所有得到支持的过滤器的一个数组。 | 5    |
| [filter_var_array()](http://www.w3school.com.cn/php/func_filter_var_array.asp) | 获取多项变量，并进行过滤。        | 5    |
| [filter_var()](http://www.w3school.com.cn/php/func_filter_var.asp) | 获取一个变量，并进行过滤。        | 5    |



| ID 名称                                    | 描述                                       |
| ---------------------------------------- | ---------------------------------------- |
| [FILTER_CALLBACK](http://www.w3school.com.cn/php/filter_callback.asp) | 调用用户自定义函数来过滤数据。                          |
| [FILTER_SANITIZE_STRING](http://www.w3school.com.cn/php/filter_sanitize_string.asp) | 去除标签，去除或编码特殊字符。                          |
| [FILTER_SANITIZE_STRIPPED](http://www.w3school.com.cn/php/filter_sanitize_stripped.asp) | "string" 过滤器的别名。                         |
| [FILTER_SANITIZE_ENCODED](http://www.w3school.com.cn/php/filter_sanitize_encoded.asp) | URL-encode 字符串，去除或编码特殊字符。                |
| [FILTER_SANITIZE_SPECIAL_CHARS](http://www.w3school.com.cn/php/filter_sanitize_special_chars.asp) | HTML 转义字符 '"<>& 以及 ASCII 值小于 32 的字符。     |
| [FILTER_SANITIZE_EMAIL](http://www.w3school.com.cn/php/filter_sanitize_email.asp) | 删除所有字符，除了字母、数字以及 !#$%&'*+-/=?^_`{\|}~@.[] |
| [FILTER_SANITIZE_URL](http://www.w3school.com.cn/php/filter_sanitize_url.asp) | 删除所有字符，除了字母、数字以及 $-_.+!*'(),{}\|\\^~[]`<>#%";/?:@&= |
| [FILTER_SANITIZE_NUMBER_INT](http://www.w3school.com.cn/php/filter_sanitize_number_int.asp) | 删除所有字符，除了数字和 +-                          |
| [FILTER_SANITIZE_NUMBER_FLOAT](http://www.w3school.com.cn/php/filter_sanitize_number_float.asp) | 删除所有字符，除了数字、+- 以及 .,eE。                  |
| [FILTER_SANITIZE_MAGIC_QUOTES](http://www.w3school.com.cn/php/filter_sanitize_magic_quotes.asp) | 应用 addslashes()。                         |
| [FILTER_UNSAFE_RAW](http://www.w3school.com.cn/php/filter_unsafe_raw.asp) | 不进行任何过滤，去除或编码特殊字符。                       |
| [FILTER_VALIDATE_INT](http://www.w3school.com.cn/php/filter_validate_int.asp) | 在指定的范围以整数验证值。                            |
| [FILTER_VALIDATE_BOOLEAN](http://www.w3school.com.cn/php/filter_validate_boolean.asp) | 如果是 "1", "true", "on" 以及 "yes"，则返回 true，如果是 "0", "false", "off", "no" 以及 ""，则返回 false。否则返回 NULL。 |
| [FILTER_VALIDATE_FLOAT](http://www.w3school.com.cn/php/filter_validate_float.asp) | 以浮点数验证值。                                 |
| [FILTER_VALIDATE_REGEXP](http://www.w3school.com.cn/php/filter_validate_regexp.asp) | 根据 regexp，兼容 Perl 的正则表达式来验证值。            |
| [FILTER_VALIDATE_URL](http://www.w3school.com.cn/php/filter_validate_url.asp) | 把值作为 URL 来验证。                            |
| [FILTER_VALIDATE_EMAIL](http://www.w3school.com.cn/php/filter_validate_email.asp) | 把值作为 e-mail 来验证。                         |
| [FILTER_VALIDATE_IP](http://www.w3school.com.cn/php/filter_validate_ip.asp) | 把值作为 IP 地址来验证。                           |