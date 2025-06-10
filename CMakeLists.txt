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
    FILES images/home-light.png images/home-dark.png images/settings-dark.png images/settings-light.png images/logo.png images/neprnavic.png images/oznpicn.png images/rychsoustaic.png images/testy.png images/zaklnavic.png db/svetelna.db db/ostatni.db Main.qml zaknav.qml mainp.qml ostnav.qml oznp.qml rychs.qml aboutapp.qml VzhledAplikace.qml

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
    DESTINATION bin
)
