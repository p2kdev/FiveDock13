PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk
export TARGET = iphone:clang:13.2:13.0
export ARCHS = arm64 arm64e

TWEAK_NAME = FiveDock13
$(TWEAK_NAME)_FILES = FiveDock13.xm
$(TWEAK_NAME)_CFLAGS = -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/aggregate.mk
