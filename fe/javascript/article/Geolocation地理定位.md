# Geolocation地理定位

Geolocation API的使用很简单，请求一个位置信息，如果用户同意，就返回位置信息。

## 检测浏览器是否支持Geolocation

```
if (navigator.geolocation) {
    console.log('Geolocation is supported.');
} else {
    console.log('geolocation is not supported in your broswer.');
}
```

## getCurrentPosition 和 watchPosition

- 使用 getCurrentPosition 方法获取当前的地理位置。
- 使用 watchPosition 方法监视位置随时间变化的情况。

语法：

```
// getCurrentPosition
navigator.geolocation.getCurrentPosition(successCallback, errorCallback, options);

// watchPosition
navigator.geolocation.watchPosition(successCallback, errorCallback, options);
```

这两个方法都就使用的是异步回调的方式。它们有相同的参数：

1. successCallback – 为浏览器成功获得位置信息后的回调函数。
2. errorCallback – 用于位置信息获取失败时的回调函数。
3. options – 配置参数，可以调整geolocation的数据收集方式
   - enableHighAccuracy - 指示浏览器获取高精度的位置，默认为false。当开启后，可能没有任何影响，也可能使浏览器花费更长的时间获取更精确的位置数据。
   - timeout - 最长有效期，在重复获取地理位置时，此参数指定多久再次获取位置。默认为0，表示浏览器需要立刻重新计算位置。
   - maximumAge - 表示程序能接受的被缓存位置的最大过期时间。接受一个数字作为参数，默认为0微秒。这就意味这默认每次获取位置都必需重新获取一个新位置。

### 用户信息对象

用户的位置会藏在一个位置对象中，该对象包括一些属性，具体见下表：

| 属性                    | 释义                        |
| ----------------------- | --------------------------- |
| coords.latitude         | 纬度数值                    |
| coords.longitude        | 经度数值                    |
| coords.altitude         | 参考椭球之上的高度          |
| coords.accuracy         | 精确度                      |
| coords.altitudeAccuracy | 高度的精确度                |
| coords.heading          | 设备正北顺时针前进的方位    |
| coords.speed            | 设备外部环境的移动速度(m/s) |
| timestamp               | 当位置捕获到时的时间戳      |



## clearWatch()

这个方法接受一个参数，需要清理监视位置变化的方法的id：watchID（这个参数由watchPosition方法返回）。

## 示例：

```
var watchId = navigator.geolocation.watchPosition(function(position) { // succes callback
    var coords = position.coords;

    console.log(coords.latitude); // 纬度
    console.log(coords.longitude); // 经度
    console.log(coords.accuracy); // 准确度，由于geolocation的实现方式，呈现返回值时一定要检查返回值的准确度
    console.log(coords.altitude); // 海拔，以米为单位，如不支持altitude特性，返回null
    console.log(coords.altitudeAccuracy); // 海拔经度，以米为单位，如不支持altitude特性，返回null
    console.log(coords.heading); // 行进方向，相对正北
    console.log(coords.speed); // 行进速度，单位m/s
    console.log(timestamp); // 获取位置的时间

}, function(error) { // error callback
    console.log('获取位置信息失败。');
    console.log(error.code);
    // UNKNOWN_ERROR (error code 0) - 未知错误
    // PERMISSION_DENIED (error code 1) - 用户拒绝共享地理位置
    // POSITION_UNAVAILABLE (error code 2) - 无法获取当前位置
    // TIMEOUT (error code 3) - 在指定时间无法获取位置会触发此错误。
}, { // options
    enableHighAccuracy: true, 
    maximumAge: 30000, 
    timeout: 27000 
});
```























