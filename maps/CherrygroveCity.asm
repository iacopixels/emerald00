	object_const_def
	const OLDALETOWN_GRAMPS_DAY
	const OLDALETOWN_GRAMPS_NITE
	const OLDALETOWN_GRANNY	
	const OLDALETOWN_YOUNGSTER1
	const OLDALETOWN_FISHER1
	const OLDALETOWN_TAILLOW	
	const OLDALETOWN_HOOTHOOT	
	const OLDALETOWN_POKE_BALL1
	const OLDALETOWN_TRUCK_FRONT_TOP
	const OLDALETOWN_TRUCK_BROKE
	const OLDALETOWN_TRUCK_TOOLS
	const OLDALETOWN_TRUCK_BACK

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
; ===== Gramps (DAY)

OldaleTownGrampsDayScript:
	faceplayer
	opentext
	writetext OldaleTownGrampsDayText1
	waitbutton
	closetext
	turnobject OLDALETOWN_GRAMPS_DAY, UP
	opentext
	writetext OldaleTownGrampsDayText2
	waitbutton
	closetext
	faceplayer
	opentext
	writetext OldaleTownGrampsDayText3
	waitbutton
	closetext
	turnobject OLDALETOWN_GRAMPS_DAY, UP
	end
	
OldaleTownGrampsDayText1:
text "There are #MON" 
line "that are more" 

para "commonly seen "
line "during the day."
done

OldaleTownGrampsDayText2:
text "Like that TAILLOW" 
line "on my roof that" 
cont "keeps chirping."
done

OldaleTownGrampsDayText3:
text "However, just" 
line "because a" 
cont "#MON is" 

para "is normally" 
line "seen during the" 
cont "day doesn't mean" 

para "it can't be found" 
line "at night."

para "It can still" 
line "appear at night," 

para "or sometimes it" 
line "hides in a" 
cont "tree or cave."
done 

; ===== Gramps (NITE)

OldaleTownGrampsNiteScript:
	faceplayer
	opentext
	writetext OldaleTownGrampsNiteText1
	waitbutton
	closetext
	turnobject OLDALETOWN_GRAMPS_NITE, UP
	opentext
	writetext OldaleTownGrampsNiteText2
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext OldaleTownGrampsNiteText3
	waitbutton
	writetext OldaleTownGrampsNiteText4
	waitbutton
	closetext
	turnobject OLDALETOWN_GRAMPS_NITE, UP
	pause 10
	opentext
	writetext OldaleTownGrampsNiteTextFinal
	waitbutton
	closetext
	end

OldaleTownGrampsNiteText1:
text "There are #MON" 
line "that are more" 

para "commonly seen "
line "at night."
done

OldaleTownGrampsNiteText2:
text "Like that HOOTHOOT"
line "on my roof that" 
cont "keeps hooting!"
done

OldaleTownGrampsNiteText3:
text "However, just" 
line "because a" 
cont "#MON is" 

para "normally seen" 
line "at night doesn't" 
cont "mean it can't " 

para "be found during" 
line "the day."
done

OldaleTownGrampsNiteText4:
text "It can still" 
line "appear during the" 
cont "day, or sometimes" 

para "it hides in a" 
line "tree or cave."
done

OldaleTownGrampsNiteTextFinal:
text "I just wanted"
line "silence to sleep."
done

; ===== Granny

OldaleTownGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_OLDALE_GOT_POTION
	iftrue .ComplainsAboutHerHusband
	writetext IWorkAtThePokeMartText
	promptbutton
	verbosegiveitem POTION
	iffalse .Exit
	setevent EVENT_OLDALE_GOT_POTION
	closetext
	end
.ComplainsAboutHerHusband:
	writetext ComplainsAboutHerHusbandText
	waitbutton
.Exit:
	closetext
	end
	
IWorkAtThePokeMartText:
text "Are you a" 
line "trainer?"

para "I work at the" 
line "#MART, right" 
cont "over there."

para "Come see us" 
line "whenever you need" 

para "items for your" 
line "adventure."

para "I'll give you a" 
line "free sample."
done 

ComplainsAboutHerHusbandText:
text "My husband is" 
line "always complaining" 
cont "about the noise" 

para "from the wild" 
line "#MON."
done

; ===== Youngster

OldaleTownYoungsterScript:
	faceplayer
	checkevent EVENT_BIRTH_LAB_GOT_POKEDEX
	iftrue .MyOwnFootprints
	opentext
	writetext OldaleYoungsterText1
	waitbutton
	closetext
	end
.MyOwnFootprints:
	opentext
	writetext OldaleYoungsterText2
	waitbutton
	closetext
	showemote EMOTE_SAD, OLDALETOWN_YOUNGSTER1, 15
	end

OldaleYoungsterText1:
	text "I saw the"
	line "footprints of a"
	cont "rare #MON!"

	para "I'm sure that"
	line "rare #MON is" 
	cont "under that truck."

	para "That truck needs"
	line "to move so I" 
	cont "can catch it!"
	done

OldaleYoungsterText2:
	text "Those weren't the"
	line "footprints of a"
	cont "rare Pokémon."

	para "They were my" 
	line "own footprints."
	done


; ===== Truck Driver (FISHER)

OldaleTownFisher1Script:
	checkevent EVENT_OLDALE_TALKED_TO_THE_TRUCK_DRIVER
	iftrue .alreadyMet
	opentext
	writetext OldaleFisher1Text1
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext OldaleFisher1Text2
	waitbutton
	closetext
	setevent EVENT_OLDALE_TALKED_TO_THE_TRUCK_DRIVER
.alreadyMet:
	faceplayer
	opentext
	writetext OldaleFisher1Text3
	waitbutton
	closetext
	turnobject OLDALETOWN_FISHER1, UP
	end

OldaleFisher1Text1:
	text "Car tires are"
	line "never this heavy."
	done

OldaleFisher1Text2:
	text "Oh, you're the kid"
	line "who came in the"
	cont "back of the truck!"
	done

OldaleFisher1Text3:
	text "The truck tire"
	line "went flat."

	para "Sorry kid,"
	line "this will take"
	cont "some time."
	done



; ===== Truck

OldaleThatsTheTruckScript:
	end
	
; ===== Tools

OldaleTruckToolsScript:
	jumptext OldaleTruckToolsText
	
OldaleTruckToolsText:
	text "This is a wheel" 
	line "wrench and a tire."
	done

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
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, OldaleTownGrampsDayScript, -1
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, OldaleTownGrampsNiteScript, -1
	object_event 14, 10, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleTownGrannyScript, -1
	object_event  6, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleTownYoungsterScript, -1
	object_event  2, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleTownFisher1Script, EVENT_BIRTH_LAB_GOT_POKEDEX
	object_event 14, 16, SPRITE_TAILLOW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event 14, 16, SPRITE_HOOTHOOT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, NITE, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event 19,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePlaceholderScript, -1
	object_event  2, 12, SPRITE_TRUCK_FRONT_TOP, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleThatsTheTruckScript, EVENT_BIRTH_LAB_GOT_POKEDEX
	object_event  2, 13, SPRITE_TRUCK_BROKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleThatsTheTruckScript, EVENT_BIRTH_LAB_GOT_POKEDEX
	object_event  3, 14, SPRITE_TRUCK_TOOLS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleTruckToolsScript, EVENT_BIRTH_LAB_GOT_POKEDEX
	object_event  3, 12, SPRITE_TRUCK_BACK, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleThatsTheTruckScript, EVENT_BIRTH_LAB_GOT_POKEDEX
	
	
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

; Check flag "EVENT_OLDALE_TALKED_TO_THE_TRUCK_DRIVER"
; Se não:
; 
;"Car tires are"
;"never this heavy."
; olha pra baixo
; "Oh, you're the kid" "who came in the" "back of the truck!"
; Set flag EVENT_OLDALE_TALKED_TO_THE_TRUCK_DRIVER
;(script continua

; se sim:

; olha pra baixo (sim, denovo)
;

