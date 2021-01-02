# Web后台开发

当时设计了一个工具用来简化后台开发

```
// urlName.csv 
Contains,param1,param2,param3
Must,param4,param5
Contains,param6,param7
ToDb,db_name
# db字段名,比较符号,param名
db_filed1,=,param1

```

可以自动生成如下格式的代码:

```
func urlName() rets {
	param1 = get("param1")
	...
	if param1 == "" && param2 == "" && p3 == ""{
		return "param1,2,3 不能同时为空"
	}

	if param4 == "" {
		return "param4 不能为空"
	}

	...

	"select * from %db_name where db_filed1=%param1"
	...
}
```

具体代码会比上面的复杂很多,当时做到了完全使用上述的元数据来生成后端代码.不过我只接受了Url处理相关的功能,
所以并没有更系统一些的工具.
