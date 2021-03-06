################################################################################
#
# hdparm
#
################################################################################

HDPARM_VERSION = 9.43
HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
HDPARM_LICENSE = BSD-Style
HDPARM_LICENSE_FILES = LICENSE.TXT

define HDPARM_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

ifeq ($(BR2_HAVE_DOCUMENTATION),y)
define HDPARM_INSTALL_DOCUMENTATION
	$(INSTALL) -D $(@D)/hdparm.8 $(TARGET_DIR)/usr/share/man/man8/hdparm.8
endef
endif

define HDPARM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/hdparm $(TARGET_DIR)/sbin/hdparm
	$(HDPARM_INSTALL_DOCUMENTATION)
endef

$(eval $(generic-package))
