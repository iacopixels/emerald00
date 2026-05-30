	object_const_def
	const BIRTHLAB_BIRTH

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script BirthLabNoopScene, SCENE_BIRTHLAB_NOOP
	scene_script LabTryToLeaveScene, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR

	def_callbacks
;	callback MAPCALLBACK_OBJECTS, ElmsLabMoveElmCallback

BirthLabNoopScene:
	end
	
LabTryToLeaveScene:
	end

; ===== events

LabTryToLeaveScript:
	opentext
    writetext LabTryToLeaveText
    waitbutton
    closetext
	applymovement PLAYER, LabTryToLeaveMovement
	end
	
LabTryToLeaveText:
	text "Prof: Wait! Where"
	line "are you going?"
	done
	
LabTryToLeaveMovement:
    step UP
    step_end

; =====	NPCs
	
ProfBirthScript:
	opentext
    writetext FirstTimeTalkingToTheProfessor
    waitbutton
    closetext
	setscene SCENE_BIRTHLAB_NOOP
	end

FirstTimeTalkingToTheProfessor:
	text "It works!"
	done

; =====

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR, LabTryToLeaveScript
	coord_event  5,  6, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR, LabTryToLeaveScript

	def_bg_events
	;bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine

	def_object_events
	object_event  5,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfBirthScript, EVENT_BIRTH_LAB_THE_PROFESSOR_IS_IN
	;object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	;object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	;object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	;object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	;object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	;object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
