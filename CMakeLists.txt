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
        QML_FILES
        RESOURCES files.qrc
        QML_FILES zaknav.qml
        QML_FILES mainp.qml
        QML_FILES rychs.qml
        QML_FILES oznp.qml
        QML_FILES ostnav.qml
        QML_FILES aboutapp.qml
        SOURCES
        SOURCES
        SOURCES zaknavdata.h zaknavdata.cpp
        SOURCES
        SOURCES comboboxhandler.h comboboxhandler.cpp
        SOURCES
        SOURCES splitstr.h splitstr.cpp
        QML_FILES VzhledAplikace.qml
        QML_FILES AppTheme.qml
        SOURCES settings.h settings.cpp
        SOURCES rychnavdata.h rychnavdata.cpp
        SOURCES
        QML_FILES navest.qml
        SOURCES
        SOURCES sqlmodel.h sqlmodel.cpp
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
    FILES images/oznpicn.png
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
    FILES images/navesti/vlevo.png
    FILES images/navesti/vpravo.png
    FILES images/navesti/zleva_doleva.png
    FILES images/navesti/zleva_doprava.png
    FILES images/navesti/zprava_doleva.png
    FILES images/navesti/zprava_doprava.png
    FILES
    FILES
    FILES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appNavestidlo PROPERTIES
    OUTPUT_NAME "Návěstidlo"
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
    DESTINATION bin
)
