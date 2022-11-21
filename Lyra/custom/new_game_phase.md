# 新增游戏流程

`ShooterCore\Content\Experiences\Phases` 目录下新建一个蓝图,参考[GamePhase流程](../GamePhase/README.md) 看一下应该插入到哪里

在蓝图: 事件ActiveAbility里写进入流程时的行为, OnEndAbility里写退出流程时的行为

比如可以在Warmup和Playing之间插一个流程来播放MP4,播放完之后再进入Playing
