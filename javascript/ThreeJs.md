# 三大组件

在Three.js中，要渲染物体到网页中，我们需要3个组建：

1. 场景(scene)
2. 相机(camera)
3. 渲染器(renderer)

有了这三样东西，才能将物体渲染到网页中去

记住关建语句：有了这三样东西，我们才能够使用相机将场景渲染到网页上去。

创建这三要素的代码如下：

```js
scene = new THREE.Scene();  // 场景
var camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000);// 透视相机
var renderer = new THREE.WebGLRenderer();   // 渲染器
renderer.setSize(window.innerWidth, window.innerHeight);    // 设置渲染器的大小为窗口的内宽度，也就是内容区的宽度
document.body.appendChild(renderer.domElement);
```

# 场景

在Threejs中场景就只有一种，用THREE.Scene来表示，要构件一个场景也很简单，只要new一个对象就可以了，代码如下：

var scene = new THREE.Scene();

场景是所有物体的容器，如果要显示一个苹果，就需要将苹果对象加入场景中。

# 相机

相机决定了场景中那个角度的景色会显示出来.相机就像人的眼睛一样，人站在不同位置，抬头或者低头都能够看到不同的景色。场景只有一种，但是相机却又很多种.

在Threejs中有多种相机，这里介绍两种.

### 透视相机

` var camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000);`

# 渲染器

渲染器决定了渲染的结果应该画在页面的什么元素上面，并且以怎样的方式来绘制。这里我们定义了一个WebRenderer渲染器，代码如下所示：

```js
var renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);
```

注意，渲染器renderer的domElement元素，表示渲染器中的画布，所有的渲染都是画在domElement上的，所以这里的appendChild表示将这个domElement挂接在body下面，这样渲染的结果就能够在页面中显示了。

# 添加物体到场景中

```js
var geometry = new THREE.CubeGeometry(1,1,1); 
var material = new THREE.MeshBasicMaterial({color: 0x00ff00});
var cube = new THREE.Mesh(geometry, material); 
scene.add(cube);
```

THREE.CubeGeometry是什么东东，他是一个几何体，这里你只需要知道CubeGeometry是一个正方体或者长方体，究竟是什么，由它的3个参数所决定.

cubeGeometry的原型如下代码所示：

```js
CubeGeometry(width, height, depth, segmentsWidth, segmentsHeight, segmentsDepth, materials, sides)

```

width：立方体x轴的长度

height：立方体y轴的长度

depth：立方体z轴的深度，也就是长度

想一想大家就明白，以上3个参数就能够确定一个立方体。

# 渲染

渲染应该使用渲染器，结合相机和场景来得到结果画面。实现这个功能的函数是

`renderer.render(scene, camera)`

渲染函数的原型如下：

render( scene, camera, renderTarget, forceClear )

各个参数的意义是：

scene：前面定义的场景

camera：前面定义的相机

renderTarget：渲染的目标，默认是渲染到前面定义的render变量中

forceClear：每次绘制之前都将画布的内容给清除，即使自动清除标志autoClear为false，也会清除

# 渲染循环

渲染有两种方式：实时渲染和离线渲染 。

**离线渲染**: 事先渲染好一帧一帧的图片，然后再把图片拼接成电影的。这就是离线渲染

**实时渲染**：就是需要不停的对画面进行渲染，即使画面中什么也没有改变，也需要重新渲染

实时渲染:

```js
function render() {
    cube.rotation.x += 0.1;
    cube.rotation.y += 0.1;
    renderer.render(scene, camera);
    requestAnimationFrame(render);
}
```

其中一个重要的函数是requestAnimationFrame，这个函数就是让浏览器去执行一次参数中的函数，这样通过上面render中调用requestAnimationFrame()函数，requestAnimationFrame()函数又让rander()再执行一次，就形成了我们通常所说的游戏循环了。

# 场景,相机,渲染器之间的关系

![](https://ws4.sinaimg.cn/large/006tNc79ly1fgqt7hkgzpj30xm0oogm3.jpg)

# 画点

```js
THREE.Vector3 = function ( x, y, z ) {
this.x = x || 0;
this.y = y || 0;
this.z = z || 0;
};
```

THREE.Vector3被赋值为一个函数。这个函数有3个参数，分别代表x坐标，y坐标和z坐标的分量。函数体内的代码将他们分别赋值给成员变量x，y，z。看看上面的代码，中间使用了一个“||”（或）运算符，就是当x=null或者undefine时，this.x的值应该取0。











