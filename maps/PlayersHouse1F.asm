	object_const_def
	const PLAYERSHOUSE1F_MOM
	const PLAYERSHOUSE1F_MACHOKEBOX_1
	const PLAYERSHOUSE1F_MACHOKEBOX_2
	const PLAYERSHOUSE1F_MACHOKEBOX_3


PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FIntroScene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoopScene,  SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersHouse1FNewMapCallback

PlayersHouse1FIntroScene:
	sdefer PlayersHouse1FIntroScript
	end

PlayersHouse1FNoopScene:
	end

PlayersHouse1FNewMapCallback:
	checkevent EVENT_PLAYERS_HOUSE_MOM_INTRO
	iftrue .done
	setscene SCENE_PLAYERSHOUSE1F_MEET_MOM
.done:
	endcallback

PlayersHouse1FIntroScript:
	checkevent EVENT_PLAYERS_HOUSE_MOM_GREETED
	iftrue .done
	applymovement PLAYER, PlayersHouse1FPlayerStepsUpMovement
	turnobject PLAYERSHOUSE1F_MOM, DOWN
	playmusic MUSIC_MOM
	opentext
	writetext PlayersHouse1FWelcomeText1
	waitbutton
	closetext
	opentext
	writetext PlayersHouse1FWelcomeText2
	waitbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone
.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	closetext
	special RestartMapMusic
	setevent EVENT_PLAYERS_HOUSE_MOM_GREETED
	setevent EVENT_PLAYERS_HOUSE_MOM_INTRO
	setscene SCENE_PLAYERSHOUSE1F_NOOP
.done:
	end

MomScript:
	faceplayer
	opentext
	writetext PlayersHouse1FMomRepeatText
	waitbutton
	closetext
	end

PlayersHouse1FBlockScript:
	checkevent EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES
	iftrue .done
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM, 15
	turnobject PLAYERSHOUSE1F_MOM, DOWN
	opentext
	writetext PlayersHouse1FMomBlockText
	waitbutton
	closetext
	applymovement PLAYER, PlayersHouse1FPlayerStepsUpMovement
.done:
	end

MachokEBoxScript:
	faceplayer
	opentext
	writetext MachokEBoxText1
	cry MACHOKE
	pause 10
	writetext MachokEBoxText2
	waitbutton
	closetext
	end

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FPlayerStepsUpMovement:
	step UP
	step_end

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomGivesPokegearText:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done


MachokEBoxText1:
	text "MACHOKE: Machoke!"
	done

MachokEBoxText2:
	text "This MACHOKE is"
	line "helping us move."
	done

PlayersHouse1FWelcomeText1:
	text "Welcome to our"
	line "new home!"
	done

PlayersHouse1FWelcomeText2:
	text "Go see your room"
	line "on the 2nd floor,"
	
	para "there's a surprise"
	line "for you!"
	
	para "Ah, your POKéGEAR"
	line "was stored in the"
	
	para "boxes. We just"
	line "found it!"
	done

PlayersHouse1FMomRepeatText:
	text "Go see your room"
	line "on the 2nd floor,"
	
	para "there's a surprise"
	line "for you!"
	done

PlayersHouse1FMomBlockText:
	text "Where are you"
	line "going? You haven't"
	
	para "seen your room"
	line "yet!"
	done

PlayersHouse1FStoveText:
	text "Mom's specialty!"

	para "GOLDENROD CABBAGE"
	line "PANCAKE!"
	done

PlayersHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

PlayersHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done
	
PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  6,  7, SCENE_ALWAYS, PlayersHouse1FBlockScript
	coord_event  7,  7, SCENE_ALWAYS, PlayersHouse1FBlockScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  6,  5, SPRITE_MOM, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  1,  4, SPRITE_MACHOKEBOX, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MachokEBoxScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  3,  6, SPRITE_MACHOKEBOX, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MachokEBoxScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  2, SPRITE_MACHOKEBOX, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MachokEBoxScript, EVENT_PLAYERS_HOUSE_MOM_2