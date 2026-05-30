	object_const_def
	const ROUTE29_OAK
	const ROUTE29_POOCHYENA
	const ROUTE29_BIRTH_BAG
	const ROUTE29_FRUIT_TREE

Route29_MapScripts:
	def_scene_scripts
	scene_script Route101HelpTheProfessorScene, SCENE_ROUTE101_HELP_THE_PROFESSOR
	scene_script Route101NoopScene, SCENE_ROUTE101_NOOP

	def_callbacks

Route101HelpTheProfessorScene:
	end

Route101NoopScene:
	end
; ===== Events 
; Event Run Professor Run! 
Route101HelpScript:
	playmusic MUSIC_HELP
	showemote EMOTE_SHOCK, PLAYER, 20
	opentext
    writetext ProfessorHelpMeText
    waitbutton
    closetext
	pause 10
	applymovement PLAYER, Route101PlayerStepsUpMovement
	follow ROUTE29_OAK, ROUTE29_POOCHYENA
	applymovement ROUTE29_OAK, Route101RunProfessorRunMovement
	stopfollow
	applymovement ROUTE29_POOCHYENA, Route101PoochyenaFinalStepMovement
	pause 10
	turnobject ROUTE29_OAK, UP
	pause 10
	turnobject ROUTE29_OAK, RIGHT
	pause 5
	turnobject ROUTE29_OAK, DOWN
	pause 5
	showemote EMOTE_SHOCK, ROUTE29_OAK, 10
	opentext
    writetext Route101ProfessorGetPokeballText
    waitbutton
    closetext
	setevent EVENT_ROUTE101_INITIAL_RUN
	end
	
Route101DontGoBackScript:
	turnobject ROUTE29_OAK, DOWN
	opentext
    writetext ProfessorWhereAreYouGoingText
    waitbutton
    closetext
	applymovement PLAYER, Route101PlayerOneStepUpMovement
	end

Route101InThBagScript:
	opentext
    writetext InTheBagText
    waitbutton
    closetext
	applymovement PLAYER, Route101PlayerOneStepRightMovement
	end
	
	
Route101PlayerStepsUpMovement:
    big_step UP
    big_step UP
    big_step UP
    step_end	

Route101RunProfessorRunMovement:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
    big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step LEFT
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
    step_end	
	
Route101PoochyenaFinalStepMovement:
	big_step LEFT
    step_end	
	
Route101PlayerOneStepUpMovement:
	step UP
    step_end	

Route101PlayerOneStepRightMovement:
	step RIGHT
    step_end	
	
ProfessorHelpMeText:
	text "H-H-Help!"
	done
	
Route101ProfessorGetPokeballText:
	text "Hey you, help me!"
	line "Grab a #BALL"
	cont "from my bag!"
	done
	
ProfessorWhereAreYouGoingText:
	text "Where are you"
	line "going? I need"
	cont "your help!"
	done
	
InTheBagText:
	text "In the bag!"
	line "In the bag!"
	done

; Event Choose a Pokémon!

Route101BirthBag:
	opentext	
	writetext Route101ChooseMenuText
.MenuLoop:
    loadmenu .MenuData
    verticalmenu
    closewindow
    ifequal 1, .ChooseTreecko
    ifequal 2, .ChooseTorchic
    ifequal 3, .ChooseMudkip
    closetext
    end
	
.MenuData:
    db MENU_BACKUP_TILES 
    menu_coords 0, 0, 15, 7 
    dw .MenuOptions
    db 1 
	
.MenuOptions:
    db STATICMENU_CURSOR ; 
    db 3 ; 
    db "TREECKO@"
    db "TORCHIC@"
    db "MUDKIP@"
	
.ChooseTreecko
	reanchormap
    pokepic TREECKO
    cry TREECKO
    waitbutton
    closepokepic
	writetext Route101ChoosePokemonText
	yesorno
	iffalse .MenuLoop
	givepoke TREECKO, 5
	setevent EVENT_GOT_TREECKO_FROM_BIRTH
	sjump .StartBattle
	
.ChooseTorchic
	reanchormap
    pokepic TORCHIC
    cry TORCHIC
    waitbutton
    closepokepic
	writetext Route101ChoosePokemonText
	yesorno
	iffalse .MenuLoop
	givepoke TORCHIC, 5
	setevent EVENT_GOT_TORCHIC_FROM_BIRTH
	sjump .StartBattle

.ChooseMudkip
	reanchormap
    pokepic MUDKIP
    cry MUDKIP
    waitbutton
    closepokepic
	writetext Route101ChoosePokemonText
	yesorno
	iffalse .MenuLoop
	givepoke MUDKIP, 5
	setevent EVENT_GOT_MUDKIP_FROM_BIRTH
	sjump .StartBattle
	
.StartBattle:
	closetext
	loadwildmon POOCHYENA, 2
	startbattle
	ifequal DRAW, PoochyenaFleed
	reloadmapafterbattle
	disappear ROUTE29_POOCHYENA
	turnobject ROUTE29_OAK, DOWN
	opentext
	writetext Route101ProfessorThanksText
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_BIRTH
	setscene SCENE_ROUTE101_NOOP
	clearevent EVENT_BIRTH_LAB_THE_PROFESSOR_IS_IN
	setmapscene ELMS_LAB, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR
	special RestartMapMusic
	warp ELMS_LAB, 4, 4
	end
	
PoochyenaFleed:
	reloadmapafterbattle
	pause 15
	applymovement ROUTE29_POOCHYENA, Route101PoochyenaFleesMovement
	opentext
	writetext Route101PoochyenaFledText
	waitbutton
	closetext
	turnobject ROUTE29_OAK, DOWN
	opentext
	writetext Route101ProfessorThanksText
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_BIRTH
	setscene SCENE_ROUTE101_NOOP
	clearevent EVENT_BIRTH_LAB_THE_PROFESSOR_IS_IN
	setmapscene ELMS_LAB, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR
	special RestartMapMusic
	warp ELMS_LAB, 4, 4
	end

Route101PoochyenaFleesMovement:
	big_step UP
	big_step UP
	big_step UP
	step_end	
	
Route101ChooseMenuText:
	text "Pick a #BALL!"
	done
	
Route101ChoosePokemonText:
	text "Will you pick"
	line "this #MON?"
	done

Route101ReceivedPokemonText:
	text "<PLAYER> received"
	line "the #MON!"
	done

Route101ProfessorThanksText:
	text "Thank you!"

	para "There are many"
	line "wild #MON here,"

	para "let's go to my"
	line "lab, it's safer."
	done
	
Route101PoochyenaFledText:
	text "POOCHYENA fled!"
	done
	
Route29NoEvent:
	end
; ===== Tree 

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29
	
; ===== Signs 

Route29Sign1:
	setscene SCENE_ROUTE101_NOOP
	jumptext Route29Sign1Text

Route29Sign1Text:
	text "ROUTE 101"

	para "LITTLEROOT TOWN -"
	line "OLDALE TOWN"
	done

; ===== ToDo:
;
;	If the player somehow loses the battle against Poochyena, the player must be 
;	transported to Birth's lab and the scene should continue, using the same text from the DRAW. 
;	As currently programmed, the player will be transported inside the truck 
;	(start of the game) and will be able to pick up more than one starter.

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events
	coord_event  6, 14, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101InThBagScript
	coord_event  8, 17, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101HelpScript
    coord_event  9, 17, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101HelpScript
    coord_event 10, 17, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101HelpScript
    coord_event 11, 17, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101HelpScript
	coord_event  7, 15, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101DontGoBackScript
	coord_event  8, 15, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101DontGoBackScript
	coord_event  9, 15, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101DontGoBackScript
	coord_event 10, 15, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101DontGoBackScript
	coord_event 11, 15, SCENE_ROUTE101_HELP_THE_PROFESSOR, Route101DontGoBackScript

	def_bg_events
	bg_event  5,  9, BGEVENT_READ, Route29Sign1

	def_object_events
	object_event 10, 10, SPRITE_OAK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29NoEvent, EVENT_GOT_A_POKEMON_FROM_BIRTH
	object_event 11, 10, SPRITE_POOCHYENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29NoEvent, EVENT_GOT_A_POKEMON_FROM_BIRTH
	object_event  7, 13, SPRITE_BIRTH_BAG, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route101BirthBag, EVENT_GOT_A_POKEMON_FROM_BIRTH
	object_event 19,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1

