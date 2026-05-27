object_const_def
	const NEWBARKTOWN_MOM
	const NEWBARKTOWN_SPRITE_TRUCK_FRONT_TOP
	const NEWBARKTOWN_SPRITE_TRUCK_FRONT_BOTTOM
	const NEWBARKTOWN_SPRITE_TRUCK_BACK

NewBarkTown_MapScripts:
	def_scene_scripts
	scene_script NewBarkTownIntroScene,  SCENE_NEWBARKTOWN_MOM_STOPS_YOU
	scene_script NewBarkTownNoopScene,   SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownNewMapCallback

NewBarkTownIntroScene:
	sdefer NewBarkTownMomIntroScript
	end

NewBarkTownNoopScene:
	end

NewBarkTownNewMapCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	checkevent EVENT_LITTLEROOT_MOM_WELCOMES_YOU
	iftrue .setNoop
	checkevent EVENT_PLAYERS_HOUSE_MOM_GREETED
	iftrue .setNoop
	setscene SCENE_NEWBARKTOWN_MOM_STOPS_YOU
	endcallback
.setNoop:
	setscene SCENE_NEWBARKTOWN_NOOP
	endcallback

NewBarkTownMomIntroScript:
	checkevent EVENT_LITTLEROOT_MOM_WELCOMES_YOU
	iftrue .done
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
	setevent EVENT_LITTLEROOT_MOM_WELCOMES_YOU
	setscene SCENE_NEWBARKTOWN_NOOP
	warp PLAYERS_HOUSE_1F, 6, 7
	end
.done:
	end

NewBarkTownMomScript:
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

NewBarkTownMomIntroText1:
	text "You made it!"
	done

NewBarkTownMomIntroText2:
	text "<PLAYER>! I'm so"
	line "happy! I'll show"
	cont "you our new house!"
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

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, NewBarkTownSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownElmsHouseSign

	def_object_events
	object_event  6,  8, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownMomIntroScript,  EVENT_LITTLEROOT_MOM_WELCOMES_YOU
	object_event  2,  8, SPRITE_TRUCK_FRONT_TOP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTruckFrontTopScript, EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES
	object_event  2,  9, SPRITE_TRUCK_FRONT_BOTTOM, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTruckFrontBottomScript, EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES
	object_event  3,  8, SPRITE_TRUCK_BACK, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownTruckBackScript, EVENT_PLAYERS_HOUSE_2F_RUNNINGSHOES