	const_def
	const PAL_TOWNMAP_BORDER   ; 0
	const PAL_TOWNMAP_EARTH    ; 1
	const PAL_TOWNMAP_MOUNTAIN ; 2
	const PAL_TOWNMAP_CITY     ; 3
	const PAL_TOWNMAP_POI      ; 4
	const PAL_TOWNMAP_POI_MTN  ; 5
	const PAL_TOWNMAP_FOREST   ; 6
	const PAL_TOWNMAP_VOLCANO  ; 7

MACRO townmappals
	rept _NARG / 2
		dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
		shift 2
	endr
ENDM

; gfx/pokegear/town_map.png
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals FOREST,   FOREST,   CITY,     POI,      POI,      EARTH,    POI,      POI_MTN
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals EARTH,    FOREST,   BORDER,   EARTH,    VOLCANO,  VOLCANO,  EARTH,    EARTH
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   VOLCANO,  VOLCANO,  EARTH,    BORDER
; gfx/pokegear/pokegear.png
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   POI,      POI,      POI,      BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     BORDER
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
