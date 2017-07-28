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

- Y - 年份的四位数表示 // 2017
- y - 年份的两位数表示 // 07
- L - 是否是闰年（如果是闰年则为 1，否则为 0）
- o - ISO-8601 标准下的年份数字

## 月

- m - 月份的数字表示（从 01 到 12）
- M - 月份的短文本表示（用三个字母表示）
- n - 月份的数字表示，不带前导零（1 到 12）
- F - 月份的完整的文本表示（January[一月份] 到 December[十二月份]）
- t - 给定月份中包含的天数

## 日

- d - 一个月中的第几天（从 01 到 31）
- j - 一个月中的第几天，不带前导零（1 到 31）
- z - 一年中的第几天（从 0 到 365）

## 星期几

- D - 星期几的文本表示（用三个字母表示）
- l（'L' 的小写形式）- 星期几的完整的文本表示
- N - 星期几的 ISO-8601 数字格式表示（1表示Monday[星期一]，7表示Sunday[星期日]）
- w - 星期几的数字表示（0 表示 Sunday[星期日]，6 表示 Saturday[星期六]）
- W - 用 ISO-8601 数字格式表示一年中的星期数字（每周从 Monday[星期一]开始）

## 时

- a - 小写形式表示：am 或 pm
- A - 大写形式表示：AM 或 PM


- g - 12 小时制，不带前导零（1 到 12）
- G - 24 小时制，不带前导零（0 到 23）
- h - 12 小时制，带前导零（01 到 12）
- H - 24 小时制，带前导零（00 到 23）

## 分

- i - 分，带前导零（00 到 59）

## 秒

- s - 秒，带前导零（00 到 59）
- u - 微秒（PHP 5.2.2 中新增的）

## 其他

- S - 一个月中的第几天的英语序数后缀（2 个字符：st、nd、rd 或 th。与 j 搭配使用）
- B - Swatch Internet Time（000 到 999）
- e - 时区标识符（例如：UTC、GMT、Atlantic/Azores）
- I（i 的大写形式）- 日期是否是在夏令时（如果是夏令时则为 1，否则为 0）
- O - 格林威治时间（GMT）的差值，单位是小时（实例：+0100）
- P - 格林威治时间（GMT）的差值，单位是 hours:minutes（PHP 5.1.3 中新增的）
- T - 时区的简写（实例：EST、MDT）
- Z - 以秒为单位的时区偏移量。UTC 以西时区的偏移量为负数（-43200 到 50400）
- c - ISO-8601 标准的日期（例如 2013-05-05T16:34:42+00:00）
- r - RFC 2822 格式的日期（例如 Fri, 12 Apr 2013 12:01:05 +0200）
- U - 自 Unix 纪元（January 1 1970 00:00:00 GMT）以来经过的秒数




