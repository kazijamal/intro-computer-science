breed [ shooters shooter ]
breed [ minions minion ]
breed [ bosses boss ]
breed [ bullets bullet ]
breed [ bullets2 bullet2 ]
breed [ bullets3 bullet3 ]
breed [ health-powerups health-powerup ]
breed [ insta-powerups insta-powerup ]
globals [ score lives ]
minions-own [ points ]
bosses-own [ health move ]

;; Observer Procedure
to moveLeft
  set xcor ( xcor - 1 )
end

;; Observer Procedure
to moveRight
  set xcor ( xcor + 1 )
end

;; Observer Procedure
to moveDown
  set ycor ( ycor - 1 )
end

;; Observer Procedure
to moveUp
  set ycor ( ycor + 1 )
end

;; Observer Procedure
to shooterLeft
  ask shooters
  [
    moveLeft
    wait 0.125
  ]
end

;; Observer Procedure
to shooterRight
  ask shooters
  [
    moveRight
    wait 0.125
  ]
end

;; Observer Procedure
to patch-setup
  ask patches with [ pycor <= -6 and pycor >= -11 ]
  [ set pcolor one-of [ 32 33 62 ] ]
  ask patches with [ pycor >= -5 and pycor <= 11 ]
  [ set pcolor one-of [ 100 101 102 103 ] ]
end

;; Observer Procedure
to shooter-setup
  crt 1
  [
    set color green
    set breed shooters
    set shape "shooter"
    move-to patch 0 -6
    set heading 0
    set size 2
  ]
end

;; Observer Procedure
to minions-setup
  crt 45
  [
    set color white
    set breed minions
    set shape "minion"
    move-to one-of patches with [ ( pxcor >= -7 and pxcor <= 7 ) and ( pycor > 0 and pycor <= 3 ) and ( not any? minions-here ) ]
    set heading 0
    set size 1
    set points ycor
  ]
end

;; Observer Procedure
to boss-setup
  crt 1
  [
    set color red
    set breed bosses
    set shape "boss"
    move-to patch 0 6
    set health 3
    set size 2
  ]
end

;; Observer Procedure
to level1
  ca
  set score 0
  set lives 3
  patch-setup
  shooter-setup
  minions-setup
  boss-setup
end

;; Observer Procedure
to minions-move
  every 0.5
  [
    ask minions
    [ moveRight ]
  ]
end

;; Observer Procedure
to boss-move
  every 0.5
  [
    ask bosses
    [ set move random 2
      if move = 0 [ moveLeft ]
      if move = 1 [ moveRight ]
    ]
  ]
end

;; Turtle Procedure
to makeBullet
  hatch 1
  [
    set breed bullets
    set shape "cannon"
    set size 0.75
    set heading 0
  ]
end

;; Observer Procedure
to shooter-shoot
  ask shooters
  [ makeBullet ]
end

;; Turtle Procedure
to makeBullet2
  hatch 1
    [
      set breed bullets2
      set shape "cannon"
      set size 0.75
      set heading 180
  ]
end

;; Observer Procedure
to minions-shoot
  every 2
  [
    if count minions > 10
    [
      ask n-of random 10 minions
      [
        makeBullet2
      ]
    ]
    if count minions <= 10 and count minions > 5
    [
      ask n-of random 5 minions
      [
        makeBullet2
      ]
    ]
    if count minions <= 5 and count minions > 2
    [
      ask n-of random 2 minions
      [
        makeBullet2
      ]
    ]
    if count minions <= 2 and count minions > 0
    [
      ask n-of 1 minions
      [
        makeBullet2
      ]
    ]
    if count minions = 0
    [ stop ]
  ]
end

;; Turtle Procedure
to makeBullet3
  hatch 1
  [
    set breed bullets3
    set shape "dart"
    set size 1
    set heading 180
  ]
end

;; Observer Procedure
to boss-shoot
  every 2
  [
    ask bosses
    [
      makeBullet3
    ]
  ]
end

;; Observer Procedure
to powerup1
  every 30
  [
    crt 1
    [
      set breed health-powerups
      set color pink
      set shape "suit heart"
      move-to one-of patches with [ pycor = max-pycor ]
    ]
  ]
end

;; Observer Procedure
to powerup2
  every 40
  [
    crt 1
    [
      set breed insta-powerups
      set color black
      set shape "cow skull"
      move-to one-of patches with [ pycor = max-pycor ]
    ]
  ]
end

;; Observer Procedure
to setup
  minions-move
  boss-move
  minions-shoot
  boss-shoot
  powerup1
  powerup2
  repeating
  if lives = 0
  [ ask shooters
    [
      set color red
      set shape "cow skull"
      set color black
      wait 2
      die
    ]
    show "Game over!"
    wait 1
    stop
  ]
  if count minions + count bosses = 0
  [
    wait 1
    show "You won!"
    ca
    stop
  ]
end

;; Observer Procedure
to shooterBullet
  ask bullets
    [
      moveUp
      if any? minions-here with [ points = 1 or points = 2 or points = 3 ]
      [
        set score ( score + [ points ] of ( one-of minions-here ) * 10 )
        ask minions-here
        [ die ]
        die
        stop
      ]
      if any? bosses-here
      [
        ask one-of bosses-here
        [
          set color violet
          wait 0.5
          set color red
          set health ( health - 1 )
          if health = 0 [ die ]
        ]
      ]
      if ycor = max-pycor
      [ die ]
    ]
end

;; Observer Procedure
to minionBullet
  ask bullets2
    [
      moveDown
      if any? shooters-here
      [
        ask shooters
        [
          set color red
          wait 0.5
          set color green
        ]
        set lives ( lives - 1 )
        stop
      ]
      if ycor = min-pycor
      [ die ]
    ]
end

;; Observer Procedure
to bossBullet
  ask bullets3
    [
      moveDown
      if any? shooters-here
      [
        ask shooters
        [
          set color red
          wait 0.5
          set color green
        ]
        set lives ( lives - 1 )
        stop
      ]
      if ycor = min-pycor
      [ die ]
    ]
end

;; Observer Procedure
to healthPowerUp
  ask health-powerups
    [
      moveDown
      if any? shooters-here
      [
        ask shooters
        [
          set color pink
          wait 0.5
          set color green
        ]
        set lives ( lives + 1 )
        stop
      ]
      if ycor = min-pycor
      [ die ]
    ]
end

;; Observer Procedure
to instaPowerUp
  ask insta-powerups
  [
    moveDown
    if any? shooters-here
    [
      ask shooters
      [
        set color black
        wait 0.5
        set color green
      ]
      ifelse count minions = 0
      [ stop ]
      [
        ask n-of 3 minions
        [ die ]
      ]
      stop
    ]
    if ycor = min-pycor
    [ die ]
  ]
end

;; Observer Procedure
to repeating
  every 0.1
  [
    shooterBullet
    minionBullet
    bossBullet
    healthPowerUp
    instaPowerUp
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
298
115
1261
747
-1
-1
41.53333333333333
1
10
1
1
1
0
1
1
1
-11
11
-7
7
0
0
1
ticks
30.0

MONITOR
560
36
758
81
Score
score
17
1
11

MONITOR
890
37
977
82
Lives
lives
17
1
11

BUTTON
70
60
176
93
Setup Level 1
level1
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL
1

BUTTON
51
174
114
207
Left
shooterLeft
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
126
173
195
206
Right
shooterRight
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
75
136
165
169
Shoot
shooter-shoot
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
64
97
185
130
Start Level 1
setup\n
T
1
T
OBSERVER
NIL
W
NIL
NIL
1

MONITOR
787
37
865
82
Boss Health
[ health ] of one-of bosses
17
1
11

@#$#@#$#@
## WHAT IS IT?

This is a modified version of a game known as Space Invaders. The player’s goal is to defeat all of the minions and to take down the boss, while avoiding the projectiles fired at you by the minions and the boss. The player has 3 lives and has to avoid getting hit by the invaders' bullets while shooting back at them. In order for the boss to be killed, it has to be hit three times. There are also health and insta kill powerups that are dropped from the sky at selected intervals.

## HOW IT WORKS

Pressing moveLeft makes the shooter/player turtle subtract one from its xcor, and pressing moveRight makes the shooter/player turtle add one to its xcor. Each of the setup codes creates a certain amount of turtles, sets the breed and shape, and moves it to a certain coordinate. Shooting a bullet sends out a projectile which vanishes upon the first monster hit. This hit is recognized by checking if the patch the bullet is on has a “minion” (our breed of monsters) with a points attribute of 1, 2, or 3 determined by their row from bottom to top. It then asks the monster at the patch on which it stops to die, sets the score to the points attribute times 10 plus the current score, and then kills itself. All of the bullets, in addition to the shooter, minions, and boss, are turtles that utilize the moveDown and moveUp functions, which allows them to move down and up by subtracting and adding one to their ycor, respectively. The world wraps horizontally to allow the minions and boss to move more freely. The function level1 sets the scoreboard to 0, and both the boss and shooter’s lives to 3, through the minions-setup, boss-setup, and shooter-setup. In addition, patch-setup makes the ground and sky of the world. The setup function gives the minions and boss their movements, where the minions move continuously to the right and the boss randomly, as well as their randomized shooting. When the shooter is hit three times, the observer says “Game Over”, and when all minions and the boss are killed, the observer says “You Win”. Finally, there are powerups that are spawned by the functions powerup1 and powerup2, that gives the player an extra life, and kills three random minions, respectively. 


## HOW TO USE IT

Press "Setup Level 1" to spawn in the minions, boss, and shooter. Then press "Start Level 1", which starts the level and makes the minions constantly move right and the boss move left or right randomly as the world wraps around horizontally. The S key is used to shoot bullets, and A/D are used to move left and right, respectively. 


## THINGS TO NOTICE

Pay attention to the “lives” monitor. You only have 3 lives before the game ends. The boss health monitor shows how many more bullets need to hit the boss in order to defeat it. The scoreboard shows how many points you have earned, and each row of minions have different scores, as well as the boss. 


## THINGS TO TRY

There are a variety of powerups that are in this game. Powerups spawn every 30 to 40 seconds, which can improve your chances of winning. You can collect the heart powerup, which spawns every 30 seconds to gain 1 extra life. Another powerup is the insta kill powerup, which kills three random minions. You can also try to complete the level without the use of any powerups, as well as without losing any lives, which is a challenge.


## EXTENDING THE MODEL

More levels could be added, along with varying minion and boss movement in order to make the game harder. Along with more levels, more power ups could lead to variety in gameplay and a more fun experience for the player.


## RELATED MODELS

No related models were used to write this games' code.


## CREDITS AND REFERENCES

Created by Kazi Jamal, Eric Shao, and Aldrich Zhang, Period 7.

This game is based off of the Space Invaders arcade game from 1978, with some changes and added aspects to the gameplay.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

boss
false
0
Polygon -1 true false 0 150 15 180 60 210 120 225 180 225 240 210 285 180 300 150 300 135 285 120 240 105 195 105 150 105 105 105 60 105 15 120 0 135
Polygon -16777216 false false 105 105 60 105 15 120 0 135 0 150 15 180 60 210 120 225 180 225 240 210 285 180 300 150 300 135 285 120 240 105 210 105
Polygon -7500403 true true 60 131 90 161 135 176 165 176 210 161 240 131 225 101 195 71 150 60 105 71 75 101
Circle -16777216 false false 255 135 30
Circle -16777216 false false 180 180 30
Circle -16777216 false false 90 180 30
Circle -16777216 false false 15 135 30
Circle -7500403 true true 15 135 30
Circle -7500403 true true 90 180 30
Circle -7500403 true true 180 180 30
Circle -7500403 true true 255 135 30
Polygon -16777216 false false 150 59 105 70 75 100 60 130 90 160 135 175 165 175 210 160 240 130 225 100 195 70

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

cannon
true
0
Polygon -7500403 true true 165 0 165 15 180 150 195 165 195 180 180 195 165 225 135 225 120 195 105 180 105 165 120 150 135 15 135 0
Line -16777216 false 120 150 180 150
Line -16777216 false 120 195 180 195
Line -16777216 false 165 15 135 15
Polygon -16777216 false false 165 0 135 0 135 15 120 150 105 165 105 180 120 195 135 225 165 225 180 195 195 180 195 165 180 150 165 15

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cow skull
false
0
Polygon -7500403 true true 150 90 75 105 60 150 75 210 105 285 195 285 225 210 240 150 225 105
Polygon -16777216 true false 150 150 90 195 90 150
Polygon -16777216 true false 150 150 210 195 210 150
Polygon -16777216 true false 105 285 135 270 150 285 165 270 195 285
Polygon -7500403 true true 240 150 263 143 278 126 287 102 287 79 280 53 273 38 261 25 246 15 227 8 241 26 253 46 258 68 257 96 246 116 229 126
Polygon -7500403 true true 60 150 37 143 22 126 13 102 13 79 20 53 27 38 39 25 54 15 73 8 59 26 47 46 42 68 43 96 54 116 71 126

cylinder
false
0
Circle -7500403 true true 0 0 300

dart
true
0
Polygon -7500403 true true 135 90 150 285 165 90
Polygon -7500403 true true 135 285 105 255 105 240 120 210 135 180 150 165 165 180 180 210 195 240 195 255 165 285
Rectangle -1184463 true false 135 45 165 90
Line -16777216 false 150 285 150 180
Polygon -16777216 true false 150 45 135 45 146 35 150 0 155 35 165 45
Line -16777216 false 135 75 165 75
Line -16777216 false 135 60 165 60

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

minion
false
0
Polygon -7500403 true true 75 150 90 195 210 195 225 150 255 120 255 45 180 0 120 0 45 45 45 120
Circle -16777216 true false 165 60 60
Circle -16777216 true false 75 60 60
Polygon -7500403 true true 225 150 285 195 285 285 255 300 255 210 180 165
Polygon -7500403 true true 75 150 15 195 15 285 45 300 45 210 120 165
Polygon -7500403 true true 210 210 225 285 195 285 165 165
Polygon -7500403 true true 90 210 75 285 105 285 135 165
Rectangle -7500403 true true 135 165 165 270

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

shooter
true
0
Rectangle -7500403 true true 144 0 159 105
Rectangle -6459832 true false 195 45 255 255
Rectangle -16777216 false false 195 45 255 255
Rectangle -6459832 true false 45 45 105 255
Rectangle -16777216 false false 45 45 105 255
Line -16777216 false 45 75 255 75
Line -16777216 false 45 105 255 105
Line -16777216 false 45 60 255 60
Line -16777216 false 45 240 255 240
Line -16777216 false 45 225 255 225
Line -16777216 false 45 195 255 195
Line -16777216 false 45 150 255 150
Polygon -7500403 true true 90 60 60 90 60 240 120 255 180 255 240 240 240 90 210 60
Rectangle -16777216 false false 135 105 165 120
Polygon -16777216 false false 135 120 105 135 101 181 120 225 149 234 180 225 199 182 195 135 165 120
Polygon -16777216 false false 240 90 210 60 211 246 240 240
Polygon -16777216 false false 60 90 90 60 89 246 60 240
Polygon -16777216 false false 89 247 116 254 183 255 211 246 211 237 89 236
Rectangle -16777216 false false 90 60 210 90
Rectangle -16777216 false false 143 0 158 105

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

suit diamond
false
0
Polygon -7500403 true true 150 15 45 150 150 285 255 150

suit heart
false
0
Circle -7500403 true true 135 43 122
Circle -7500403 true true 43 43 122
Polygon -7500403 true true 255 120 240 150 210 180 180 210 150 240 146 135
Line -7500403 true 150 209 151 80
Polygon -7500403 true true 45 120 60 150 90 180 120 210 150 240 154 135

suit spade
false
0
Circle -7500403 true true 135 120 122
Polygon -7500403 true true 255 165 240 135 210 105 183 80 167 61 158 47 150 30 146 150
Circle -7500403 true true 43 120 122
Polygon -7500403 true true 45 165 60 135 90 105 117 80 133 61 142 47 150 30 154 150
Polygon -7500403 true true 135 210 135 253 121 273 105 284 195 284 180 273 165 253 165 210

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
