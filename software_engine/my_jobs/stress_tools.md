# 压测工具

* 前提
有个百行左右的简单压测工具,包含了上线,自由移动的逻辑.下面是其框架


```
struct Player{
	// 保存了用户信息等
}

enum{
	STATUS_LOGIN
	STATUS_LOGIN_ING
	STATUS_ENTER_GAME
	STATUS_ENTER_GAME_ING
	STATUS_RANDOM_MOVE
	STATUS_RANDOM_MOVE_ING
}

func run(Player p){
	switch(p.status){
		case STATUS_START:
			p.doLogin(); // 发送对应协议
			p.status = STATUS_LOGIN_ING
			...
	}
}

func recv(Message msg, Player p){
	switch(msg.id){
		case MSGID_LOGIN_SUC:
			p.status = STATUS_ENTER_GAME;
			...
	}
}


```

我对其进行了修改,细节大致如下

```
struct Player{
	// 保存用户信息
	BlockMgr blockMgr //是一个数组,用来描述要做的事情列表
}

func (Player p) setStatusSuc(){
	p.blockMgr.goNext()
	// 算出当前状态的成功值
	if p.blockMgr.end(){
		p.blockMgr = p.getNextBlockMgr()
	}
}

func run(Player p){
	statusDo(p.getStatus())
}

func recv(Message msg, Player p){
	if statusRecv(msg, p){ // 吞下消息
		return
	}

	// 这里用来写通用的消息处理
}

// status.go 由工具进行维护
enum{
	STATUS_START
	STATUS_LOGIN
	STATUS_LOGIN_ING
	STATUS_LOGIN_SUC
	STATUS_LOGIN_FAIL
	...
}	

func statusDo(Player p){
	p.setStatusGoing()
	switch(p.getStatus()){
		case STATUS_LOGIN:
			login(p) //这个函数名是工具将上面的常量名改为驼峰式
		...
	}	
}

func recvsDo(Message msg, Player p) (eatMsg bool) {
	switch(p.getStatus()){
		case STATUS_LOGIN:
			return login_recv(msg, p)
		...	
	}

	return false
}

/****************/
map[string]int StatusStrToConst = {
	"STATUS_START" : STATUS_START,
}

map[int]string StatusConstToStr = {
	STATUS_START : "STATUS_START",
}

// actions.go 
func login(Player p){

}

//新的status会被工具自动追加到这里面,工具不会从中删除函数

// recvs.go
// 函数名是工具将常量名改为驼峰式再追加了_recv后缀
func (Player p)login_recv(Message msg) bool { 
	
}
//新的status会被工具自动....

// BlockMgr.go  使用工具进行管理
enum{
	BLOCKS_RAND_MOVE
	...
}

map[string]int BlockStrToConst = {
	...
}
map[int]string BlockConstToStr = {
	...
}

func newBlockMgr(int blockMgrConst) BlockMgr{
	switch(blockMgrConst){
		case BLOCKS_RAND_MOVE:
			return blocksRandMove()
		...
	}
}

func newBlockMgrFromStr(string blockMgrConst) BlockMgr{
	return newBlockMgr(BlockStrToConst(blockMgrConst))
}


// Blocks.go
func blocksRandMove() BlockMgr{
	BlockMgr res
	// todo:
	return res
}

```

系统框架

* 状态转移系统,如上

* Player管理
里面存了所有的Player,并且可以快速获得处于待命状态的Player以便给它们分配任务.

* 组队管理
这算是一个功能,提供了一个比较安全的组队策略.

* Web接口
这部分不是我做的,通过URL来改变运行时状态,使用了Player管理里预留的接口

* Script接口
定义了简单的按行解析的语法,可以避免Web调用(不过后来QA觉得URL已经足够好用了,只有我自己在用)


## 成效

新增的时候只需要 打开工具->输入要新增的东西并生成代码->填空
删除的时候,以Status为例,找到对应的_ING后缀常量,将_ING删掉,重新生成代码即可

