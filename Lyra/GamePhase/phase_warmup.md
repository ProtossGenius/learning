# 流程步骤-热身

1. ApplyEffectToAll [GE_PregameLobby](../GameEffect/GE_PregameLobby.md) 
2. 广播ShooterGame.GamePhase.MatchBeginCountdown到所有客户端
3. RemoveEffectFromAll [GE_PregameLobby](../GameEffect/GE_PregameLobby.md)
4. StartPhase [开始游戏流程](phase_playing.md)
