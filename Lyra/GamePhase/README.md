# 游戏流程
[Lyra官方文档](https://docs.unrealengine.com/5.0/zh-CN/abilities-in-lyra-in-unreal-engine/)
中游戏阶段技能介绍了游戏阶段的实现

[此处](https://docs.unrealengine.com/4.27/zh-CN/ProgrammingAndScripting/Tags/) 介绍了如何创建一个GameTag
在Lyra中,游戏阶段技能定义于 ShooterGame.GamePhase.*

涉及到的子系统 :
[游戏流程子系统](../subsystem/phase.md) , [消息子系统](../subsystem/message.md)

涉及到的类:
[流程活动类的父类](LyraGamePhaseAbility.md)

这里以关卡 L_ShooterGym 为例,分析游戏流程的调用顺序

1. 其[配置文件](../configs/README.md) 为蓝图 B_ShooterGame_Elimination
2. 进入[蓝图B_TeamDeathMatchScoring](../configs/teamscore.md)


> refs

[官方文档](https://docs.unrealengine.com/5.0/zh-CN/abilities-in-lyra-in-unreal-engine/)

# Catalog
---
[<<< upper page](../README.md)
---
* [\<file>LyraGamePhaseAbility.md -> 游戏流程活动父类](./LyraGamePhaseAbility.md)
* [\<file>phase_playing.md -> 游戏流程](./phase_playing.md)
* [\<file>phase_warmup.md -> 流程步骤-热身](./phase_warmup.md)

# SubCatalog

---
[<<< upper page](../README.md)
---