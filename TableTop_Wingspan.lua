if Player.Red.seated == true then
        Player.Red.changeColor("White")
end
if Player.Green.seated == true then
        Player.Green.changeColor("Yellow")
end
if Player.Green.seated == true then
        Player.Green.changeColor("Red")
end
baseBirdDeck_GUID='1e00d4'
baseBonusDeck_GUID='588f1a'
baseRoundScoringDeck_GUID='77388e'

rollButton_GUID='95881a'
startMenu_GUID='bd1349'
SetupMenuSelectedColor = {113/255, 134/255, 199/255, 1}
greenScoringBoard=false
wingspanEuropeanExpansion=false
expBag_GUID='4b5bd4'

scoringBoard_GUID='cca07e'
roundScoringDone=false
numPlayer=2
num=0--track do end roung scoring

player3Object_GUID={'cebb72','ea5e99','f65380','06d1ae','c0c782','4a6ab7','df41fa','af6713'}
player4Object_GUID={'c99699','9009b3','8071bd','f79dda','6100d9','01eda4','4e5b7b','995b3c'}
newRoundButton_GUID='bc0132'
cardShopScriptZone_GUID='dbf700'
shopBoard_GUID='73d70d'
cardSetPos={{-2.64, 1.13, -0.08},{-5.24, 1.13, -0.09},{-7.83, 1.13, -0.08}}

scoringRoundSetPos={{1.91, 1.13, 9.45},{1.91, 1.13, 8.40},{1.92, 1.13, 7.36},{1.91, 1.13, 6.34}}
scoringButton={
    blueSide={button01={pos={-0.58,0.1,0.82},row=1},    button02={pos={-0.19,0.1,0.82},row=2},  button03={pos={0.19,0.1,0.82},row=3},   button04={pos={0.57,0.1,0.82},row=4},
              button11={pos={-0.58,0.1,0.62},row=1},    button12={pos={-0.19,0.1,0.62},row=2},  button13={pos={0.19,0.1,0.62},row=3},   button14={pos={0.57,0.1,0.62},row=4},
              button21={pos={-0.58,0.1,0.43},row=1},    button22={pos={-0.19,0.1,0.43},row=2},  button23={pos={0.19,0.1,0.43},row=3},   button24={pos={0.57,0.1,0.43},row=4},
              button31={pos={-0.58,0.1,0.23},row=1},    button32={pos={-0.19,0.1,0.23},row=2},  button33={pos={0.19,0.1,0.23},row=3},   button34={pos={0.57,0.1,0.23},row=4},
              button41={pos={-0.58,0.1,0.04},row=1},    button42={pos={-0.19,0.1,0.04},row=2},  button43={pos={0.19,0.1,0.04},row=3},   button44={pos={0.57,0.1,0.04},row=4},
              button51={pos={-0.58,0.1,-0.15},row=1},   button52={pos={-0.19,0.1,-0.15},row=2}, button53={pos={0.19,0.1,-0.15},row=3},  button54={pos={0.57,0.1,-0.15},row=4},
            },
    greenSide={ button10s={5.86, 1.32, 9.43},button11s={5.04, 1.32, 9.43},button12s={4.25, 1.32, 9.43},button13s={3.49, 1.32, 9.43},
                button20s={5.85, 1.32, 8.38},button21s={5.06, 1.32, 8.38},button22s={4.25, 1.32, 8.38},button23s={3.49, 1.32, 8.37},
                button30s={5.82, 1.32, 7.30},button31s={5.07, 1.32, 7.32},button32s={4.28, 1.32, 7.34},button33s={3.46, 1.32, 7.33},
                button40s={5.87, 1.32, 6.28}, button41s={5.04, 1.32, 6.30}, button42s={4.27, 1.32, 6.30}, button43s={3.48, 1.32, 6.31},
            },
}
foods={
    invertebrate={guid='d5b341', childPos={5.6,0,-5.95},},
    seed={guid='8ac207', childPos={-3.39,0,-5.95},},
    fish={guid='df75a2', childPos={1.2,0,-5.95},},
    fruit={guid='cfdc4f', childPos={3.4,0,-5.95},},
    rodent={guid='17256b', childPos={-1,0,-5.95},},
}
player3FoodsPos={seed={6.05,0,-3.23}, invertebrate={6.05,0,5.55}, fish={6.05,0,1.19}, fruit={6.05,0,3.28},rodent={6.05,0,-0.94}}
player4FoodsPos={seed={-6.03,0,3.28}, invertebrate={-6.03,0,-5.47}, fish={-6.03,0,0.84}, fruit={-6.03,0,-3.51},rodent={-6.03,0,-1.34}}
dice_GUIDs={'bd09eb','49a478','bf73ca','0cb0b7','a727b2'}
dice={}
diceSetPosition={
    {-2.68,1.43,7.37},{-1.47, 1.43, 7.57},{-0.38, 1.43, 7.16},{-1.06, 1.43, 6.36},{-2.16, 1.43, 6.28}
}
boards_GUIDs={Yellow='11c94a',White='b16643', Red='cebb72',Green='c99699'}
boards={}
actionTokens_GUID={
    Yellow  ={'4441db','7cbac5','18cd1a','36ec23','7e1890','939312','bea1e3','67bf2e'},
    White   ={'cc1762','e1a741','4ffc84','31af56','c1dc02','10f507','e5417b','c979e2'},
    Red     ={'4ddc66','f3fef8','c12a61','afc0a3','78b913','05c6c3','39df88','51a310'},
    Green   ={'8b584b','c3edfa','d04787','e46b2b','f22d96','919f28','c61f87','1fbed2'},
}
numAction=8
currentRound=1
actionTokens={
    Yellow={},
    White={},
    Red={},
    Green={},
}
actionTokenSetPosition={{8.22,1,-3.33}, {7.76,1,-3.33}, {8.22,1,-3.77}, {7.76,1,-3.77},  {8.22,1,-4.21}, {7.76,1,-4.21}, {8.22,1,-4.65}}
actionTokenSetPosition_P3={{3.29, 0, 8.06},{3.29, 0, 7.61},{3.81, 1.12, 8.06},{3.81, 1.12, 7.61},{4.26, 1.12, 8.06},{4.26, 1.12, 7.61},{4.77, 1.12, 7.61},}
actionTokenSetPosition_P4={{-3.26,0, -8.2},{-3.26,0, -7.68},{-3.83,0,-8.2},{-3.83,0,-7.68},{-4.36,0,-8.2},{-4.36,0,-7.68},{-4.86,0,-8.2}}

function onLoad()
    getObjectFromGUID('02dfb3').shuffle()
    player3Object={}
    for i,guid in ipairs(player3Object_GUID) do
        player3Object[i]=getObjectFromGUID(guid)
    end
    player4Object={}
    for i,guid in ipairs(player4Object_GUID) do
        player4Object[i]=getObjectFromGUID(guid)
    end

    expBag=getObjectFromGUID(expBag_GUID)

    startMenu=getObjectFromGUID(startMenu_GUID)
    startMenu.createButton({--0
        click_function = "doNothing",
        function_owner = self,
        label          = "Wingspan+EXP Menu",
        position       = {0,4,0},
        rotation       = {0,180,0},
        width          = 0,
        height         = 0,
        font_size      = 600,
        font_color     = {1,1,1}
    })
    startMenu.createButton({--1
        click_function = "doNothing",
        function_owner = self,
        label          = "Number Player",
        position       = {0,4,-1.5},
        rotation       = {0,180,0},
        width          = 0,
        height         = 0,
        font_size      = 400,
        font_color     = {1,1,1}
    })
    startMenu.createButton({--2
        click_function = "setPlayers_2",
        function_owner = self,
        label          = "2",
        position       = {1,4,-2.5},
        rotation       = {0,180,0},
        width          = 500,
        height         = 500,
        font_size      = 300,
        color          =SetupMenuSelectedColor,
    })
    startMenu.createButton({--3
        click_function = "setPlayers_3",
        function_owner = self,
        label          = "3",
        position       = {0,4,-2.5},
        rotation       = {0,180,0},
        width          = 500,
        height         = 500,
        font_size      = 300,
    })
    startMenu.createButton({--4
        click_function = "setPlayers_4",
        function_owner = self,
        label          = "4",
        position       = {-1,4,-2.5},
        rotation       = {0,180,0},
        width          = 500,
        height         = 500,
        font_size      = 300,
    })
    startMenu.createButton({--5
        click_function = "toggleScoringBoard",
        function_owner = self,
        label          = "Green Scoring Board",
        position       = {0,4,-3.5},
        rotation       = {0,180,0},
        width          = 3500,
        height         = 500,
        font_size      = 300,
    })
    startMenu.createButton({--6
        click_function = "toggleExp",
        function_owner = self,
        label          = "European Expansion",
        position       = {0,4,-4.5},
        rotation       = {0,180,0},
        width          = 3500,
        height         = 500,
        font_size      = 300,
    })
    startMenu.createButton({--7
        click_function = "startSetup",
        function_owner = self,
        label          = "Start Game",
        position       = {0,4,-5.5},
        rotation       = {0,180,0},
        width          = 3500,
        height         = 500,
        font_size      = 300,
    })


    baseRoundScoringDeck=getObjectFromGUID(baseRoundScoringDeck_GUID)
    scoringBoard=getObjectFromGUID(scoringBoard_GUID)
    cardShopScriptZone=getObjectFromGUID(cardShopScriptZone_GUID)
    shopBoard=getObjectFromGUID(shopBoard_GUID)

    for i, color in pairs(actionTokens_GUID) do
        local playerColor=i
        for v,guid in ipairs(color) do
            actionTokens[playerColor][v]=getObjectFromGUID(guid)
        end
    end
    for i, guid in pairs(boards_GUIDs) do
        boards[i]=getObjectFromGUID(guid)
    end
    for i, food in pairs(foods) do
        getObjectFromGUID(food.guid).createButton({
            click_function=i,
            function_owner=self,
            width=1300,
            height=1300,
            position={0,0.2,0},
            rotation={0,180,180},
        })
    end
    for i, guid in ipairs(dice_GUIDs) do
        dice[i]=getObjectFromGUID(guid)
    end
    rollButton=getObjectFromGUID(rollButton_GUID)
    newRoundButton=getObjectFromGUID(newRoundButton_GUID)
    ------StarGame----
    baseBirdDeck=getObjectFromGUID(baseBirdDeck_GUID)
    baseBonusDeck=getObjectFromGUID(baseBonusDeck_GUID)
    roundScoring={}
end

-----------------Setup Menu Function-----------------------------
function toggleScoringBoard()
    local bgcolor = SetupMenuSelectedColor
    if greenScoringBoard then
         greenScoringBoard = false
         bgcolor = {1,1,1,1}
     else
         greenScoringBoard = true
     end
     startMenu.editButton({
         index = 5,
         color = bgcolor,
     })
end
function toggleExp()
    local bgcolor = SetupMenuSelectedColor
    if wingspanEuropeanExpansion then
         wingspanEuropeanExpansion = false
         bgcolor = {1,1,1,1}
     else
         wingspanEuropeanExpansion = true
     end
     startMenu.editButton({
         index = 6,
         color = bgcolor,
     })
end
function setPlayers_2()
    setPlayers(2)
end
function setPlayers_3()
    setPlayers(3)
end
function setPlayers_4()
    setPlayers(4)
end
function setPlayers(players)
    numPlayer = players
    for z=1, 4 do
        local bgcolor = {1,1,1,1}
        if z == players then bgcolor = SetupMenuSelectedColor end
        startMenu.editButton({
            index = z,
            color = bgcolor,
        })
    end
end

function startSetup()
    startMenu.destruct()--Remove setup menu
    rollButton.createButton({
        click_function = "rollDice",
        function_owner = Global,
        label          = "Roll",
        position       = {0,0.4,0},
        rotation       = {0,180,0},
        width          = 1000,
        height         = 700,
        font_size      = 400,
    })

    newRoundButton.createButton({
        click_function = "newRound",
        function_owner = Global,
        label          = "New Round",
        position       = {0,0.4,0},
        rotation       = {0,180,0},
        width          = 2000,
        height         = 1000,
        font_size      = 400,
    })
    --Remove object not in game
    if numPlayer==2 then
        for i,object in ipairs(player3Object) do
            object.destruct()
        end
        for i,object in pairs(actionTokens.Red) do
            object.destruct()
        end

        for i,object in ipairs(player4Object) do
            object.destruct()
        end
        for i,object in pairs(actionTokens.Green) do
            object.destruct()
        end
    elseif numPlayer==3 then
        for i,object in ipairs(player4Object) do
            object.destruct()
        end
        for i,object in pairs(actionTokens.Green) do
            object.destruct()
        end
    end

    --Scoring Board setup
    if greenScoringBoard then
        scoringBoard.setRotation({0,90,0})
        for i, button in pairs(scoringButton.greenSide) do
            local posButton=scoringBoard.positionToLocal({button[1],1,button[3]})
            scoringBoard.createButton({
                click_function = i,
                function_owner = self,
                position       = {-posButton[1],posButton[2],posButton[3]},
                rotation       = {0,0,0},
                width          = 150,
                height         = 150,
                tooltip        ="Move action cube"
            })
        end
    else
        for i, button in pairs(scoringButton.blueSide) do
            scoringBoard.createButton({
                click_function = i,
                function_owner = self,
                position       = button.pos,
                rotation       = {0,0,180},
                width          = 150,
                height         = 100,
                tooltip        ="Move action cube"
            })
        end
    end

    startLuaCoroutine(Global, "startGame")
end
function startGame()
    --add EXP
    math.randomseed(os.time())
    local posBaseBirdDeck=baseBirdDeck.getPosition()
    local posBaseBonusDeck=baseBonusDeck.getPosition()
    if wingspanEuropeanExpansion then
        expBag.takeObject({
            position          = {posBaseBonusDeck[1],3,posBaseBonusDeck[3]},
            rotation          = {0,180,180},
            smooth            = false,
        })
        expBag.takeObject({
            position          = {posBaseBirdDeck[1],5,posBaseBirdDeck[3]},
            rotation          = {0,180,180},
            smooth            = false,
        })
        waitFrames(60)
    end

    rollDice()-- reroll Dice in birdfeeder
    randomObject(baseBirdDeck)
    randomObject(baseRoundScoringDeck)
    waitFrames(10)
    --setup Round Scoring
    for i=1, 4 do
        baseRoundScoringDeck.takeObject({
                position=scoringRoundSetPos[i],
                smooth=false,
                rotation={0,180,0}
        })
        waitFrames(10)
    end
    baseBirdDeck.deal(5)
    waitFrames(10)
    randomObject(baseBonusDeck)
    waitFrames(10)
    baseBonusDeck.deal(2)
    cardFill()
    return 1
end

----------------------------------New Round Button-------------------------------------------------------------------------------------------------------
function newRound()
    if roundScoringDone then
        if currentRound<4 then
            --Take back action tokens
            numAction=numAction-1
            currentRound=currentRound+1
            for i, tokenColor in pairs(actionTokens) do
                if tokenColor[1]~=nil then --Bỏ qua những màu người chơi không tham gia
                    local playerColor=i
                    local playerBoardPos=boards[playerColor].getPosition()
                    print(-actionTokenSetPosition_P3[1][1])
                    for v, token in ipairs (tokenColor) do
                        if v<=numAction then
                            if playerColor=="Red" then
                                targetToken={playerBoardPos[1]+actionTokenSetPosition_P3[v][1],2,playerBoardPos[3]+actionTokenSetPosition_P3[v][3]}
                            elseif playerColor=="Green" then
                                targetToken={playerBoardPos[1]+actionTokenSetPosition_P4[v][1],2,playerBoardPos[3]+actionTokenSetPosition_P4[v][3]}
                            else
                                targetToken={playerBoardPos[1]+actionTokenSetPosition[v][1],2,playerBoardPos[3]+actionTokenSetPosition[v][3]}
                            end
                            token.setPositionSmooth(targetToken)
                            token.setRotation({0,0,0})
                        end
                    end
                end
            end
            --Refresh Card shop
            cardInZone=cardShopScriptZone.getObjects()
            startLuaCoroutine(Global, "cardRefresh")
            roundScoringDone=false
            num=0
        else
            shout("Game Over")
        end
    else
        shout("Please do end round Scoring")
    end
end
function cardRefresh()
    --Remove entire card
    for i, card in ipairs(cardInZone) do
        if card~=shopBoard then
            card.setRotation({0,180,180})
            card.setPositionSmooth({-0.07, 5+i/2, -0.09})
            waitFrames(10)
        end
    end
    cardFill()--fill new card
    return 1
end
function cardFill()
    for i=1, 3 do
        baseBirdDeck.takeObject({
                position=cardSetPos[i],
                rotation={0,180,0},
        })
        waitFrames(10)
    end
end

----------------------------Shop---------------------------------------------------------------------------------------------------------------------
function seed(obj,color)            spawn("seed",color)             end
function invertebrate(obj,color)    spawn("invertebrate",color)     end
function fish(obj,color)            spawn("fish",color)             end
function fruit(obj,color)           spawn("fruit",color)            end
function rodent(obj,color)          spawn("rodent",color)           end
function spawn(objName,color)
        local playerPressPos=boards[color].getPosition()
        local fartherObj=getObjectFromGUID(foods[objName].guid)
        local childObj = spawnObject({
            type='custom_Token',
            scale={0.25,0.25,0.25},
        })
        childObj.setCustomObject({
            thickness=0.1,
            image = fartherObj.getCustomObject().image,
            stackable=true,
        })
        if color=="Red" then
            childObj.setPosition({playerPressPos[1]+player3FoodsPos[objName][1],5,playerPressPos[3]+player3FoodsPos[objName][3]})
        elseif color=="Green" then
            childObj.setPosition({playerPressPos[1]+player4FoodsPos[objName][1],5,playerPressPos[3]+player4FoodsPos[objName][3]})
        else
            childObj.setPosition({playerPressPos[1]+foods[objName].childPos[1],5,playerPressPos[3]+foods[objName].childPos[3]})
        end
        childObj.use_snap_points = false
end

--------------------------------------------------Auto Roll Dice-----------------------
function rollDice()
    math.randomseed(os.time())
    startLuaCoroutine(Global, "trueRoll")
end
function trueRoll()
    for i,die in ipairs(dice) do
        die.setPosition(diceSetPosition[i],false,true)
        die.setValue(math.random(1,6))
    end
    waitFrames(80)
    for i,die in ipairs(dice) do
        die.roll()
        die.roll()
    end
    return 1
end

----------------------------------------------------Round Scoring Function--------------------------------------------------------------------------
function button01(object,color) moveActionToken("button01",color) end
function button02(object,color) moveActionToken("button02",color) end
function button03(object,color) moveActionToken("button03",color) end
function button04(object,color) moveActionToken("button04",color) end
function button11(object,color) moveActionToken("button11",color) end
function button12(object,color) moveActionToken("button12",color) end
function button13(object,color) moveActionToken("button13",color) end
function button14(object,color) moveActionToken("button14",color) end
function button21(object,color) moveActionToken("button21",color) end
function button22(object,color) moveActionToken("button22",color) end
function button23(object,color) moveActionToken("button23",color) end
function button24(object,color) moveActionToken("button24",color) end
function button31(object,color) moveActionToken("button31",color) end
function button32(object,color) moveActionToken("button32",color) end
function button33(object,color) moveActionToken("button33",color) end
function button34(object,color) moveActionToken("button34",color) end
function button41(object,color) moveActionToken("button41",color) end
function button42(object,color) moveActionToken("button42",color) end
function button43(object,color) moveActionToken("button43",color) end
function button44(object,color) moveActionToken("button44",color) end
function button51(object,color) moveActionToken("button51",color) end
function button52(object,color) moveActionToken("button52",color) end
function button53(object,color) moveActionToken("button53",color) end
function button54(object,color) moveActionToken("button54",color) end
function moveActionToken(buttonName,color)
        local targetPos=scoringBoard.positionToWorld({-scoringButton.blueSide[buttonName].pos[1],-2,scoringButton.blueSide[buttonName].pos[3]})
        actionTokens[color][9-currentRound].setPositionSmooth(targetPos)
        num=num+1
        if num==numPlayer then
            roundScoringDone=true
        end
end
function button10s(object,color) moveActionTokenGreenSide("button10s",color) end
function button11s(object,color) moveActionTokenGreenSide("button11s",color) end
function button12s(object,color) moveActionTokenGreenSide("button12s",color) end
function button13s(object,color) moveActionTokenGreenSide("button13s",color) end
function button20s(object,color) moveActionTokenGreenSide("button20s",color) end
function button21s(object,color) moveActionTokenGreenSide("button21s",color) end
function button22s(object,color) moveActionTokenGreenSide("button22s",color) end
function button23s(object,color) moveActionTokenGreenSide("button23s",color) end
function button30s(object,color) moveActionTokenGreenSide("button30s",color) end
function button31s(object,color) moveActionTokenGreenSide("button31s",color) end
function button32s(object,color) moveActionTokenGreenSide("button32s",color) end
function button33s(object,color) moveActionTokenGreenSide("button33s",color) end
function button40s(object,color) moveActionTokenGreenSide("button40s",color) end
function button41s(object,color) moveActionTokenGreenSide("button41s",color) end
function button42s(object,color) moveActionTokenGreenSide("button42s",color) end
function button43s(object,color) moveActionTokenGreenSide("button43s",color) end

function moveActionTokenGreenSide(buttonName,color)
    actionTokens[color][9-currentRound].setPositionSmooth({scoringButton.greenSide[buttonName][1],2,scoringButton.greenSide[buttonName][3]})
    num=num+1
    if num==numPlayer then
        roundScoringDone=true
    end
end

------------------------------Another Function-------------------------------
function waitFrames(frames)
 while frames > 0 do
   coroutine.yield(0)
   frames = frames - 1
 end
end
function shout(msg)
  broadcastToAll(msg, {0.856, 0.1, 0.094})
end
function doNothing()
    return 0
end
function randomObject(obj)
    local i=math.random(1,4)
    for v=1, i do
        obj.shuffle()
        waitFrames(2)
    end
end
