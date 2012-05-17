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



