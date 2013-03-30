#############################################################
#
# a13-olinuxino-software
#
#############################################################

A13_OLINUXINO_SOFTWARE_VERSION = 3512f4a
A13_OLINUXINO_SOFTWARE_SITE = https://github.com/OLIMEX/OLINUXINO/tarball/master

A13_OLINUXINO_SOFTWARE__MOD_RTC__DIR = $(@D)/SOFTWARE/A13/MOD-RTC
A13_OLINUXINO_SOFTWARE__MOD_RTC__EXE = "mod-rtc"

A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__DIR = $(@D)/SOFTWARE/A13/MOD-TC-MK2
A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__EXE = "mod-tc-mk2"

#
# BUILD
#

define A13_OLINUXINO_SOFTWARE_BUILD_CMDS

# mod-rtc
$(if ($(BR2_PACKAGE_A13_OLINUXINO_SOFTWARE_MOD_RTC),y),
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C ${A13_OLINUXINO_SOFTWARE__MOD_RTC__DIR} \
         CC="$(TARGET_CC)" \
         CFLAGS+="$(TARGET_CFLAGS)" \
         EXECUTE=${A13_OLINUXINO_SOFTWARE__MOD_RTC__EXE})

# mod-tc-mk2
$(if ($(BR2_PACKAGE_A13_OLINUXINO_SOFTWARE_MOD_TC_MK2),y),
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C ${A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__DIR} \
         CC="$(TARGET_CC)" \
         CFLAGS+="$(TARGET_CFLAGS)" \
         EXECUTE=${A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__EXE})

endef

#
# INSTALL
#

define A13_OLINUXINO_SOFTWARE_INSTALL_TARGET_CMDS

# mod-rtc
$(if ($(BR2_PACKAGE_A13_OLINUXINO_SOFTWARE_MOD_RTC),y),
    $(INSTALL) -m 0755 -D ${A13_OLINUXINO_SOFTWARE__MOD_RTC__DIR}/${A13_OLINUXINO_SOFTWARE__MOD_RTC__EXE} $(TARGET_DIR)/usr/bin/)

# mod-tc-mk2
$(if ($(BR2_PACKAGE_A13_OLINUXINO_SOFTWARE_MOD_TC_MK2),y),
    $(INSTALL) -m 0755 -D ${A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__DIR}/${A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__EXE} $(TARGET_DIR)/usr/bin/)


endef


#
# UNINSTALL
#

define A13_OLINUXINO_SOFTWARE_UNINSTALL_TARGET_CMDS

# mod-rtc
$(if ($(BR2_PACKAGE_A13_OLINUXINO_SOFTWARE_MOD_RTC),y),
    rm -f $(TARGET_DIR)/usr/bin/${A13_OLINUXINO_SOFTWARE__MOD_RTC__EXE})

# mod-tc-mk2
$(if ($(BR2_PACKAGE_A13_OLINUXINO_SOFTWARE_MOD_TC_MK2),y),
    rm -f $(TARGET_DIR)/usr/bin/${A13_OLINUXINO_SOFTWARE__MOD_TC_MK2__EXE})

endef

$(eval $(generic-package))
