object_const_def
	const NEWBARKTOWN_MOM
	const NEWBARKTOWN_SPRITE_TRUCK_FRONT_TOP
	const NEWBARKTOWN_SPRITE_TRUCK_FRONT_BOTTOM
	const NEWBARKTOWN_SPRITE_TRUCK_BACK
	const NEWBARKTOWN_BUGCATCHER_1

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script NewBarkTownMomIntroScene,       SCENE_LITTLEROOT_MOM_INTRO
	scene_script NewBarkTownBugCatcherScene,     SCENE_LITTLEROOT_BUGCATCHER_STOPS_YOU
	scene_script NewBarkTownNoopScene,           SCENE_LITTLEROOT_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownNewMapCallback

NewBarkTownMomIntroScene:
	sdefer NewBarkTownMomIntroScript
	end

NewBarkTownBugCatcherScene:
	end

NewBarkTownNoopScene:
	end

NewBarkTownNewMapCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	endcallback

NewBarkTownMomIntroScript:
	showemote EMOTE_SHOCK, NEWBARKTOWN_MOM, 15
	applymovement NEWBARKTOWN_MOM, NewBarkTownMomIntroMovement1
	opentext
	writetext NewBarkTownMomIntroText1
	waitbutton
	writetext NewBarkTownMomIntroText2
	waitbutton
	closetext
	applymovement NEWBARKTOWN_MOM, NewBarkTownMomIntroMovement2
	disappear NEWBARKTOWN_MOM
	applymovement PLAYER, NewBarkTownPlayerIntroMovement
	setscene SCENE_LITTLEROOT_BUGCATCHER_STOPS_YOU
	warp PLAYERS_HOUSE_1F, 6, 7
	end

NewBarkTownBugCatcherScript:
	faceplayer
	opentext
	checkevent EVENT_PLAYERS_NEIGHBORS_HOUSE_MEET_RIVAL
	iftrue .afterRival
	writetext NewBarkTownBugCatcherText2
	waitbutton
	closetext
	end
.afterRival:
	writetext NewBarkTownBugCatcherText3
	waitbutton
	closetext
	end

NewBarkTownBugCatcherBlock8:
	turnobject NEWBARKTOWN_BUGCATCHER_1, LEFT
	showemote EMOTE_SHOCK, NEWBARKTOWN_BUGCATCHER_1, 15
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherApproach8
	turnobject PLAYER, DOWN
	opentext
	writetext NewBarkTownBugCatcherText1
	waitbutton
	closetext
	follow NEWBARKTOWN_BUGCATCHER_1, PLAYER
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownPlayerPushedBack
	stopfollow
	turnobject NEWBARKTOWN_BUGCATCHER_1, UP
	opentext
	writetext NewBarkTownBugCatcherText2
	waitbutton
	closetext
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherReturn8
	end

NewBarkTownBugCatcherBlock9:
	turnobject NEWBARKTOWN_BUGCATCHER_1, LEFT
	showemote EMOTE_SHOCK, NEWBARKTOWN_BUGCATCHER_1, 15
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherApproach9
	turnobject PLAYER, DOWN
	opentext
	writetext NewBarkTownBugCatcherText1
	waitbutton
	closetext
	follow NEWBARKTOWN_BUGCATCHER_1, PLAYER
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownPlayerPushedBack
	stopfollow
	turnobject NEWBARKTOWN_BUGCATCHER_1, UP
	opentext
	writetext NewBarkTownBugCatcherText2
	waitbutton
	closetext
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherReturn9
	end

NewBarkTownBugCatcherBlock10:
	turnobject NEWBARKTOWN_BUGCATCHER_1, LEFT
	showemote EMOTE_SHOCK, NEWBARKTOWN_BUGCATCHER_1, 15
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherApproach10
	turnobject PLAYER, DOWN
	opentext
	writetext NewBarkTownBugCatcherText1
	waitbutton
	closetext
	follow NEWBARKTOWN_BUGCATCHER_1, PLAYER
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownPlayerPushedBack
	stopfollow
	turnobject NEWBARKTOWN_BUGCATCHER_1, UP
	opentext
	writetext NewBarkTownBugCatcherText2
	waitbutton
	closetext
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherReturn10
	end

NewBarkTownBugCatcherBlock11:
	turnobject NEWBARKTOWN_BUGCATCHER_1, LEFT
	showemote EMOTE_SHOCK, NEWBARKTOWN_BUGCATCHER_1, 15
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherApproach11
	turnobject PLAYER, DOWN
	opentext
	writetext NewBarkTownBugCatcherText1
	waitbutton
	closetext
	follow NEWBARKTOWN_BUGCATCHER_1, PLAYER
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownPlayerPushedBack
	stopfollow
	turnobject NEWBARKTOWN_BUGCATCHER_1, UP
	opentext
	writetext NewBarkTownBugCatcherText2
	waitbutton
	closetext
	applymovement NEWBARKTOWN_BUGCATCHER_1, NewBarkTownBugCatcherReturn11
	end

NewBarkTownTruckFrontTopScript:
NewBarkTownTruckFrontBottomScript:
NewBarkTownTruckBackScript:
	jumptext NewBarkTownTruckText

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign:
	jumptext NewBarkTownElmsHouseSignText

NewBarkTownMomIntroMovement1:
	step LEFT
	turn_head DOWN
	step_end

NewBarkTownMomIntroMovement2:
	step UP
	step_end

NewBarkTownPlayerIntroMovement:
	step UP
	step UP
	step_end

NewBarkTownBugCatcherApproach8:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	step_end

NewBarkTownBugCatcherApproach9:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	step_end

NewBarkTownBugCatcherApproach10:
	big_step LEFT
	big_step LEFT
	big_step UP
	step_end

NewBarkTownBugCatcherApproach11:
	big_step LEFT
	big_step UP
	step_end

NewBarkTownPlayerPushedBack:
	step DOWN
	step DOWN
	step_end

NewBarkTownBugCatcherReturn8:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

NewBarkTownBugCatcherReturn9:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

NewBarkTownBugCatcherReturn10:
	step RIGHT
	step RIGHT
	step UP
	step_end

NewBarkTownBugCatcherReturn11:
	step RIGHT
	step UP
	step_end

NewBarkTownMomIntroText1:
	text "You made it!"
	done

NewBarkTownMomIntroText2:
	text "<PLAYER>! I'm so"
	line "happy! I'll show"
	cont "you our new house!"
	done

NewBarkTownBugCatcherText1:
	text "Don't go there!"
	done

NewBarkTownBugCatcherText2:
	text "There are wild"
	line "#MON on ROUTE"
	cont "101."

	para "It's dangerous to"
	line "go alone."

	para "Wait for the"
	line "professor to"
	cont "return."
	done

NewBarkTownBugCatcherText3:
	text "I heard a scream,"
	line "can you check it"
	cont "for me?"
	done

NewBarkTownSignText:
	text "NEW BARK TOWN"
	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

NewBarkTownElmsLabSignText:
	text "ELM #MON LAB"
	done

NewBarkTownElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTownTruckText:
	text "It's the moving"
	line "truck."
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 15, ELMS_LAB, 1
	warp_event  5,  7, PLAYERS_HOUSE_1F, 1
	warp_event 13,  7, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 14, 19, ELMS_HOUSE, 1
	warp_event  5,  9, INSIDE_TRUCK, 1

	def_coord_events
	coord_event  8,  0, SCENE_LITTLEROOT_BUGCATCHER_STOPS_YOU, NewBarkTownBugCatcherBlock8
	coord_event  9,  0, SCENE_LITTLEROOT_BUGCATCHER_STOPS_YOU, NewBarkTownBugCatcherBlock9
	coord_event 10,  0, SCENE_LITTLEROOT_BUGCATCHER_STOPS_YOU, NewBarkTownBugCatcherBlock10
	coord_event 11,  0, SCENE_LITTLEROOT_BUGCATCHER_STOPS_YOU, NewBarkTownBugCatcherBlock11

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, NewBarkTownSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownElmsHouseSign

	def_object_events
	object_event  6,  8, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownMomIntroScript, EVENT_LITTLEROOT_MOM_WELCOMES_YOU
	object_event  2,  8, SPRITE_TRUCK_FRONT_TOP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTruckFrontTopScript, EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES
	object_event  2,  9, SPRITE_TRUCK_FRONT_BOTTOM, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTruckFrontBottomScript, EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES
	object_event  3,  8, SPRITE_TRUCK_BACK, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTruckBackScript, EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES
	object_event 12,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownBugCatcherScript, -1