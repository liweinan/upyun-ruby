upyun-ruby
==========

又拍云不提供Ruby客户端，自己写一个好了。

---

## 使用示例

### 上传

	require 'upyun'
	up = UpYun.new('bucketname', 'username', 'password')
	f = open('google.png')
	up.writeFile('/google.png', f)

### 读取文件目录

	require 'upyun'
	up = UpYun.new('bucketname', 'username', 'password')
	up.readDir('/filepath')

---

[@gccyugi](https://gist.github.com/gccyugi)写了一个Lua风格的upyun客户端在[这里](http://gist.github.com/2723675)；此外，TA还写了一个[Python客户端](http://gist.github.com/2658028)。