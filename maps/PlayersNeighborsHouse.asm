object_const_def
	const PLAYERSNEIGHBORSHOUSE_MOM
	const PLAYERSNEIGHBORSHOUSE_RIVAL

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts
	scene_script PlayersNeighborsHouseIntroScene, SCENE_PLAYERSNEIGHBORSHOUSE_INTRO
	scene_script PlayersNeighborsHouseNoopScene,  SCENE_PLAYERSNEIGHBORSHOUSE_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersNeighborsHouseNewMapCallback

PlayersNeighborsHouseIntroScene:
	sdefer PlayersNeighborsHouseIntroScript
	end

PlayersNeighborsHouseNoopScene:
	end

PlayersNeighborsHouseNewMapCallback:
	checkevent EVENT_PLAYERS_NEIGHBORS_HOUSE_MEET_RIVAL
	iftrue .done
	setscene SCENE_PLAYERSNEIGHBORSHOUSE_INTRO
.done:
	endcallback

PlayersNeighborsHouseIntroScript:
	checkevent EVENT_PLAYERS_NEIGHBORS_HOUSE_MEET_RIVAL
	iftrue .done
	showemote EMOTE_SHOCK, PLAYERSNEIGHBORSHOUSE_RIVAL, 15
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalMusic
	playmusic MUSIC_LASS_ENCOUNTER
	sjump .continueIntro
.rivalMusic:
	playmusic MUSIC_RIVAL_ENCOUNTER
.continueIntro:
	opentext
	writetext RivalIntroText1
	waitbutton
	closetext
	applymovement PLAYERSNEIGHBORSHOUSE_RIVAL, RivalIntroMovement1
	opentext
	writetext RivalIntroText2
	waitbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalIsBrendan
	writetext RivalIsMayText1
	waitbutton
	writetext RivalIsMayText2
	waitbutton
	sjump .rivalMerge
.rivalIsBrendan:
	writetext RivalIsBrendanText1
	waitbutton
	writetext RivalIsBrendanText2
	waitbutton
.rivalMerge:
	showemote EMOTE_SHOCK, PLAYERSNEIGHBORSHOUSE_RIVAL, 15
	writetext RivalIntroText3
	waitbutton
	closetext
	applymovement PLAYERSNEIGHBORSHOUSE_RIVAL, RivalIntroMovement2
	disappear PLAYERSNEIGHBORSHOUSE_RIVAL
	setevent EVENT_PLAYERS_NEIGHBORS_HOUSE_MEET_RIVAL
	setscene SCENE_PLAYERSNEIGHBORSHOUSE_NOOP
	setmapscene NEW_BARK_TOWN, SCENE_LITTLEROOT_NOOP
	special RestartMapMusic
.done:
	end

RivalIntroMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

RivalIntroMovement2:
	big_step RIGHT
	step DOWN
	step_end

RivalMomScript:
	faceplayer
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .momFemaleRival
	writetext MomMaleRivalText1
	waitbutton
	writetext MomMaleRivalText2
	waitbutton
	closetext
	end
.momFemaleRival:
	writetext MomFemaleRivalText1
	waitbutton
	writetext MomFemaleRivalText2
	waitbutton
	closetext
	end

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

RivalIntroText1:
	text "Who are you?"
	done

RivalIntroText2:
	text "Ah, so you're the"
	line "new neighbor!"
	done

RivalIsMayText1:
	text "I'm MAY!"
	done

RivalIsMayText2:
	text "I am PROFESSOR"
	line "BIRTH's daughter."
	done

RivalIsBrendanText1:
	text "I'm BRENDAN!"
	done

RivalIsBrendanText2:
	text "I am PROFESSOR"
	line "BIRCH's son."
	done

RivalIntroText3:
	text "Wait, my father"
	line "should have"
	cont "returned already!"

	para "Some #MON must"
	line "have attacked him!"

	para "I have to find"
	line "him!"
	done

MomMaleRivalText1:
	text "My daughter wants"
	line "to be a #MON"
	cont "trainer."

	para "Honestly, I don't"
	line "see her as a"
	cont "trainer, but"

	para "perhaps as a"
	line "researcher like" 
	cont "her father."
	done

MomMaleRivalText2:
	text "Have you seen her?"
	line "She ran out of"
	cont "here in a hurry!"
	done

MomFemaleRivalText1:
	text "My son wants"
	line "to be a #MON"
	cont "trainer."

	para "Honestly, I don't"
	line "see him as a"
	cont "trainer, but"

	para "perhaps as a"
	line "researcher like" 
	cont "his father."
	done

MomFemaleRivalText2:
	text "Have you seen him?"
	line "He ran out of"
	cont "here in a hurry!"
	done

PlayerNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayerNeighborRadioText2:
	text "#MON CHANNEL!"
	done

PlayerNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalMomScript, -1
	object_event  5,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalMomScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_MEET_RIVAL