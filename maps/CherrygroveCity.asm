	object_const_def
	const OLDALETOWN_GRAMPS	
	const OLDALETOWN_GRANNY	
	const OLDALETOWN_YOUNGSTER1
	const OLDALETOWN_FISHER	
	const OLDALETOWN_TAILLOW	
	const OLDALETOWN_HOOTHOOT	
	const OLDALETOWN_POKE_BALL1
	const OLDALETOWN_TRUCK_FRONT_TOP
	const OLDALETOWN_TRUCK_BROKE
	const OLDALETOWN_TRUCK_TOOLS
	const OLDALETOWN_TRUCK_BACK
;	const CHERRYGROVECITY_GRAMPS
;	const CHERRYGROVECITY_RIVAL
;	const CHERRYGROVECITY_TEACHER
;	const CHERRYGROVECITY_YOUNGSTER
;	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script CherrygroveCityNoop1Scene, SCENE_CHERRYGROVECITY_NOOP
	scene_script CherrygroveCityNoop2Scene, SCENE_CHERRYGROVECITY_MEET_RIVAL ; maps/MrPokemonHouse

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlypointCallback

CherrygroveCityNoop1Scene:
	end

CherrygroveCityNoop2Scene:
	end

CherrygroveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

; ===== NPCs

OldalePlaceholderScript:
	end

; ===== Sign

OldaleTownSign:
	jumptext OldaleTownSignText

OldaleTownSignText:
	text "OLDALE TOWN"

	para "Where things start"
	line "off scarce."
	done
	
; ===== MapEvents Definitions

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  7, CHERRYGROVE_MART, 2
	warp_event  5, 17, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 13, 17, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event  5,  7, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 11, BGEVENT_READ, OldaleTownSign

	def_object_events
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event 14, 10, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event  6, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event  2, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event 14, 16, SPRITE_TAILLOW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event 15, 16, SPRITE_HOOTHOOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event 19,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event  2, 12, SPRITE_TRUCK_FRONT_TOP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event  2, 13, SPRITE_TRUCK_BROKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event  3, 14, SPRITE_TRUCK_TOOLS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1	
	object_event  3, 12, SPRITE_TRUCK_BACK, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	
	
;	SPRITE_YOUNGSTER SPRITE_GRAMPS SPRITE_GRANNY 
	
	
	;eventos linha 12
	
;2,10 truck front top
;2,11 truck broke tire
;3,10 truck back
;2, 12 FISHMAN looking up "Hey you're that kid" - adicionar flag já falou uma vez, se sim: "Vai demorar, sorry kid"
;3, 12 Ferramentas
;13, 11 granny rotate give potion, set flag, talk about her husband
;14, 14 - taillow and hoothoot
;14, 16 - gramps
;9, 1 - pokeball

;	object_event 21, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FPPUp, EVENT_MOUNT_MORTAR_B1F_PP_UP

