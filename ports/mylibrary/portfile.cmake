vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Murk42/MyLibrary
	REF 8bef09ed0a9281dee43b4da09cf254e2790f7a1c 
	SHA512 aefab53eccc1a244709a77cb3b58959dd74365b883ca548c121029e8ce98c4d96dd30df741aab27ea785c8eb4799099881165672f6aba8f1b1cfa52e375b53dd
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
