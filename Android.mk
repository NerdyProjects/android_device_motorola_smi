LOCAL_PATH := $(call my-dir)

ifneq ($(filter smi,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))
include $(call all-subdir-makefiles,$(LOCAL_PATH))
# include x86 encoder (apache-harmony (intel))
include $(TOP)/dalvik/vm/compiler/codegen/x86/libenc/Android.mk

endif
