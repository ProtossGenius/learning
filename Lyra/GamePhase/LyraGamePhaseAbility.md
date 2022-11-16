# 游戏流程活动父类
类 ULyraGamePhaseAbility : public [ULyraGameplayAbility]() 

定义了一个编辑器可以编辑的`FGameplayTag GamePhaseTag;`这里定义了活动对应的游戏阶段标签
查看代码可以知道,在 `ULyraGamePhaseSubsystem::OnBeginPhase` 时会先获取这个这个标签,方法的最后会同步所有观察者此Tag已经开始了.

蓝图中有两个事件,分别是ability启动和关闭时的行为.

关于流程的其他部分之后再分析.