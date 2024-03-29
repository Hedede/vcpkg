vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO absurdworlds/awlib
    REF ${VERSION}
    SHA512 349e5b165052f91fe799f383700ec1b6ffae3b5147e4a7afa4b2ec86661c220469ac4b7be9c5c88bffe7001ed0b929bc543f2d5bea2c953ed19dd931464ed29e
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    graphics         AW_ENABLE_GRAPHICS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME ${PORT} CONFIG_PATH lib/cmake/${PORT})

vcpkg_fixup_pkgconfig()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_copy_pdbs()
