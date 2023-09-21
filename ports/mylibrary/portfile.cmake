vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Murk42/MyLibrary
	REF b9278e1d878d2c580ee4e80955a4640f834e96fa 
	SHA512 0
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
