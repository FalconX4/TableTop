-- GUIDs
local setup_button = '4f86c4'
local wonders_bag = '6d3f65'
local decks = {
  players_2={ age_1='fc28eb', age_2='92afcb', age_3='0b315a'},
  players_3={ age_1='fc28eb', age_2='92afcb', age_3='0b315a'},
  players_4={ age_1='623991', age_2='f7e230', age_3='961889'},
  players_5={ age_1='48b08b', age_2='5dc250', age_3='28a32a'},
  players_6={ age_1='99626a', age_2='cca2df', age_3='436934'},
  players_7={ age_1='54015e', age_2='47bf02', age_3='1110bb'}
}
local guilds = '646cfe'
local decks_zone = '181da9'
local age_1_button = '6c24eb'
local age_2_button = '5cddcf'
local age_3_button = '8b0ddb'
local rotate_button = 'd8e15b'
local decks_bag = '2c24a6'
local money_bag_3 = 'af90b4'

-- Positions
local age_1_deck = { -6, 1.5, 18 }
local age_2_deck = { -3, 1.5, 18 }
local age_3_deck = { 0, 1.5, 18 }
local dummy_board_position = { -2.5, 1.5, -13 }
local dummy_deck_position = { -2.5, 1.5, -17 }
local dummy_money_position = { -8.5, 1.5, -13 }
local board_positions = {
  White={ 23, 1.5, -19 },
  Brown={ 0, 1.5, -19 },
  Red={ -23, 1.5, -19 },
  Orange={ -40, 1.5, -11 },
  Yellow={ -40, 1.5, 12 },
  Purple={ 40, 1.5, 12 },
  Pink={ 40, 1.5, -11 }
}
local money_positions = {
  White={ 17, 1.5, -19 },
  Brown={ -6, 1.5, -19 },
  Red={ -29, 1.5, -19 },
  Orange={ -40, 1.5, -5 },
  Yellow={ -40, 1.5, 18 },
  Purple={ 40, 1.5, 18 },
  Pink={ 40, 1.5, -5 }
}
local board_rotations = {
  White={0, 180, 0},
  Brown={0, 180, 0},
  Red={0, 180, 0},
  Orange={0, -90, 0},
  Yellow={0, -90, 0},
  Purple={0, 90, 0},
  Pink={0, 90, 0}
}

-- Variables
local number_of_players
local order = {
  clockwise={
    White=Player.Brown, Brown=Player.Red, Red=Player.Orange,
    Orange=Player.Yellow, Yellow=Player.Purple, Purple=Player.Pink, Pink=Player.White
  },
  counterclockwise={
    White=Player.Pink, Pink=Player.Purple, Purple=Player.Yellow,
    Yellow=Player.Orange, Orange=Player.Red, Red=Player.Brown, Brown=Player.White
  }
}
local direction = ''

function onload()
  getObjectFromGUID(wonders_bag).shuffle()
  create_setup_button()
end

function create_setup_button()
  local button = getObjectFromGUID(setup_button)
  local params = {}
  params.click_function = "setup"
  params.label = "Setup"
  params.position = {0, 0.2, 0}
  params.rotation = {0, 180, 0}
  params.width = 1500
  params.height = 1000
  params.font_size = 160
  button.createButton(params)
end

function setup()
  startLuaCoroutine(Global, 'setup_game')
end

function setup_game()
  number_of_players = #getSeatedPlayers()
  if number_of_players > 1 then
    deal_wonders()
    move_play_decks()
    waitFrames(10)
    deal_guilds()
    waitFrames(60)
    remove_unneeded_decks()
    create_age_1_button()
    create_rotate_button()
    getObjectFromGUID(setup_button).destruct()
  else
    printToAll("Minumum 2 players", {1,1,1})
  end
  return 1
end

function create_rotate_button()
  local button = getObjectFromGUID(rotate_button)
  local params = {}
  params.click_function = "rotate"
  params.label = "Rotate Hands"
  params.position = {0, 0.2, 0}
  params.rotation = {0, 180, 0}
  params.width = 1500
  params.height = 1000
  params.font_size = 160
  button.createButton(params)
end

function rotate()
  if number_of_players > 1 then
    for _, p in ipairs(getSeatedPlayers()) do
      local cp = Player[p]
      repeat
        cp = order[direction][cp.color]
      until cp.seated
      local space = cp.getPlayerHand()
      for _, v in ipairs(Player[p].getHandObjects()) do
        v.setPosition({space.pos_x, space.pos_y, space.pos_z})
		v.setRotation(board_rotations[cp.color])
      end
    end
  else
    printToAll("Unable to pass cards; nobody to pass to.", {1, 1, 1})
  end
end

function create_age_1_button()
  local button = getObjectFromGUID(age_1_button)
  local params = {}
  params.click_function = "start_age_1"
  params.label = "Start Age 1"
  params.position = {0, 0.2, 0}
  params.rotation = {0, 180, 0}
  params.width = 1500
  params.height = 1000
  params.font_size = 160
  button.createButton(params)
end

function start_age_1()
  direction = 'clockwise'
  local deck = getObjectFromGUID(decks['players_' .. number_of_players].age_1)
  deck.shuffle()
  deck.dealToAll(7)
  if number_of_players == 2 then
    deck.setPosition(dummy_deck_position)
  end
  getObjectFromGUID(age_1_button).destruct()
  create_age_2_button()
end

function create_age_2_button()
  local button = getObjectFromGUID(age_2_button)
  local params = {}
  params.click_function = "start_age_2"
  params.label = "Start Age 2"
  params.position = {0, 0.2, 0}
  params.rotation = {0, 180, 0}
  params.width = 1500
  params.height = 1000
  params.font_size = 160
  button.createButton(params)
end

function start_age_2()
  direction = 'counterclockwise'
  local deck = getObjectFromGUID(decks['players_' .. number_of_players].age_2)
  deck.shuffle()
  deck.dealToAll(7)
  if number_of_players == 2 then
    deck.setPosition(dummy_deck_position)
  end
  getObjectFromGUID(age_2_button).destruct()
  create_age_3_button()
end

function create_age_3_button()
  local button = getObjectFromGUID(age_3_button)
  local params = {}
  params.click_function = "start_age_3"
  params.label = "Start Age 3"
  params.position = {0, 0.2, 0}
  params.rotation = {0, 180, 0}
  params.width = 1500
  params.height = 1000
  params.font_size = 160
  button.createButton(params)
end

function start_age_3()
  direction = 'clockwise'
  local deck = getObjectFromGUID(decks['players_' .. number_of_players].age_3)
  deck.shuffle()
  deck.dealToAll(7)
  if number_of_players == 2 then
    deck.setPosition(dummy_deck_position)
  end
  getObjectFromGUID(age_3_button).destruct()
end

function deal_wonders()
  for _, p in ipairs(getSeatedPlayers()) do
    local params = {}
    local color = Player[p].color
    params.position = board_positions[color]
    params.rotation = board_rotations[color]

    getObjectFromGUID(wonders_bag).takeObject(params)
    params.position = money_positions[color]
    getObjectFromGUID(money_bag_3).takeObject(params)
  end
  if number_of_players == 2 then
    local params = {}
    params.position = dummy_board_position
    params.rotation = board_rotations.White
    getObjectFromGUID(wonders_bag).takeObject(params)
    params.position = dummy_money_position
    getObjectFromGUID(money_bag_3).takeObject(params)
  end
end

function deal_guilds()
  local deck = getObjectFromGUID(guilds)
  deck.shuffle()
  local params = {}
  params.position = age_3_deck
  for i = 1, number_of_players+2, 1 do
    deck.takeObject(params)
  end
end

function move_play_decks()
  local bag = getObjectFromGUID(decks_bag)
  local params = {}
  params.guid = decks['players_' .. number_of_players].age_1
  params.position = age_1_deck
  params.rotation = { 0, 180, 180 }
  bag.takeObject(params)
  params.guid = decks['players_' .. number_of_players].age_2
  params.position = age_2_deck
  bag.takeObject(params)
  params.guid = decks['players_' .. number_of_players].age_3
  params.position = age_3_deck
  bag.takeObject(params)
end

function remove_unneeded_decks()
  local objects = getObjectFromGUID(decks_zone).getObjects()
  for _, o in ipairs(objects) do
    o.destruct()
  end
end

function update ()
end

function waitFrames(frames)
  while frames > 0 do
    coroutine.yield(0)
    frames = frames - 1
  end
end
