	object_const_def
	const BIRTHLAB_BIRTH
	const BIRTHLAB_RIVAL
	const ELMSLAB_ELMS_AIDE

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script BirthLabNoopScene,  SCENE_BIRTHLAB_NOOP
	scene_script LabTryToLeaveScene, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR
	scene_script BirthAideGivesPokeBallsScene,  SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
;	callback MAPCALLBACK_OBJECTS, ElmsLabMoveElmCallback

BirthLabNoopScene:
	end
	
LabTryToLeaveScene:
	end
	
BirthAideGivesPokeBallsScene:
	end
	
; =====	Prof. Birth

ProfessorBirchScript:
	faceplayer
	opentext
	checkevent EVENT_BIRTH_LAB_GOT_POKEDEX
	iftrue .goodLuckAgainPlayer
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

.goodLuckAgainPlayer
	writetext BirchGoodLuckText
	waitbutton
	closetext
	end


; ===== coord events

LabTryToLeaveLeftScript:
	checkevent EVENT_ROUTE103_FOUGHT_RIVAL
	iftrue .giveDex
	checkevent EVENT_BIRTHLAB_FIRST_TIME_TALKING_TO_THE_PROF
	iftrue .DontGoLookForYourRival
	opentext
	writetext LabTryToLeaveText
	waitbutton
	closetext
	applymovement PLAYER, LabTryToLeaveMovement
	end

.giveDex:
	opentext
	writetext BirchOhGoodText
	promptbutton
	writetext BirchPokedexHistoryText1
	promptbutton
	writetext BirchPokedexHistoryText2
	promptbutton
	writetext BirchPokedexHistoryText3
	promptbutton
	writetext BirchPokedexHistoryText4
	promptbutton
	writetext BirchPokedexHistoryText5
	promptbutton
	writetext BirchThisIsMyGiftText
	waitbutton
	closetext
	applymovement BIRTHLAB_RIVAL, BirthLabRivalStepsUpMovement
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalIsBrendanDex
	opentext
	writetext BirchRivalGotDexTextMay 
	sjump .playerGetsDex
.rivalIsBrendanDex:
	opentext
	writetext BirchRivalGotDexTextBrendan
.playerGetsDex:
	playsound SFX_ITEM
	waitbutton
	closetext
	waitsfx
	applymovement PLAYER, BirthLabPlayerGetsDexMovement
	turnobject BIRTHLAB_BIRTH, LEFT
	opentext
	writetext BirchPlayerGotDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext BirchGoMeetMonText
	waitbutton
	closetext
	applymovement BIRTHLAB_RIVAL, BirthLabRivalStepLeftMovement
	turnobject BIRTHLAB_RIVAL, UP
	turnobject PLAYER, DOWN
	opentext
	writetext BirchRivalLikesResearchText
	promptbutton
	writetext BirchRivalLikesTrainingText
	promptbutton
	writetext BirchCanDoBothText
	promptbutton
	writetext BirchRivalGoingJourneyText
	waitbutton
	closetext
	pause 20
	turnobject BIRTHLAB_RIVAL, RIGHT
	opentext
	writetext BirchRivalByeDadText
	waitbutton
	closetext
	turnobject BIRTHLAB_BIRTH, DOWN
	applymovement BIRTHLAB_RIVAL, BirthLabRivalLeavesMovement
	disappear BIRTHLAB_RIVAL
	pause 10
	playsound SFX_ENTER_DOOR
	turnobject BIRTHLAB_BIRTH, LEFT
	pause 10
	turnobject PLAYER, RIGHT
	opentext
	writetext BirchGoodLuckText
	waitbutton
	closetext
	pause 10
	setevent EVENT_BIRTH_LAB_GOT_POKEDEX
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

.DontGoLookForYourRival:
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
	pause 10
	setevent EVENT_BIRTHLAB_LOOK_FOR_YOUR_RIVAL
	setscene SCENE_BIRTHLAB_NOOP
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname:
	db "MAP CARD@"

BirthLabRivalStepsUpMovement:
	step UP
	step UP
	step_end

BirthLabPlayerGetsDexMovement:
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

BirthLabRivalLeavesMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

BirthLabRivalStepLeftMovement:
	step LEFT
	step_end


BirchOhGoodText:
	text "Prof. BIRCH: Oh,"
	line "it's good that"
	cont "you came!"

	para "I have a gift for"
	line "both of you!"
	done

BirchPokedexHistoryText1:
	text "Four years ago, a"
	line "great researcher"

	para "and my personal"
	line "friend, Prof. OAK,"

	para "created a hi-tech"
	line "encyclopedia with"
	cont "#MON data!"
	done

BirchPokedexHistoryText2:
	text "But it was"
	line "very limited,"
	cont "containing only"

	para "data on"
	line "151 #MON."
	done

BirchPokedexHistoryText3:
	text "Last year, the"
	line "#DEX had its"

	para "first update,"
	line "increasing its"

	para "capacity to store"
	line "data on 100 more"
	cont "#MON!"
	done

BirchPokedexHistoryText4:
	text "After further"
	line "studies, Prof. OAK"
	cont "and other"

	para "researchers like"
	line "like myself"
	cont "understood that"

	para "the #DEX"
	line "needed a regional"
	cont "version."
	done

BirchPokedexHistoryText5:
	text "Therefore, we are"
	line "here with the"

	para "first HOENN"
	line "#DEX!"
	done

BirchThisIsMyGiftText:
	text "This is my gift"
	line "to you all!"
	done

BirchRivalGotDexTextMay:
	text "MAY received"
	line "#DEX!"
	done

BirchRivalGotDexTextBrendan:
	text "BRENDAN received"
	line "#DEX!"
	done

BirchPlayerGotDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

BirchGoMeetMonText:
	text "Go meet many kinds"
	line "of #MON and"

	para "complete that"
	line "#DEX!"
	done

BirchRivalLikesResearchText:
	text "I really liked the"
	line "idea of being a"
	cont "researcher."
	done

BirchRivalLikesTrainingText:
	text "But I also like"
	line "being a trainer."
	done

BirchCanDoBothText:
	text "I think you can"
	line "do both!"
	done

BirchRivalGoingJourneyText:
	text "I'm going on my"
	line "journey, see you"
	cont "soon!"
	done

BirchRivalByeDadText:
	text "Bye Dad!"
	done

BirchGoodLuckText:
	text "Good luck on your"
	line "journey, <PLAYER>!"
	done


; ==== event 5, 6
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
	
	
; ===== Birth Aide

ElmsAideScript:
	faceplayer
	opentext
	writetext BirthAideText1
	waitbutton
	closetext
	turnobject BIRTHLAB_RIVAL, UP
	end
	
BirthAideText1:
	text "Placeholder Text."
	done
	
AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_BIRTHLAB_NOOP
	end

AideScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Use these on your"
	line "#DEX quest!"
	done

AideText_ExplainBalls:
	text "To add to your"
	line "#DEX, you have"
	cont "to catch #MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
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
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	def_bg_events
	;bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine

	def_object_events
	object_event  5,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfessorBirchScript, EVENT_BIRTH_LAB_THE_PROFESSOR_IS_IN
	object_event  5,  6, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirthLabRivalScript, EVENT_BIRTH_LAB_THE_RIVAL_IS_IN	
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, -1


