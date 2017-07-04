[TOC]



# PHP 日期 加减 月数,天数,周数,小时,分,秒

- PHP 日期 加减 周  

  `date("Y-m-d",strtotime("2013-11-12 +1 week")) `

- PHP 日期 加减 天数 

  `date("Y-m-d",strtotime("2013-11-12 12:12:12 +1 day"))  `

- PHP 日期加减小时  

  `date("Y-m-d h:i:s",strtotime("2013-11-12 12:12:12 +1 hour"))`  


- PHP 日期 加减 月数  

  `date("Y-m-d",strtotime("2013-11-12 12:12:12 +1 month"))  `

- PHP 日期 加减 分  

  `date("Y-m-d h:i:s",strtotime("2013-11-12 12:12:12 +1 minute"))  `

- PHP 日期 加减 秒  

  `date("Y-m-d h:i:s",strtotime("2013-11-12 12:12:12 +1 second"))  `



# date() 格式化时间

## 年

xxxx

## 月

xxx



## 日

xxx



## 时

xxx





- d - 一个月中的第几天（从 01 到 31）
- D - 星期几的文本表示（用三个字母表示）
- j - 一个月中的第几天，不带前导零（1 到 31）
- l（'L' 的小写形式）- 星期几的完整的文本表示
- N - 星期几的 ISO-8601 数字格式表示（1表示Monday[星期一]，7表示Sunday[星期日]）
- S - 一个月中的第几天的英语序数后缀（2 个字符：st、nd、rd 或 th。与 j 搭配使用）
- w - 星期几的数字表示（0 表示 Sunday[星期日]，6 表示 Saturday[星期六]）
- z - 一年中的第几天（从 0 到 365）
- W - 用 ISO-8601 数字格式表示一年中的星期数字（每周从 Monday[星期一]开始）
- F - 月份的完整的文本表示（January[一月份] 到 December[十二月份]）
- m - 月份的数字表示（从 01 到 12）
- M - 月份的短文本表示（用三个字母表示）
- n - 月份的数字表示，不带前导零（1 到 12）
- t - 给定月份中包含的天数
- L - 是否是闰年（如果是闰年则为 1，否则为 0）
- o - ISO-8601 标准下的年份数字
- Y - 年份的四位数表示
- y - 年份的两位数表示
- a - 小写形式表示：am 或 pm
- A - 大写形式表示：AM 或 PM
- B - Swatch Internet Time（000 到 999）
- g - 12 小时制，不带前导零（1 到 12）
- G - 24 小时制，不带前导零（0 到 23）
- h - 12 小时制，带前导零（01 到 12）
- H - 24 小时制，带前导零（00 到 23）
- i - 分，带前导零（00 到 59）
- s - 秒，带前导零（00 到 59）
- u - 微秒（PHP 5.2.2 中新增的）
- e - 时区标识符（例如：UTC、GMT、Atlantic/Azores）
- I（i 的大写形式）- 日期是否是在夏令时（如果是夏令时则为 1，否则为 0）
- O - 格林威治时间（GMT）的差值，单位是小时（实例：+0100）
- P - 格林威治时间（GMT）的差值，单位是 hours:minutes（PHP 5.1.3 中新增的）
- T - 时区的简写（实例：EST、MDT）
- Z - 以秒为单位的时区偏移量。UTC 以西时区的偏移量为负数（-43200 到 50400）
- c - ISO-8601 标准的日期（例如 2013-05-05T16:34:42+00:00）
- r - RFC 2822 格式的日期（例如 Fri, 12 Apr 2013 12:01:05 +0200）
- U - 自 Unix 纪元（January 1 1970 00:00:00 GMT）以来经过的秒数





# PHP数组函数



| 函数                                       | 描述                                       |
| ---------------------------------------- | ---------------------------------------- |
| [array()](http://www.w3school.com.cn/php/func_array.asp) | 创建数组。                                    |
| [array_change_key_case()](http://www.w3school.com.cn/php/func_array_change_key_case.asp) | 把数组中所有键更改为小写或大写。                         |
| [array_chunk()](http://www.w3school.com.cn/php/func_array_chunk.asp) | 把一个数组分割为新的数组块。                           |
| [array_column()](http://www.w3school.com.cn/php/func_array_column.asp) | 返回输入数组中某个单一列的值。                          |
| [array_combine()](http://www.w3school.com.cn/php/func_array_combine.asp) | 通过合并两个数组来创建一个新数组。                        |
| [array_count_values()](http://www.w3school.com.cn/php/func_array_count_values.asp) | 用于统计数组中所有值出现的次数。                         |
| [array_diff()](http://www.w3school.com.cn/php/func_array_diff.asp) | 比较数组，返回差集（只比较键值）。                        |
| [array_diff_assoc()](http://www.w3school.com.cn/php/func_array_diff_assoc.asp) | 比较数组，返回差集（比较键名和键值）。                      |
| [array_diff_key()](http://www.w3school.com.cn/php/func_array_diff_key.asp) | 比较数组，返回差集（只比较键名）。                        |
| [array_diff_uassoc()](http://www.w3school.com.cn/php/func_array_diff_uassoc.asp) | 比较数组，返回差集（比较键名和键值，使用用户自定义的键名比较函数）。       |
| [array_diff_ukey()](http://www.w3school.com.cn/php/func_array_diff_ukey.asp) | 比较数组，返回差集（只比较键名，使用用户自定义的键名比较函数）。         |
| [array_fill()](http://www.w3school.com.cn/php/func_array_fill.asp) | 用给定的键值填充数组。                              |
| [array_fill_keys()](http://www.w3school.com.cn/php/func_array_fill_keys.asp) | 用指定键名的给定键值填充数组。                          |
| [array_filter()](http://www.w3school.com.cn/php/func_array_filter.asp) | 用回调函数过滤数组中的元素。                           |
| [array_flip()](http://www.w3school.com.cn/php/func_array_flip.asp) | 交换数组中的键和值。                               |
| [array_intersect()](http://www.w3school.com.cn/php/func_array_intersect.asp) | 比较数组，返回交集（只比较键值）。                        |
| [array_intersect_assoc()](http://www.w3school.com.cn/php/func_array_intersect_assoc.asp) | 比较数组，返回交集（比较键名和键值）。                      |
| [array_intersect_key()](http://www.w3school.com.cn/php/func_array_intersect_key.asp) | 比较数组，返回交集（只比较键名）。                        |
| [array_intersect_uassoc()](http://www.w3school.com.cn/php/func_array_intersect_uassoc.asp) | 比较数组，返回交集（比较键名和键值，使用用户自定义的键名比较函数）。       |
| [array_intersect_ukey()](http://www.w3school.com.cn/php/func_array_intersect_ukey.asp) | 比较数组，返回交集（只比较键名，使用用户自定义的键名比较函数）。         |
| [array_key_exists()](http://www.w3school.com.cn/php/func_array_key_exists.asp) | 检查指定的键名是否存在于数组中。                         |
| [array_keys()](http://www.w3school.com.cn/php/func_array_keys.asp) | 返回数组中所有的键名。                              |
| [array_map()](http://www.w3school.com.cn/php/func_array_map.asp) | 把数组中的每个值发送到用户自定义函数，返回新的值。                |
| [array_merge()](http://www.w3school.com.cn/php/func_array_merge.asp) | 把一个或多个数组合并为一个数组。                         |
| [array_merge_recursive()](http://www.w3school.com.cn/php/func_array_merge_recursive.asp) | 递归地合并一个或多个数组。                            |
| [array_multisort()](http://www.w3school.com.cn/php/func_array_multisort.asp) | 对多个数组或多维数组进行排序。                          |
| [array_pad()](http://www.w3school.com.cn/php/func_array_pad.asp) | 用值将数组填补到指定长度。                            |
| [array_pop()](http://www.w3school.com.cn/php/func_array_pop.asp) | 删除数组的最后一个元素（出栈）。[ 返回数组的**最后一个值**。如果数组是空的，或者非数组，将返回 NULL] |
| [array_product()](http://www.w3school.com.cn/php/func_array_product.asp) | 计算数组中所有值的乘积。                             |
| [array_push()](http://www.w3school.com.cn/php/func_array_push.asp) | 将一个或多个元素插入数组的末尾（入栈）。                     |
| [array_rand()](http://www.w3school.com.cn/php/func_array_rand.asp) | 返回数组中一个或多个随机的键。                          |
| [array_reduce()](http://www.w3school.com.cn/php/func_array_reduce.asp) | 通过使用用户自定义函数，以字符串返回数组。                    |
| [array_replace()](http://www.w3school.com.cn/php/func_array_replace.asp) | 使用后面数组的值替换第一个数组的值。                       |
| [array_replace_recursive()](http://www.w3school.com.cn/php/func_array_replace_recursive.asp) | 递归地使用后面数组的值替换第一个数组的值。                    |
| [array_reverse()](http://www.w3school.com.cn/php/func_array_reverse.asp) | 以相反的顺序返回数组。                              |
| [array_search()](http://www.w3school.com.cn/php/func_array_search.asp) | 搜索数组中给定的值并返回键名。                          |
| [array_shift()](http://www.w3school.com.cn/php/func_array_shift.asp) | 删除数组中首个元素，并返回被删除元素的值。                    |
| [array_slice()](http://www.w3school.com.cn/php/func_array_slice.asp) | 返回数组中被选定的部分。                             |
| [array_splice()](http://www.w3school.com.cn/php/func_array_splice.asp) | 删除并替换数组中指定的元素。                           |
| [array_sum()](http://www.w3school.com.cn/php/func_array_sum.asp) | 返回数组中值的和。                                |
| [array_udiff()](http://www.w3school.com.cn/php/func_array_udiff.asp) | 比较数组，返回差集（只比较值，使用一个用户自定义的键名比较函数）。        |
| [array_udiff_assoc()](http://www.w3school.com.cn/php/func_array_udiff_assoc.asp) | 比较数组，返回差集（比较键和值，使用内建函数比较键名，使用用户自定义函数比较键值）。 |
| [array_udiff_uassoc()](http://www.w3school.com.cn/php/func_array_udiff_uassoc.asp) | 比较数组，返回差集（比较键和值，使用两个用户自定义的键名比较函数）。       |
| [array_uintersect()](http://www.w3school.com.cn/php/func_array_uintersect.asp) | 比较数组，返回交集（只比较值，使用一个用户自定义的键名比较函数）。        |
| [array_uintersect_assoc()](http://www.w3school.com.cn/php/func_array_uintersect_assoc.asp) | 比较数组，返回交集（比较键和值，使用内建函数比较键名，使用用户自定义函数比较键值）。 |
| [array_uintersect_uassoc()](http://www.w3school.com.cn/php/func_array_uintersect_uassoc.asp) | 比较数组，返回交集（比较键和值，使用两个用户自定义的键名比较函数）。       |
| [array_unique()](http://www.w3school.com.cn/php/func_array_unique.asp) | 删除数组中的重复值。                               |
| [array_unshift()](http://www.w3school.com.cn/php/func_array_unshift.asp) | 在数组开头插入一个或多个元素。                          |
| [array_values()](http://www.w3school.com.cn/php/func_array_values.asp) | 返回数组中所有的值。                               |
| [array_walk()](http://www.w3school.com.cn/php/func_array_walk.asp) | 对数组中的每个成员应用用户函数。                         |
| [array_walk_recursive()](http://www.w3school.com.cn/php/func_array_walk_recursive.asp) | 对数组中的每个成员递归地应用用户函数。                      |
| [arsort()](http://www.w3school.com.cn/php/func_array_arsort.asp) | 对关联数组按照键值进行降序排序。                         |
| [asort()](http://www.w3school.com.cn/php/func_array_asort.asp) | 对关联数组按照键值进行升序排序。                         |
| [compact()](http://www.w3school.com.cn/php/func_array_compact.asp) | 创建包含变量名和它们的值的数组。                         |
| [count()](http://www.w3school.com.cn/php/func_array_count.asp) | 返回数组中元素的数目。                              |
| [current()](http://www.w3school.com.cn/php/func_array_current.asp) | 返回数组中的当前元素。                              |
| [each()](http://www.w3school.com.cn/php/func_array_each.asp) | 返回数组中当前的键／值对。                            |
| [end()](http://www.w3school.com.cn/php/func_array_end.asp) | 将数组的内部指针指向最后一个元素。                        |
| [extract()](http://www.w3school.com.cn/php/func_array_extract.asp) | 从数组中将变量导入到当前的符号表。                        |
| [in_array()](http://www.w3school.com.cn/php/func_array_in_array.asp) | 检查数组中是否存在指定的值。                           |
| [key()](http://www.w3school.com.cn/php/func_array_key.asp) | 从关联数组中取得键名。                              |
| [krsort()](http://www.w3school.com.cn/php/func_array_krsort.asp) | 对数组按照键名逆向排序。                             |
| [ksort()](http://www.w3school.com.cn/php/func_array_ksort.asp) | 对数组按照键名排序。                               |
| [list()](http://www.w3school.com.cn/php/func_array_list.asp) | 把数组中的值赋给一些变量。                            |
| [natcasesort()](http://www.w3school.com.cn/php/func_array_natcasesort.asp) | 用“自然排序”算法对数组进行不区分大小写字母的排序。               |
| [natsort()](http://www.w3school.com.cn/php/func_array_natsort.asp) | 用“自然排序”算法对数组排序。                          |
| [next()](http://www.w3school.com.cn/php/func_array_next.asp) | 将数组中的内部指针向前移动一位。                         |
| [pos()](http://www.w3school.com.cn/php/func_array_pos.asp) | current() 的别名。                           |
| [prev()](http://www.w3school.com.cn/php/func_array_prev.asp) | 将数组的内部指针倒回一位。                            |
| [range()](http://www.w3school.com.cn/php/func_array_range.asp) | 创建包含指定范围单元的数组。                           |
| [reset()](http://www.w3school.com.cn/php/func_array_reset.asp) | 将数组的内部指针指向第一个元素。                         |
| [rsort()](http://www.w3school.com.cn/php/func_array_rsort.asp) | 对数组逆向排序。                                 |
| [shuffle()](http://www.w3school.com.cn/php/func_array_shuffle.asp) | 将数组打乱。                                   |
| [sizeof()](http://www.w3school.com.cn/php/func_array_sizeof.asp) | count() 的别名。                             |
| [sort()](http://www.w3school.com.cn/php/func_array_sort.asp) | 对数组排序。                                   |
| [uasort()](http://www.w3school.com.cn/php/func_array_uasort.asp) | 使用用户自定义的比较函数对数组中的键值进行排序。                 |
| [uksort()](http://www.w3school.com.cn/php/func_array_uksort.asp) | 使用用户自定义的比较函数对数组中的键名进行排序。                 |
| [usort()](http://www.w3school.com.cn/php/func_array_usort.asp) | 使用用户自定义的比较函数对数组进行排序。                     |