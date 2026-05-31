	object_const_def
	const BIRTHLAB_BIRTH
	const BIRTHLAB_RIVAL

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
	
; =====	Prof. Birth

ProfessorBirchScript:
	faceplayer
	opentext
	checkevent EVENT_BIRTHLAB_LOOK_FOR_YOUR_RIVAL
	iftrue .repeatTipRoute103
	checkevent EVENT_BIRTHLAB_FIRST_TIME_TALKING_TO_THE_PROF
	iftrue .lookForYourRival
	writetext BirchThatWasCloseText
	promptbutton
	checkevent EVENT_ROUTE101_BEAT_POOCHYENA
	iffalse .skipTalent
	writetext BirchYouHaveTalentText
	promptbutton
.skipTalent:
	writetext BirchSorryNameText
	promptbutton
	showemote EMOTE_SHOCK, BIRTHLAB_BIRTH, 15
	writetext BirchPlayerNameText
	promptbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .girl
	writetext BirchNormansSonText
	sjump .genderDone
.girl:
	writetext BirchNormansDaughterText
.genderDone:
	promptbutton
	writetext BirchNewKidText
	promptbutton
	checkevent EVENT_ROUTE101_BEAT_POOCHYENA
	iffalse .skipWonder
	writetext BirchNoWonderText
	promptbutton
.skipWonder:
	checkevent EVENT_GOT_TREECKO_FROM_BIRTH
	iftrue .keepTreecko
	checkevent EVENT_GOT_TORCHIC_FROM_BIRTH
	iftrue .keepTorchic
	checkevent EVENT_GOT_MUDKIP_FROM_BIRTH
	iftrue .keepMudkip
	sjump .partnership

.keepTreecko:
	writetext BirchKeepTreeckoText
	sjump .partnership

.keepTorchic:
	writetext BirchKeepTorchicText
	sjump .partnership

.keepMudkip:
	writetext BirchKeepMudkipText
	sjump .partnership

.partnership:
	promptbutton
	writetext BirchGreatPartnershipText
	promptbutton
	setevent EVENT_BIRTHLAB_FIRST_TIME_TALKING_TO_THE_PROF
	closetext
	end

.lookForYourRival:
	writetext BirchWhereGoingText
	promptbutton
	writetext BirchPetalBurgText
	promptbutton
	writetext BirchGoingSeeYourFatherText
	promptbutton
	writetext BirchFavorText
	promptbutton
	writetext BirchRoute103Text
	promptbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalIsBrendan
	writetext BirchMayAtRoute103Text
	sjump .rivalMerge
.rivalIsBrendan:
	writetext BirchBrendanAtRoute103Text
.rivalMerge:
	promptbutton
	writetext BirchGiveSomethingText
	promptbutton
	writetext BirchDontKnowRoute103Text
	promptbutton
	writetext BirchNewToHoennText
	promptbutton
	writetext BirchGiveMapText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext BirchGotMapCardText
	promptbutton
	writetext BirchMapOnGearText
	promptbutton
	writetext BirchCountingOnYouText
	waitbutton
	closetext
	setevent EVENT_BIRTHLAB_LOOK_FOR_YOUR_RIVAL
	setscene SCENE_BIRTHLAB_NOOP
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname:
	db "MAP CARD@"

.repeatTipRoute103
	writetext BirchFavorText
	promptbutton
	writetext BirchRoute103Text
	promptbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalIsBrendanTip
	writetext BirchMayAtRoute103Text
	sjump .rivalMergeTip
.rivalIsBrendanTip:
	writetext BirchBrendanAtRoute103Text
.rivalMergeTip:
	promptbutton
	writetext BirchGiveSomethingText
	waitbutton
	closetext
	end

; ===== coord events

LabTryToLeaveLeftScript:
	checkevent EVENT_BIRTHLAB_FIRST_TIME_TALKING_TO_THE_PROF
	iftrue .DontGoLookForYourRival
	opentext
    writetext LabTryToLeaveText
    waitbutton
    closetext
	applymovement PLAYER, LabTryToLeaveMovement
	end
	
.DontGoLookForYourRival
	opentext
	writetext BirchWhereGoingText
	waitbutton
	closetext
	turnobject PLAYER, UP
	opentext
	writetext BirchPetalBurgText
	promptbutton
	writetext BirchGoingSeeYourFatherText
	promptbutton
	writetext BirchFavorText
	promptbutton
	writetext BirchRoute103Text
	promptbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalIsBrendan
	writetext BirchMayAtRoute103Text
	sjump .rivalMerge
.rivalIsBrendan:
	writetext BirchBrendanAtRoute103Text
.rivalMerge:
	promptbutton
	writetext BirchGiveSomethingText
	promptbutton
	writetext BirchDontKnowRoute103Text
	promptbutton
	writetext BirchNewToHoennText
	waitbutton
	closetext
	applymovement PLAYER, GetTheMapLeftMovement
	pause 10
	turnobject PLAYER, RIGHT
	turnobject BIRTHLAB_BIRTH, LEFT
	pause 10
	opentext
	writetext BirchGiveMapText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext BirchGotMapCardText
	promptbutton
	writetext BirchMapOnGearText
	promptbutton
	writetext BirchCountingOnYouText
	waitbutton
	closetext
	setevent EVENT_BIRTHLAB_LOOK_FOR_YOUR_RIVAL
	setscene SCENE_BIRTHLAB_NOOP
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname:
	db "MAP CARD@"

LabTryToLeaveRightScript:
	checkevent EVENT_BIRTHLAB_FIRST_TIME_TALKING_TO_THE_PROF
	iftrue .DontGoLookForYourRival
	opentext
    writetext LabTryToLeaveText
    waitbutton
    closetext
	applymovement PLAYER, LabTryToLeaveMovement
	end
	
.DontGoLookForYourRival
	opentext
	writetext BirchWhereGoingText
	waitbutton
	closetext
	turnobject PLAYER, UP
	opentext
	writetext BirchPetalBurgText
	promptbutton
	writetext BirchGoingSeeYourFatherText
	promptbutton
	writetext BirchFavorText
	promptbutton
	writetext BirchRoute103Text
	promptbutton
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalIsBrendan
	writetext BirchMayAtRoute103Text
	sjump .rivalMerge
.rivalIsBrendan:
	writetext BirchBrendanAtRoute103Text
.rivalMerge:
	promptbutton
	writetext BirchGiveSomethingText
	promptbutton
	writetext BirchDontKnowRoute103Text
	promptbutton
	writetext BirchNewToHoennText
	waitbutton
	closetext
	applymovement PLAYER, GetTheMapRightMovement
	pause 10
	opentext
	writetext BirchGiveMapText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext BirchGotMapCardText
	promptbutton
	writetext BirchMapOnGearText
	promptbutton
	writetext BirchCountingOnYouText
	waitbutton
	closetext
	setevent EVENT_BIRTHLAB_LOOK_FOR_YOUR_RIVAL
	setscene SCENE_BIRTHLAB_NOOP
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname:
	db "MAP CARD@"

LabTryToLeaveText:
	text "Prof: Wait! Where"
	line "are you going?"
	done
	
LabTryToLeaveMovement:
    step UP
    step_end
	
GetTheMapLeftMovement:
    step UP
    step UP
    step UP
    step_end
	
GetTheMapRightMovement:
    step UP
    step UP
    step_end	
	
	
; ====== texts


BirchThatWasCloseText:
	text "That was close!"
	done

BirchYouHaveTalentText:
	text "You have talent"
	line "as a trainer!"
	done

BirchSorryNameText:
	text "Oh, I'm sorry, I"
	line "didn't even get"
	cont "your name."
	done

BirchPlayerNameText:
	text "<PLAYER>!?"
	done

BirchNormansSonText:
	text "You are NORMAN's"
	line "son, right?"
	done

BirchNormansDaughterText:
	text "You are NORMAN's"
	line "daughter, right?"
	done

BirchNewKidText:
	text "You're the new"
	line "kid on the block."
	done

BirchNoWonderText:
	text "No wonder you're"
	line "such a gift as"
	cont "a trainer."
	done

BirchKeepTreeckoText:
	text "I want you to"
	line "keep TREECKO."
	done

BirchKeepTorchicText:
	text "I want you to"
	line "keep TORCHIC."
	done

BirchKeepMudkipText:
	text "I want you to"
	line "keep MUDKIP."
	done

BirchGreatPartnershipText:
	text "You two make a"
	line "great partnership,"

	para "I see success in"
	line "your future."
	done

BirchWhereGoingText:
	text "So, where are"
	line "you going now?"
	done

BirchPetalBurgText:
	text "PETALBURG CITY?"
	done

BirchGoingSeeYourFatherText:
	text "You're going to"
	line "see your father,"
	cont "aren't you?"
	done

BirchFavorText:
	text "Can you do me"
	line "a favor?"
	done

BirchRoute103Text:
	text "Can you stop by"
	line "ROUTE 103?"
	done

BirchMayAtRoute103Text:
	text "My daughter MAY"
	line "must be there"
	cont "looking for me."
	done

BirchBrendanAtRoute103Text:
	text "My son BRENDAN"
	line "must be there"
	cont "looking for me."
	done

BirchGiveSomethingText:
	text "I want to"
	line "give you both"
	cont "something."
	done

BirchDontKnowRoute103Text:
	text "You don't know"
	line "where ROUTE 103"
	cont "is?"
	done

BirchNewToHoennText:
	text "That's right, you"
	line "don't know HOENN."

	para "I'll give you"
	line "something to help."
	done

BirchGiveMapText:
	text "Here, take this!"
	done

BirchMapOnGearText:
	text "Here's the map of"
	line "HOENN, right on"
	cont "your #GEAR."
	done

BirchCountingOnYouText:
	text "I'm counting"
	line "on you!"
	done
	
BirchGotMapCardText:
	text "<PLAYER>'s #GEAR"
	line "now has a MAP!"
	done

; ===== Other NPCs

BirthLabRivalScript:
	faceplayer
	opentext
	writetext RivalHurryUpText
	waitbutton
	closetext
	turnobject BIRTHLAB_RIVAL, UP
	end
	
RivalHurryUpText:
	text "Hurry up!" 
	line "My dad is waiting"
	cont "for us."
	done
; =====

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR, LabTryToLeaveLeftScript
	coord_event  5,  6, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR, LabTryToLeaveRightScript

	def_bg_events
	;bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine

	def_object_events
	object_event  5,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfessorBirchScript, EVENT_BIRTH_LAB_THE_PROFESSOR_IS_IN
	object_event  5,  6, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirthLabRivalScript, EVENT_BIRTH_LAB_THE_RIVAL_IS_IN	
	;object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	;object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	;object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	;object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	;object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	;object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB

