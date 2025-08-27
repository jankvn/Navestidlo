cmake_minimum_required(VERSION 3.16)

project(Navestidlo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup(REQUIRES 6.8)
set(app_icon_resource_windows "${CMAKE_CURRENT_SOURCE_DIR}/appicon.rc")
qt_add_executable(appNavestidlo
    main.cpp
    ${app_icon_resource_windows}
)
add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")

qt_add_qml_module(appNavestidlo
    URI Navestidlo
    VERSION 0.6
    QML_FILES
        Main.qml
        zaknav.qml
        mainp.qml
        rychs.qml
        oznp.qml
        ostnav.qml
        aboutapp.qml
        VzhledAplikace.qml
        navest.qml
    RESOURCES
        files.qrc
    SOURCES
        zaknavdata.h zaknavdata.cpp
        comboboxhandler.h comboboxhandler.cpp
        splitstr.h splitstr.cpp
        settings.h settings.cpp
        rychnavdata.h rychnavdata.cpp
        sqlmodel.h sqlmodel.cpp
        ostnavdata.h ostnavdata.cpp
        RESOURCES db/main.db
)
qt_add_resources(appNavestidlo "images" "db"
    PREFIX "/"
    FILES images/home-light.png
    FILES images/home-dark.png
    FILES images/settings-dark.png
    FILES images/settings-light.png
    FILES images/logo.png
    FILES images/neprnavic.png
    FILES images/oznpicn.png
    FILES images/rychsoustaic.png
    FILES images/testy.png
    FILES images/zaklnavic.png
    FILES db/svetelna.db
    FILES db/ostatni.db
    FILES Main.qml
    FILES zaknav.qml
    FILES mainp.qml
    FILES ostnav.qml
    FILES oznp.qml
    FILES rychs.qml
    FILES aboutapp.qml
    FILES navest.qml
    FILES VzhledAplikace.qml
    FILES images/oznpasy/AB.png
    FILES images/oznpasy/ABkr.png
    FILES images/oznpasy/cestove.png
    FILES images/oznpasy/kryci.png
    FILES images/oznpasy/navposunvlak.png
    FILES images/oznpasy/null.png
    FILES images/oznpasy/oddilovenav.png
    FILES images/oznpasy/portal.png
    FILES images/oznpasy/provlak.png
    FILES images/oznpasy/seradovaci.png
    FILES images/oznpasy/spadovistni.png
    FILES images/oznpasy/vjezdove.png
    FILES images/oznpasy/vlozena.png
    FILES images/oznpasy/vyckavaci.png
    FILES images/navesti/blizizast.png
    FILES images/navesti/hranicnik.png
    FILES images/navesti/koncovnik.png
    FILES images/navesti/konecnastupiste.png
    FILES images/navesti/mistozastaveni.png
    FILES images/navesti/mistozastaveni2.png
    FILES images/navesti/nameznik.png
    FILES images/navesti/nameznikkonec.png
    FILES images/navesti/primo.png
    FILES images/navesti/sa1.png
    FILES images/navesti/sa2.png
    FILES images/navesti/stuj.png
    FILES images/navesti/stujd.png
    FILES images/navesti/stujn.png
    FILES images/navesti/vlevo.png
    FILES images/navesti/vpravo.png
    FILES images/navesti/zleva_doleva.png
    FILES images/navesti/zleva_doprava.png
    FILES images/navesti/zprava_doleva.png
    FILES images/navesti/zprava_doprava.png
    FILES images/navesti/poszak.png
    FILES images/navesti/poszak_den.png
    FILES images/navesti/poszak_noc.png
    FILES images/vyhybky/primo.png
    FILES images/vyhybky/vlevo.png
    FILES images/vyhybky/vpravo.png
    FILES images/vyhybky/zleva_doleva.png
    FILES images/vyhybky/zleva_doprava.png
    FILES images/vyhybky/zprava_doleva.png
    FILES images/vyhybky/zprava_doprava.png
    FILES images/vyhplan/ovlevo.png
    FILES images/vyhplan/ovpravo.png
    FILES images/vyhplan/ozleva.png
    FILES images/vyhplan/ozprava.png
    FILES images/vyhplan/pdoprava.png
    FILES images/vyhplan/pprimo.png
    FILES images/vyhplan/pvlevo.png
    FILES images/vyhplan/pzleva.png
    FILES images/vyhplan/pzprava.png
    FILES images/vyhplan/pzpravadoleva.png
    FILES images/vyhplan/pzpravadoprava.png
    FILES images/vyhplan/zlevadolevap.png
    FILES images/vyhplan/zlevadopravap.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appNavestidlo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appNavestidlo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appNavestidlo
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appNavestidlo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
