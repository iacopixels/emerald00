InsideTruck_MapScripts:
	def_scene_scripts
	scene_script InsideTruckNoop1Scene, SCENE_INSIDETRUCK_ARRIVED
	scene_script InsideTruckNoop2Scene, SCENE_INSIDETRUCK_NOOP
	
	def_callbacks

InsideTruckNoop1Scene:
	end
	
InsideTruckNoop2Scene:	
	end

InsideTruckArrivalScript:
	checkevent EVENT_INSIDE_TRUCK_ARRIVED
	iftrue .done
	turnobject PLAYER, DOWN 
	showemote EMOTE_SHOCK, PLAYER, 15           
	pause 10
	playsound SFX_EMBER
	earthquake 115
	pause 40
	playsound SFX_TACKLE
	pause 25
	opentext
	writetext InsideTruckArrivedText1
	waitbutton
	playsound SFX_ENTER_DOOR
	closetext
	pause 20
	setevent EVENT_INSIDE_TRUCK_ARRIVED
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	checktime NITE
	iftrue .endscene
	warp INSIDE_TRUCK_LIGHT, 5, 2
	end
.endscene:
	end
.done:
	end
	
InsideTruckArrivalScriptDown:
	checkevent EVENT_INSIDE_TRUCK_ARRIVED
	iftrue .done
	turnobject PLAYER, DOWN 
	showemote EMOTE_SHOCK, PLAYER, 15           
	pause 10
	playsound SFX_EMBER
	earthquake 115
	pause 40
	playsound SFX_TACKLE
	pause 25
	opentext
	writetext InsideTruckArrivedText1
	waitbutton
	playsound SFX_ENTER_DOOR
	closetext
	pause 20
	setevent EVENT_INSIDE_TRUCK_ARRIVED
	checktime NITE
	iftrue .endscene
	pause 10
	warp INSIDE_TRUCK_LIGHT, 5, 3
	end
	
.endscene:
	end
.done:
	end

InsideTruckHiddenSodaPop:
	hiddenitem SODA_POP, EVENT_INSIDE_TRUCK_HIDDEN_SODA_POP

InsideTruckArrivedText1:
	text "We made it!"
	para "Welcome to HOENN,"
	line "<PLAYER>!"
	done

InsideTruck_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, NEW_BARK_TOWN, 5
	warp_event  7,  3, NEW_BARK_TOWN, 5

	def_coord_events
	coord_event  5,  2, SCENE_INSIDETRUCK_ARRIVED, InsideTruckArrivalScript
	coord_event  5,  3, SCENE_INSIDETRUCK_ARRIVED, InsideTruckArrivalScriptDown

	def_bg_events
	bg_event  1,  1, BGEVENT_ITEM, InsideTruckHiddenSodaPop

	def_object_events