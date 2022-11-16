# 游戏流程

在蓝图中,活动的开始和结束仅仅打印了几条日志.通过追踪其绑定的标签`ShooterGame.GamePhase.Playing`
找到了蓝图   B_ControlPointVolume， 看上去除了在此模式中，没有其他地方再对playing状态做判断

该状态的结束定义于 [队伍分数组件-游戏流程](../configs/teamscore.md#game_phase)