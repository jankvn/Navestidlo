cmake_minimum_required(VERSION 3.16)

project(Navestidlo VERSION 0.1 LANGUAGES CXX)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
if(APPLE)
    set(Qt6IosLaunchScreen OFF CACHE BOOL "Disable Qt-generated iOS launch screen")
endif()
# Najdi Qt6 moduly
find_package(Qt6 REQUIRED COMPONENTS Quick Sql Core)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appNavestidlo
    main.cpp
    ${SOURCES}
    ${EXTRA_SOURCES}
)
# -------- Společné zdroje --------
set(QML_FILES
    Main.qml
    pages/zaknav.qml
    pages/mainp.qml
    pages/rychs.qml
    pages/oznp.qml
    pages/ostnav.qml
    pages/aboutapp.qml
    components/VzhledAplikace.qml
    pages/navest.qml
    pages/AboutDesktop.qml
    pages/AboutMobile.qml
    pages/zaknavMobile.qml
    pages/zaknavDesktop.qml
    components/RoundedBackground.qml
    pages/nahlasitchybuDesktop.qml
    pages/nahlasitchybuMobile.qml
    pages/nastaveniDesktop.qml
    pages/nastaveniMobile.qml
    pages/ostnavDesktop.qml
    pages/ostnavMobile.qml
    pages/oznpDesktop.qml
    pages/oznpMobile.qml
)

set(SOURCES
    main.cpp
    zaknavdata.h zaknavdata.cpp
    comboboxhandler.h comboboxhandler.cpp
    splitstr.h splitstr.cpp
    settings.h settings.cpp
    rychnavdata.h rychnavdata.cpp
    sqlmodel.h sqlmodel.cpp
    ostnavdata.h ostnavdata.cpp
    androidbridge.h androidbridge.cpp
    dbinfo.h dbinfo.cpp
)

# -------- Qt QML modul --------
qt_add_qml_module(appNavestidlo
    URI Navestidlo
    VERSION 0.7
    QML_FILES ${QML_FILES}
    SOURCES ${SOURCES} ${EXTRA_SOURCES}
    QML_FILES pages/teorie.qml
    QML_FILES pages/testy.qml
    QML_FILES pages/ostatni.qml
    QML_FILES pages/nastaveni.qml
    QML_FILES pages/rychsDesktop.qml
    QML_FILES pages/rychsMobile.qml
    QML_FILES pages/nahlasitchybu.qml
    RESOURCES files.qrc
    RESOURCES version.h.in
    SOURCES dbinfo.h dbinfo.cpp
    QML_FILES pages/navestMobile.qml
    QML_FILES pages/navestDesktop.qml
    SOURCES systemtheme.h
)

# -------- Qt Resources --------
qt_add_resources(appNavestidlo "resources"
    PREFIX "/"
    FILES
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
    FILES db/main.db
    FILES Main.qml
    FILES pages/zaknav.qml
    FILES pages/mainp.qml
    FILES pages/ostnav.qml
    FILES pages/oznp.qml
    FILES pages/rychs.qml
    FILES pages/aboutapp.qml
    FILES pages/navest.qml
    FILES components/VzhledAplikace.qml
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
    FILES images/menu-dark.png
    FILES images/menu-light.png
    FILES images/repabug-dark.png
    FILES images/repabug-light.png
    FILES NotoSansSymbols2-Regular.ttf
    FILES pages/AboutDesktop.qml
    FILES pages/AboutMobile.qml
    FILES pages/zaknavDesktop.qml
    FILES pages/zaknavMobile.qml
    FILES pages/navestDesktop.qml
    FILES pages/navestMobile.qml
    FILES pages/ostatni.qml
    FILES db/main.db
    FILES components/RoundedBackground.qml
    FILES pages/nastaveni.qml
    FILES pages/teorie.qml
    FILES pages/testy.qml
    FILES pages/rychsDesktop.qml
    FILES pages/rychsMobile.qml
    FILES pages/nahlasitchybu.qml
    FILES pages/nahlasitchybuDesktop.qml
    FILES pages/nahlasitchybuMobile.qml
    FILES pages/nastaveniDesktop.qml
    FILES pages/nastaveniMobile.qml
    FILES pages/ostnavDesktop.qml
    FILES pages/ostnavMobile.qml
    FILES pages/oznpDesktop.qml
    FILES pages/oznpMobile.qml
)
if(WIN32)
    set_target_properties(appNavestidlo PROPERTIES
        WIN32_EXECUTABLE TRUE
    )
    set(app_icon_resource_windows "${CMAKE_CURRENT_SOURCE_DIR}/appicon.rc")
    set(EXTRA_SOURCES ${app_icon_resource_windows})

elseif(LINUX)
    set_target_properties(appNavestidlo PROPERTIES
        BUNDLE TRUE
    )

elseif(APPLE)
    if (IOS)
        message(STATUS "Building for iOS")
        set(MACOSX_BUNDLE TRUE)

        # Cesta k vlastním iOS souborům
        set(MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/ios/Info.plist)
        set(LAUNCH_SCREEN ${CMAKE_CURRENT_SOURCE_DIR}/ios/StartScreen.storyboard)
        set(ASSETCATALOG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ios/Assets.xcassets)

        # Storyboard se vloží ručně, protože jsme Qt-ovský vypnuli
        set_source_files_properties(${LAUNCH_SCREEN} PROPERTIES
            MACOSX_PACKAGE_LOCATION "Resources"
        )
        target_sources(appNavestidlo PRIVATE  ${ASSETCATALOG_DIR} ${LAUNCH_SCREEN})

        # Nastavení pro Xcode
        set_target_properties(appNavestidlo PROPERTIES
            MACOSX_BUNDLE TRUE

            MACOSX_BUNDLE_INFO_PLIST ${MACOSX_BUNDLE_INFO_PLIST}
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME "AppIcon"
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_INCLUDE_ALL_APPICON_ASSETS YES
            ICONS "${CMAKE_SOURCE_DIR}/ios/AppIcon.appiconset"
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_OTHER_ASSETS "${ASSETCATALOG_DIR}"
            XCODE_ATTRIBUTE_LAUNCH_SCREEN_FILE "StartScreen"
        )
    set_source_files_properties(${ASSETCATALOG_DIR} PROPERTIES
        MACOSX_PACKAGE_LOCATION Resources
    )
else() # ---------- macOS ----------
       message(STATUS "Building for macOS")

       set(MACOSX_BUNDLE TRUE)
       set(MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/macos/Info.plist)

       # macOS ikona (.icns)
       set(APP_ICON ${CMAKE_CURRENT_SOURCE_DIR}/macos/AppIcon.icns)
       set_source_files_properties(${APP_ICON} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")
       target_sources(appNavestidlo PRIVATE ${APP_ICON})
       # Přidáme jen SQLite SQL driver do bundle
       # Přidáme jen SQLite SQL driver do bundle

       set_target_properties(appNavestidlo PROPERTIES
           MACOSX_BUNDLE TRUE
           MACOSX_BUNDLE_NAME "Návěstidlo"
           MACOSX_BUNDLE_INFO_PLIST ${MACOSX_BUNDLE_INFO_PLIST}
           RESOURCE "${APP_ICON}"
           XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME "AppIcon"
           XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_INCLUDE_ALL_APPICON_ASSETS YES
           ICONS "${CMAKE_SOURCE_DIR}/ios/Assets.xcassets/AppIcon.appiconset"
       )
   # -------- Přidáme jen SQLite plugin --------
          find_package(Qt6 COMPONENTS Sql REQUIRED)
          # cesta k Qt6 bundle (plugins)
          get_target_property(Qt6_DIR_LOCATION Qt6::Core LOCATION)

          get_filename_component(Qt6_BIN_DIR ${Qt6_DIR_LOCATION} DIRECTORY)
          set(QT_PLUGINS_DIR "${Qt6_BIN_DIR}/../plugins")

          # SQLite driver
          set(QT_SQLITE_PLUGIN "/Users/user/Qt/6.9.2/macos/plugins/sqldrivers/libqsqlite.dylib")

          if(EXISTS ${QT_SQLITE_PLUGIN})
              message(STATUS "Adding SQLite driver: ${QT_SQLITE_PLUGIN}")
              set_source_files_properties(${QT_SQLITE_PLUGIN} PROPERTIES
                  MACOSX_PACKAGE_LOCATION "PlugIns/sqldrivers"
              )
              target_sources(appNavestidlo PRIVATE ${QT_SQLITE_PLUGIN})
          else()
              message(FATAL_ERROR "SQLite plugin not found at: ${QT_SQLITE_PLUGIN}")
          endif()
   endif()
elseif(ANDROID)
    set(ANDROID_ASSETS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/db")
    set_property(TARGET appNavestidlo APPEND PROPERTY
        QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
    )
# Cesta k OpenSSL souborům v projektu
    set(ANDROID_OPENSSL_LIBS_DIR "${CMAKE_SOURCE_DIR}/android/libs")

    # Přidání knihoven do APK
    add_library(ssl SHARED IMPORTED)
    set_target_properties(ssl PROPERTIES IMPORTED_LOCATION
        "${ANDROID_OPENSSL_LIBS_DIR}/${ANDROID_ABI}/libssl.so"
    )

    add_library(crypto SHARED IMPORTED)
    set_target_properties(crypto PROPERTIES IMPORTED_LOCATION
        "${ANDROID_OPENSSL_LIBS_DIR}/${ANDROID_ABI}/libcrypto.so"
    )

    # Link knihoven s hlavním cílem
    target_link_libraries(appNavestidlo PRIVATE ssl crypto)
endif()

# -------- Link Qt knihoven --------
target_link_libraries(appNavestidlo
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
    PRIVATE Qt6::Core
)
target_link_libraries(appNavestidlo PRIVATE Qt6::Core)

# -------- Instalace --------
include(GNUInstallDirs)
install(TARGETS appNavestidlo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
# Hlavní verze
set(APP_VERSION_MAJOR 0)
set(APP_VERSION_MINOR 8)

# Soubor, kde se bude ukládat build number (sdílený napříč platformami)
set(BUILD_NUMBER_FILE "${CMAKE_SOURCE_DIR}/version/build_number.txt")

if(EXISTS ${BUILD_NUMBER_FILE})
    file(READ ${BUILD_NUMBER_FILE} BUILD_NUMBER_STR)
    string(STRIP ${BUILD_NUMBER_STR} APP_BUILD_NUMBER)
else()
    set(APP_BUILD_NUMBER 0)
endif()

# Inkrementace build number
math(EXPR APP_BUILD_NUMBER "${APP_BUILD_NUMBER} + 1")
file(WRITE ${BUILD_NUMBER_FILE} "${APP_BUILD_NUMBER}")

# Řetězcová verze ve tvaru "1.0.123"
set(APP_VERSION_STRING "${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_BUILD_NUMBER}")

# Vygenerujeme hlavičku
configure_file(
    ${CMAKE_SOURCE_DIR}/version.h.in
    ${CMAKE_BINARY_DIR}/generated/version.h
    @ONLY
)

include_directories(${CMAKE_BINARY_DIR}/generated)

# Nastavíme verzi i na úrovni projektu (vidí ji třeba Qt Creator)
set(PROJECT_VERSION ${APP_VERSION_STRING})
# Získáme aktuální datum ve formátu DD.MM.YYYY
string(TIMESTAMP BUILD_DATE "%d.%m.%Y")

# Přidáme do definic pro C++
add_definitions(-DBUILD_DATE="${BUILD_DATE}")

