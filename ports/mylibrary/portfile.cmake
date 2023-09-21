vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Murk42/MyLibrary
	REF f41f469c8665b662feed0a154490e31f9cdd3e97 #hash to the library repo commit 
	SHA512 5baa7701415e4ccfdb835d79ad56b0c42cd494ab4d6025c615ed89b5dc478d5c5d3ec9ff357ed9f5d7167c3badd3efa925e9b7062d48bac1618cf3f688cd6a7d
	HEAD_REF master
)

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)
