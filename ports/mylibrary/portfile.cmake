vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Murk42/MyLibrary
	REF 505ef9ba1c201aeeace1cb71bbc2ee833540dfa6 #hash to the library repo commit 
	SHA512 eb3e594080686a055b383fe9416c5942a3edae8a7637c54294ea53079685d5f2c20d150e10d37eb028bd5c823a24fea4004b045ad9133dfac0b6973c7cf8ef8a
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
