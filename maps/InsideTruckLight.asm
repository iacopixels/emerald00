InsideTruckLight_MapScripts:
	def_scene_scripts

	def_callbacks

InsideTruckLightHiddenSodaPop:
	hiddenitem SODA_POP, EVENT_INSIDE_TRUCK_HIDDEN_SODA_POP


InsideTruckLight_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, NEW_BARK_TOWN, 5
	warp_event  7,  3, NEW_BARK_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_ITEM, InsideTruckLightHiddenSodaPop

	def_object_events