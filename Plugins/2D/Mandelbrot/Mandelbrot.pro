#########################################################################################################################

#########################################################################################################################
##################################################### Julien Rosset #####################################################
#########################################################################################################################

#########################################################################################################################
################################### A MODIFIER QUE SI VOUS MODIFIEZ LE CODE DU PROJET ###################################
#########################################################################################################################

#########################################################################################################################
################################################ Configuration du projet ################################################
#########################################################################################################################

#########################################################################################################################

################################################# Réglages utilisateur ##################################################
CONFIG	+=	 silent warn_on plugin debug

PROJECT_SUFFIX	=
CONFIG(debug, debug|release) {
	PROJECT_SUFFIX	=	d
}

############################################## Informations sur le projet ###############################################
TARGET		=	Mandelbrot$$PROJECT_SUFFIX
#TARGET_EXT	=	.fcp								# FractaleCooker Plugin
TEMPLATE	=	lib

VER_MAJ		=	1
VER_MIN		=	0
VER_PAT		=	0
VERSION		=	$${VER_MAJ}.$${VER_MIN}.$${VER_PAT}

message(Projet $$PROJECT $$VERSION)

############################################ Réglages du mode de compilation ############################################
win32:CONFIG	+=	dll

CONFIG(staticlib, staticlib|dll) {
	DEFINES	+=	$$upper($$PROJECT)_DEFINE_COMPILATION_STATIC
	message(--- Mode statique)
}
CONFIG(dll, staticlib|dll) {
	DEFINES	+=	$$upper($$PROJECT)_DEFINE_COMPILATION_DYNAMIC
	message(--- Mode dynamique)
}

################################################# Sources du programme ##################################################
OBJECTS_DIR	=	Temp/objs$$PROJECT_SUFFIX
MOC_DIR		=	Temp/mocs$$PROJECT_SUFFIX

INCLUDEPATH	+=	Data/Headers
HEADERS		+=	Data/Headers/*.h

SOURCES		+=	Data/Sources/*.cpp

################################################## Réglages programme ###################################################
PROGRAM		=	../../../FractalCooker
INTERFACE	=	$${PROGRAM}/Data/Headers/Interfaces

INCLUDEPATH	+=	$$INTERFACE
HEADERS		+=	$${INTERFACE}/Fractale2D.h

DESTDIR		=	$${PROGRAM}/Plugins/
