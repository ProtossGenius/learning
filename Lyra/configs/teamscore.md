# 组队死亡匹配分数

蓝图B_TeamDeathMatchScoring,其父类是在GameStateComponent

1. 在等待就绪后,调用StartPhase方法执行 开始运行 [热身流程](../GamePhase/phase_warmup.md)
2. 初始化游戏逻辑
热身流程之后会通过委托运行蓝图B_TeamDeathMatchScoring的GameStarted方法,这里会初始化一些预期需要的分数等
3. 待补充

#game_phase

