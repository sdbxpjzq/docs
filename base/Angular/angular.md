# 基础命令

## checkbox

`<input type="checkbox" ng-mudel="name" ng-true-value="yes" ng-false-value="no" ng-change="fn()">`

ng-mudel 属性是Angularjs里面最常见的属性了，是用来数据双向绑定的属性。

ng-true-value 属性设置当 checkbox 选择状态返回的值。

ng-false-value 属性设置当 checkbox 非选择状态返回的值。

ng-change 属性设置当 checkbox 选择状态改变的时候调用的函数。

```js
<div ng-controller="checkout">
 <input type="checkbox" ng-model="choose" ng-true-value="choosed" ng-false-value="unchoosed" ng-change="backfn();">
 <p>{{choose}}</p>
</div>
<script>
function checkout($scope){
  $scope.choose = "choosed";
  $scope.backfn=function(){
    alert("checkbox值改变");
  }
}
</script>
```



如果想 ng-change 触发的函数里获取到该触发该函数的元素不能直接传入 this ，而需要传入 $event 。因为在 Angularjs 里面，这个地方的 this 是 $scope 。我们可以传入 $event ，然后在 函数里面通过 $event.target 来获取到该元素。



## ng-style

条件判断

```js
<h1 ng-style="{'color': true ? 'green' : 'red' }">菜鸟教程</h1
```



## ng-options

填充下拉列表

```js
<select ng-model="one" 
		ng-options="item.k as item.v for item in [{k:'type',v:'品类'},{k:'mdd',v:'目的地'}]">
	<option value="" selected>选择tag</option>
</select>
```

设置默认值:

```js
$scope.one = 'type';
```





