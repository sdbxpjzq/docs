[TOC]

# 图片处理

GD库

`extension = php_gd2.dll`

`var_dump(gd_info());` — 查看GD库信息

## 创建画布

1. **创建新画布**

 `imagecreate(int $x_size, int $y_size) `  //新建一个基于调色板的图像  通常支持256色，返回一个资源句柄

` imagecreatetruecolor(int $x_size, int $y_size)` — 新建一个真彩色图像 不能用于GIF格式。返回一个资源句柄 推荐使用



2. **基于图片创建画布(打开图片)**

- `imagecreatefromgif(string $imagename)`：创建一块画布，并从 GIF 文件或 URL 地址载入一副图像
- `imagecreatefromjpeg(string $imagename)`：创建一块画布，并从 JPEG 文件或 URL 地址载入一副图像
- `imagecreatefrompng(string $imagename)`：创建一块画布，并从 PNG 文件或 URL 地址载入一副图像
- `imagecreatefromwbmp(string $imagename)`：创建一块画布，并从 WBMP 文件或 URL 地址载入一副图像
- `imagecreatefromstring(string $imagename)`：创建一块画布，并从字符串中的图像流新建一副图像



## 操作画布

### 设置颜色

1. imagecolorallocate

取值 0~ 255

`imagecolorallocate( resource image, int red, int green, int blue )`

2. imagecolorallocatealpha  可以设置透明色.

参数 alpha，其值从 0 到 127.   0 表示完全不透明，127 表示完全透明

`imagecolorallocatealpha( resource image, int red, int green, int blue, int alpha )`

3. 取消颜色

`imagecolordeallocate( resource image, int color )`

取消先前由 imagecolorallocate() 和imagecolorallocatealpha() 函数为图像分配的颜色



### 填充颜色

`imagefill( resource image, int x, int y, int color )`

x,y 分别为填充的起始 x 坐标和 y 坐标，与 x, y 点颜色相同且相邻的点都会被填充。

### 处理字符串

1. 水平地画一行字符串

`imagestring ( resource $image , int $font , int $x , int $y , string $s , int $col )`

用 `col` 颜色将字符串 `s` 画到 `image` 所代表的图像的 `x`，`y` 坐标处（这是字符串左上角坐标，整幅图像的左上角为 0，0）。如果 `font` 是 1，2，3，4 或 5，则使用内置字体。

2. 水平地画一个字符

`imagechar ( resource $image , int $font , int $x , int $y , string $c , int $color )`



## 输出画布

1. 输出到图片文件
2. 直接输出

```
bool imagegif ( resource image [, string filename] ) // 以 GIF 格式将图像输出到浏览器或文件
bool imagejpeg ( resource image [, string filename [, int quality]] )
bool imagepng ( resource image [, string filename] )
bool imagewbmp ( resource image [, string filename [, int foreground]] )
```

| 参数         | 说明                                       |
| ---------- | ---------------------------------------- |
| image      | 欲输出的图像资源，如 imagecreate() 或 imagecreatefrom 系列函数的返回值 |
| filename   | 可选，指定输出图像的文件名。如果省略，则原始图像流将被直接输出。         |
| quality    | 可选，指定图像质量，范围从 0（最差质量，文件最小）到 100（最佳质量，文件最大），默认75 ，imagejpeg() 独有参数 |
| foreground | 可选，指定前景色，默认前景色是黑色，imagewbmp() 独有参数       |



## 销毁画布

` imagedestroy($image) — 销毁一图像 `



# 获取图片信息

getimagesize($imageName)

```
$array = getimagesize("images/flower_1.jpg");
print_r($array);
Array
(
    [0] => 350
    [1] => 318
    [2] => 2
    [3] => width="350" height="318"
    [bits] => 8
    [channels] => 3
    [mime] => image/jpeg
)
```

