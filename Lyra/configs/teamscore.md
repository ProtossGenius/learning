# 组队死亡匹配分数

蓝图B_TeamDeathMatchScoring,其父类是在GameStateComponent

1. 在等待就绪后,调用StartPhase方法执行 开始运行 [热身流程](../GamePhase/phase_warmup.md)
2. 初始化游戏逻辑
热身流程之后会通过委托运行蓝图B_TeamDeathMatchScoring的GameStarted方法,这里会初始化一些预期需要的分数/每局时常等
4. 待补充

#game_phase

1. 在初始化游戏逻辑时,设置了一个定时器,每隔1s就执行自定义事件CountDown,当CountDownTime的值降为0取分数高的队伍获胜,进入phase_post 
2. 在初始化游戏逻辑时,设置了一个预期分数,率先到达这个分数的队伍获胜
   - 关于当前分数的取值: GetTeamScore,可以看到是取的`ShooterGame.Score.Eliminations`的stackCount
   - 对上述标签搜索,可以看到是B_ShooterGameScoring_Base中有这样一个Listener,侦听的标签是Lyra.Elimination.Message
   - 在VisualStudio中跟踪该标签,可以发现ULyraHealthComponent::HandleOutOfHealth中会发送该标签
    

