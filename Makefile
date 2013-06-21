#############################################################################
# Makefile for building: Locv3
# Generated by qmake (2.01a) (Qt 4.7.3) on: Sun 20. Nov 15:22:29 2011
# Project:  Locv3.pro
# Template: app
# Command: c:\qtsdk\symbian\sdks\symbian1qt473\bin\qmake.exe -spec c:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\symbian-abld CONFIG+=release -after  OBJECTS_DIR=obj MOC_DIR=moc UI_DIR=ui RCC_DIR=rcc -o bld.inf Locv3.pro
#############################################################################

MAKEFILE          = Makefile
QMAKE             = c:\qtsdk\symbian\sdks\symbian1qt473\bin\qmake.exe
DEL_FILE          = del 2> NUL
DEL_DIR           = rmdir
MOVE              = move
CHK_DIR_EXISTS    = if not exist
MKDIR             = mkdir
XCOPY             = xcopy /d /f /h /r /y /i
ABLD              = ABLD.BAT
DEBUG_PLATFORMS   = winscw gcce armv5 armv6
RELEASE_PLATFORMS = gcce armv5 armv6
MAKE              = make

ifeq (WINS,$(findstring WINS, $(PLATFORM)))
ZDIR=$(EPOCROOT)epoc32\release\$(PLATFORM)\$(CFG)\z
else
ZDIR=$(EPOCROOT)epoc32\data\z
endif

DEFINES	 = -DSYMBIAN -DUNICODE -DQT_KEYPAD_NAVIGATION -DQT_SOFTKEYS_ENABLED -DQT_USE_MATH_H_FLOATS -DQT_NO_DEBUG -DQT_DECLARATIVE_LIB -DQT_SQL_LIB -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB
INCPATH	 =  -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtCore" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtCore/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtNetwork" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtNetwork/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtGui" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtGui/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtSql" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtSql/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtDeclarative" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtDeclarative/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtSystemInfo" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/include/QtSystemInfo/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/mkspecs/common/symbian" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/mkspecs/common/symbian/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/osextensions/stdapis" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/osextensions/stdapis/sys" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/stdapis" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/stdapis/sys" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/oem" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/middleware" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/domain/middleware" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/osextensions" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/domain/osextensions" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/domain/osextensions/loc" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/domain/middleware/loc" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/domain/osextensions/loc/sc" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/domain/middleware/loc/sc" -I"C:/QtMobility" -I"C:/QtMobility/tmp" -I"C:/QtSystemInfo" -I"C:/QtSystemInfo/tmp" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/osextensions/stdapis/stlport" -I"C:/QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/include/stdapis/stlport" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/moc" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/moc/tmp" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/qmlapplicationviewer" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/qmlapplicationviewer/tmp" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/rcc" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/rcc/tmp" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/ui" -I"C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/ui/tmp"
first: default
default: debug-winscw
all: debug release

qmake:
	$(QMAKE) "C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro"  -spec c:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\symbian-abld CONFIG+=release -after  OBJECTS_DIR=obj MOC_DIR=moc UI_DIR=ui RCC_DIR=rcc

bld.inf: C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro
	$(QMAKE) "C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro"  -spec c:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\symbian-abld CONFIG+=release -after  OBJECTS_DIR=obj MOC_DIR=moc UI_DIR=ui RCC_DIR=rcc

$(ABLD): bld.inf
	bldmake bldfiles

c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc: 
	$(QMAKE) "C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro"  -spec c:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\symbian-abld CONFIG+=release -after  OBJECTS_DIR=obj MOC_DIR=moc UI_DIR=ui RCC_DIR=rcc

debug: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build winscw udeb
	$(ABLD) build gcce udeb
	$(ABLD) build armv5 udeb
	$(ABLD) build armv6 udeb

release: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build gcce urel
	$(ABLD) build armv5 urel
	$(ABLD) build armv6 urel

debug-winscw: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build winscw udeb
debug-gcce: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build gcce udeb
debug-armv5: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build armv5 udeb
debug-armv6: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build armv6 udeb
release-gcce: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build gcce urel
release-armv5: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build armv5 urel
release-armv6: c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc $(ABLD)
	$(ABLD) build armv6 urel

export: $(ABLD)
	$(ABLD) export

cleanexport: $(ABLD)
	$(ABLD) cleanexport

check: first

run:
	call /QtSDK/Symbian/SDKs/Symbian1Qt473/epoc32/release/winscw/udeb/Locv3.exe $(QT_RUN_OPTIONS)

runonphone: sis
	runonphone $(QT_RUN_ON_PHONE_OPTIONS) --sis Locv3.sis Locv3.exe $(QT_RUN_OPTIONS)

Locv3_template.pkg: C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro
	$(MAKE) -f $(MAKEFILE) qmake

Locv3_installer.pkg: C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro
	$(MAKE) -f $(MAKEFILE) qmake

Locv3_stub.pkg: C:/Users/Se7en/Documents/Qt/LOCEX/Locv3/Locv3.pro
	$(MAKE) -f $(MAKEFILE) qmake

sis: Locv3_template.pkg
	$(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) )

ok_sis:
	createpackage $(QT_SIS_OPTIONS) Locv3_template.pkg $(QT_SIS_TARGET) $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

unsigned_sis: Locv3_template.pkg
	$(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_unsigned_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_unsigned_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) )

ok_unsigned_sis:
	createpackage $(QT_SIS_OPTIONS) -o Locv3_template.pkg $(QT_SIS_TARGET)

Locv3.sis:
	$(MAKE) -f $(MAKEFILE) sis

installer_sis: Locv3_installer.pkg sis
	$(MAKE) -f $(MAKEFILE) ok_installer_sis

ok_installer_sis: Locv3_installer.pkg
	createpackage $(QT_SIS_OPTIONS) Locv3_installer.pkg - $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

unsigned_installer_sis: Locv3_installer.pkg unsigned_sis
	$(MAKE) -f $(MAKEFILE) ok_unsigned_installer_sis

ok_unsigned_installer_sis: Locv3_installer.pkg
	createpackage $(QT_SIS_OPTIONS) -o Locv3_installer.pkg

fail_sis_nocache:
	$(error Project has to be built or QT_SIS_TARGET environment variable has to be set before calling 'SIS' target)

stub_sis: Locv3_stub.pkg
	$(if $(wildcard .make.cache), $(MAKE) -f $(MAKEFILE) ok_stub_sis MAKEFILES=.make.cache , $(if $(QT_SIS_TARGET), $(MAKE) -f $(MAKEFILE) ok_stub_sis , $(MAKE) -f $(MAKEFILE) fail_sis_nocache ) )

ok_stub_sis:
	createpackage -s $(QT_SIS_OPTIONS) Locv3_stub.pkg $(QT_SIS_TARGET) $(QT_SIS_CERTIFICATE) $(QT_SIS_KEY) $(QT_SIS_PASSPHRASE)

store_build:
	@echo # ============================================================================== > .make.cache && echo # This file is generated by make and should not be modified by the user >> .make.cache && echo # Name : .make.cache >> .make.cache && echo # Part of : lineedits >> .make.cache && echo # Description : This file is used to cache last build target for >> .make.cache && echo # make sis target. >> .make.cache && echo # Version : >> .make.cache && echo # >> .make.cache && echo # ============================================================================== >> .make.cache && echo QT_SIS_TARGET ?= $(QT_SIS_TARGET) >> .make.cache

deploy: sis
	call Locv3.sis

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc\moc_Mgr.cpp moc\moc_qmlapplicationviewer.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc\moc_Mgr.cpp moc\moc_qmlapplicationviewer.cpp
moc\moc_Mgr.cpp: Mgr.h
	C:\QtSDK\Symbian\SDKs\Symbian1Qt473\bin\moc.exe $(DEFINES) $(INCPATH) -DSYMBIAN Mgr.h -o moc\moc_Mgr.cpp

moc\moc_qmlapplicationviewer.cpp: qmlapplicationviewer\qmlapplicationviewer.h
	C:\QtSDK\Symbian\SDKs\Symbian1Qt473\bin\moc.exe $(DEFINES) $(INCPATH) -DSYMBIAN qmlapplicationviewer\qmlapplicationviewer.h -o moc\moc_qmlapplicationviewer.cpp

compiler_rcc_make_all: rcc\qrc_Qres.cpp
compiler_rcc_clean:
	-$(DEL_FILE) rcc\qrc_Qres.cpp
rcc\qrc_Qres.cpp: Qres.qrc \
		qml\Locv3\MapMeIn.qml \
		qml\Locv3\Flick.qml \
		qml\Locv3\Buttons.qml \
		qml\Locv3\StatusBar.qml \
		qml\Locv3\Debug.qml \
		qml\Locv3\Mapview.qml \
		qml\Locv3\CityQuery.qml \
		qml\Locv3\BottomBar.qml \
		qml\Locv3\InfoDrop.qml \
		qml\Locv3\LatLng.js \
		qml\Locv3\LocUI.qmlproject.user \
		qml\Locv3\ZoomBar.qml \
		qml\Locv3\LocUI.qmlproject \
		qml\Locv3\SideBar.qml \
		qml\Locv3\LocUI.qml \
		qml\Locv3\SidePeep.qml \
		qml\Locv3\feed.xml \
		qml\Locv3\Flick2.qml \
		qml\Locv3\src\Search.png \
		qml\Locv3\src\RedCircle.png \
		qml\Locv3\src\ZoomBar.png \
		qml\Locv3\src\close.png \
		qml\Locv3\src\fedspinner.png \
		qml\Locv3\src\SidePeep.png \
		qml\Locv3\src\StatusBar.png \
		qml\Locv3\src\Zoom-out.png \
		qml\Locv3\src\TextIpBg.png \
		qml\Locv3\src\Back.png \
		qml\Locv3\src\cbox.png \
		qml\Locv3\src\Memo.png \
		qml\Locv3\src\InfoBGI.png \
		qml\Locv3\src\cboxb.png \
		qml\Locv3\src\sping.png \
		qml\Locv3\src\spingr.png \
		qml\Locv3\src\Tick.png \
		qml\Locv3\src\prfg.png \
		qml\Locv3\src\locationInput2.png \
		qml\Locv3\src\StatusBarw2.png \
		qml\Locv3\src\MapMe2.png \
		qml\Locv3\src\spinner.gif \
		qml\Locv3\src\infobgc.png \
		qml\Locv3\src\MapMe.png \
		qml\Locv3\src\MainUI.png \
		qml\Locv3\src\Settings.png \
		qml\Locv3\src\Info.png \
		qml\Locv3\src\SideInfo.png \
		qml\Locv3\src\infobgc2.png \
		qml\Locv3\src\ButtonPressed.png \
		qml\Locv3\src\Buttons.qml \
		qml\Locv3\src\Button.png \
		qml\Locv3\src\spinner2.gif \
		qml\Locv3\src\StatusBarw4.png \
		qml\Locv3\src\Arrow.png \
		qml\Locv3\src\CityButton.png \
		qml\Locv3\src\fedspinner.gif \
		qml\Locv3\src\prbg.png \
		qml\Locv3\src\locationInput3.png \
		qml\Locv3\src\SideInfoInv.png \
		qml\Locv3\src\cbox0.png \
		qml\Locv3\src\StatusBarw3.png \
		qml\Locv3\src\spin30.png \
		qml\Locv3\src\StatusBarw.png \
		qml\Locv3\src\Grid.qml \
		qml\Locv3\src\Zoom-in.png \
		qml\Locv3\src\locationInputLeft.png \
		qml\Locv3\src\infobg.png \
		qml\Locv3\src\locationInput.png
	c:\QtSDK\Symbian\SDKs\Symbian1Qt473\bin\rcc.exe -name Qres Qres.qrc -o rcc\qrc_Qres.cpp

compiler_image_collection_make_all: ui\qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) ui\qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_rcc_clean 

create_temps:
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtCore\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtCore\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtNetwork\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtNetwork\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtGui\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtGui\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSql\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSql\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtDeclarative\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtDeclarative\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSystemInfo\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSystemInfo\tmp"
	-@ if not exist "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\common\symbian\tmp" mkdir "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\common\symbian\tmp"
	-@ if not exist "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\tmp" mkdir "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\tmp"
	-@ if not exist "C:\QtMobility\tmp" mkdir "C:\QtMobility\tmp"
	-@ if not exist "C:\QtSystemInfo\tmp" mkdir "C:\QtSystemInfo\tmp"
	-@ if not exist "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\moc\tmp" mkdir "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\moc\tmp"
	-@ if not exist "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\qmlapplicationviewer\tmp" mkdir "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\qmlapplicationviewer\tmp"
	-@ if not exist "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\rcc\tmp" mkdir "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\rcc\tmp"
	-@ if not exist "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\ui\tmp" mkdir "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\ui\tmp"

extension_clean: compiler_clean
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtCore\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtCore\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtNetwork\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtNetwork\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtGui\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtGui\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSql\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSql\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtDeclarative\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtDeclarative\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSystemInfo\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\include\QtSystemInfo\tmp"
	-@ if EXIST "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\common\symbian\tmp" rmdir /s /q  "C:\QtSDK\Symbian\SDKs\Symbian1Qt473\mkspecs\common\symbian\tmp"
	-@ if EXIST "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\tmp" rmdir /s /q  "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\tmp"
	-@ if EXIST "C:\QtMobility\tmp" rmdir /s /q  "C:\QtMobility\tmp"
	-@ if EXIST "C:\QtSystemInfo\tmp" rmdir /s /q  "C:\QtSystemInfo\tmp"
	-@ if EXIST "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\moc\tmp" rmdir /s /q  "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\moc\tmp"
	-@ if EXIST "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\qmlapplicationviewer\tmp" rmdir /s /q  "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\qmlapplicationviewer\tmp"
	-@ if EXIST "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\rcc\tmp" rmdir /s /q  "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\rcc\tmp"
	-@ if EXIST "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\ui\tmp" rmdir /s /q  "C:\Users\Se7en\Documents\Qt\LOCEX\Locv3\ui\tmp"

pre_targetdeps: \
	generated_sources \
	all_source_deps

generated_sources: \
	moc\moc_Mgr.cpp \
	moc\moc_qmlapplicationviewer.cpp \
	rcc\qrc_Qres.cpp

all_source_deps: \
	Mgr.h \
	qmlapplicationviewer\qmlapplicationviewer.h

finalize:

winscw_deployment:

winscw_deployment_clean:

deployment:

deployment_clean:

dodistclean:
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_template.pkg" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_template.pkg"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_stub.pkg" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_stub.pkg"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_installer.pkg" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_installer.pkg"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Makefile" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Makefile"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Makefile_Locv3_exe.mk" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Makefile_Locv3_exe.mk"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_exe.mmp" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_exe.mmp"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_reg.rss" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3_reg.rss"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.rss" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.rss"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\Locv3.loc"
	-@ if EXIST "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\bld.inf" $(DEL_FILE)  "c:\Users\Se7en\Documents\Qt\LOCEX\Locv3\bld.inf"

distclean: clean dodistclean

clean: $(ABLD)
	-$(ABLD) reallyclean
	-bldmake clean

clean-debug: $(ABLD)
	$(ABLD) reallyclean winscw udeb
	$(ABLD) reallyclean gcce udeb
	$(ABLD) reallyclean armv5 udeb
	$(ABLD) reallyclean armv6 udeb

clean-release: $(ABLD)
	$(ABLD) reallyclean gcce urel
	$(ABLD) reallyclean armv5 urel
	$(ABLD) reallyclean armv6 urel

clean-debug-winscw: $(ABLD)
	$(ABLD) reallyclean winscw udeb
clean-debug-gcce: $(ABLD)
	$(ABLD) reallyclean gcce udeb
clean-debug-armv5: $(ABLD)
	$(ABLD) reallyclean armv5 udeb
clean-debug-armv6: $(ABLD)
	$(ABLD) reallyclean armv6 udeb
clean-release-gcce: $(ABLD)
	$(ABLD) reallyclean gcce urel
clean-release-armv5: $(ABLD)
	$(ABLD) reallyclean armv5 urel
clean-release-armv6: $(ABLD)
	$(ABLD) reallyclean armv6 urel

freeze: $(ABLD)
	$(ABLD) freeze

freeze-debug: freeze

freeze-release: freeze

freeze-debug-winscw: $(ABLD)
	$(ABLD) freeze winscw
freeze-debug-gcce: $(ABLD)
	$(ABLD) freeze gcce
freeze-debug-armv5: $(ABLD)
	$(ABLD) freeze armv5
freeze-debug-armv6: $(ABLD)
	$(ABLD) freeze armv6
freeze-release-gcce: $(ABLD)
	$(ABLD) freeze gcce
freeze-release-armv5: $(ABLD)
	$(ABLD) freeze armv5
freeze-release-armv6: $(ABLD)
	$(ABLD) freeze armv6

