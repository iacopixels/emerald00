	object_const_def
	const ROUTE103_RIVAL

Route30_MapScripts:
	def_scene_scripts

	def_callbacks
	
; =====	Rival

Route101RivalScript:
	turnobject ROUTE103_RIVAL, UP
	pause 10
	readvar VAR_FACING
	ifequal RIGHT, .RivalLookLeft
	turnobject ROUTE103_RIVAL, LEFT
	pause 10
	sjump .RivalTalkToThePlayer
.RivalLookLeft:
	turnobject ROUTE103_RIVAL, RIGHT
	pause 10
.RivalTalkToThePlayer:
	opentext
	writetext Route103RivalText1
	waitbutton
	closetext
	faceplayer
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .rivalMusic
	playmusic MUSIC_MAY_ENCOUNTER
	sjump .RivalStartTalkingToThePlayer
.rivalMusic:
	playmusic MUSIC_RIVAL_ENCOUNTER
.RivalStartTalkingToThePlayer:
	showemote EMOTE_SHOCK, ROUTE103_RIVAL, 15
	opentext
	writetext Route103RivalText2
	promptbutton
	writetext Route103RivalText3
	promptbutton
	writetext Route103RivalText4
	promptbutton
	writetext Route103RivalText5
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .MaleRivalTeams
	checkevent EVENT_GOT_TORCHIC_FROM_BIRTH
	iftrue .MayUsedMudkip
	checkevent EVENT_GOT_MUDKIP_FROM_BIRTH
	iftrue .MayUsedTreecko
	winlosstext RivalMayWintext, RivalMayLosstext
	loadtrainer RIVAL_MAY, RIVAL_MAY_1_TORCHIC
	startbattle
	reloadmapafterbattle
	sjump .AfterRivalBattle
.MayUsedMudkip:
	winlosstext RivalMayWintext, RivalMayLosstext
	loadtrainer RIVAL_MAY, RIVAL_MAY_1_MUDKIP
	startbattle
	reloadmapafterbattle
	sjump .AfterRivalBattle
.MayUsedTreecko:
	winlosstext RivalMayWintext, RivalMayLosstext
	loadtrainer RIVAL_MAY, RIVAL_MAY_1_TREECKO
	startbattle
	reloadmapafterbattle
	sjump .AfterRivalBattle
.MaleRivalTeams:	
	checkevent EVENT_GOT_TREECKO_FROM_BIRTH
	iftrue .BrendanUsedTorchic
	checkevent EVENT_GOT_MUDKIP_FROM_BIRTH
	iftrue .BrendanUsedTreecko
	winlosstext RivalBrendanWintext, RivalBrendanLosstext
	loadtrainer RIVAL_BRENDAN, RIVAL_BRENDAN_1_MUDKIP
	startbattle
	reloadmapafterbattle
	sjump .AfterRivalBattle
.BrendanUsedTorchic:
	winlosstext RivalBrendanWintext, RivalBrendanLosstext
	loadtrainer RIVAL_BRENDAN, RIVAL_BRENDAN_1_TORCHIC
	startbattle
	reloadmapafterbattle
	sjump .AfterRivalBattle
.BrendanUsedTreecko:
	winlosstext RivalBrendanWintext, RivalBrendanLosstext
	loadtrainer RIVAL_BRENDAN, RIVAL_BRENDAN_1_TREECKO
	startbattle
	reloadmapafterbattle
	sjump .AfterRivalBattle
.AfterRivalBattle:
	opentext
	writetext Route103RivalPostBattleText1
	pause 10
	promptbutton
	writetext Route103RivalPostBattleText2
	promptbutton
	writetext Route103RivalPostBattleText3
	waitbutton
	closetext
	setevent EVENT_ROUTE103_FOUGHT_RIVAL
	clearevent EVENT_BIRTH_LAB_THE_RIVAL_IS_IN
	setmapscene ELMS_LAB, SCENE_BIRTH_LAB_TALK_TO_THE_PROFESSOR
	pause 10
	readvar VAR_FACING
	ifequal UP, .RivalRunAroundPlayer
	turnobject PLAYER, DOWN
	applymovement ROUTE103_RIVAL, RivalLeavesRoute103Movement
	disappear ROUTE103_RIVAL
	end
.RivalRunAroundPlayer:
	applymovement ROUTE103_RIVAL, RivalLeavesRoute103RunAround1Movement
	turnobject PLAYER, DOWN
	applymovement ROUTE103_RIVAL, RivalLeavesRoute103RunAround2Movement
	disappear ROUTE103_RIVAL
	end
	
RivalLeavesRoute103Movement:
	big_step DOWN
	big_step DOWN
	jump_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

RivalLeavesRoute103RunAround1Movement:
	big_step LEFT
	big_step DOWN
	step_end
	
RivalLeavesRoute103RunAround2Movement:
	big_step DOWN
	jump_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end


RivalMayWintext:
text "Wow, you're really"
line "good."
done

RivalMayLosstext:
text "I won! I won!"
done


RivalBrendanWintext:
text "Wow, you're an"
line "amazing trainer!"
done

RivalBrendanLosstext:
text "Yes! I'm a good"
line "trainer!"
done


	
Route103RivalText1:
text "My dad's nowhere" 
line "to be found<……>"
done 

Route103RivalText2:
text "Oh, hi <PLAYER>!"

para "So he's already" 
line "back at the lab?"
done

Route103RivalText3:
text "What!?"

para "What do you mean" 
line "you faced a wild" 

para "#MON to help" 
line "him?"
done

Route103RivalText4:
text "I didn't know" 
line "you were a"
cont "trainer!"
done

Route103RivalText5:
text "Let's see if" 
line "you're really" 
cont "that good!"
done 

Route103RivalPostBattleText1:
text "I think we both" 
line "have talent as" 
cont "trainers!"
done

Route103RivalPostBattleText2:
text "It was a good" 
line "battle, but it's" 
cont "time to go home."
done

Route103RivalPostBattleText3:
text "What? My dad has" 
line "a surprise for" 
cont "us?"

para "What are we" 
line "waiting for?" 

para "Let's go back" 
line "to the lab!"
done

; ===== placeholder Texts


MayTorchicText:
text "May used"
line "Torchic!"
done

MayMudkipText:
text "May used"
line "Mudkip!"
done

MayTreeckoText:
text "May used"
line "Treecko!"
done

BrendanTorchicText:
text "Brendan used"
line "Torchic!"
done

BrendanMudkipText:
text "Brendan used"
line "Mudkip!"
done

BrendanTreeckoText:
text "Brendan used"
line "Treecko!"
done

; ===== Events definitions

Route30_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  10,  2, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route101RivalScript, EVENT_ROUTE103_FOUGHT_RIVAL