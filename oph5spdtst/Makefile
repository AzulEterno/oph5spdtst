include $(TOPDIR)/rules.mk

PKG_NAME:=oph5spdtst
PKG_VERSION:=0.1.0
PKG_MAINTAINER:=AzulEterno <https://github.com/AzulEterno/oph5spdtst>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/config


	config PACKAGE_luci-light
	default y if PACKAGE_$(PKG_NAME)
	
endef

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Open HTML5 speed test in OpenWRT
	PKGARCH:=all
	DEPENDS:=+luci +luci-light
	MAINTAINER:=AzulEterno
endef

define Package/$(PKG_NAME)/description
    Add native open html5 speed test application to your web engine. Use nginx to achieve best result.
endef

define Build/Prepare
	$(CP) $(CURDIR)/root $(PKG_BUILD_DIR)
	# $(CP) $(CURDIR)/luasrc $(PKG_BUILD_DIR)
	
	chmod 0755 $(PKG_BUILD_DIR)/root/etc/init.d/$(PKG_NAME)
	
	exit 0
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
endef

define Package/$(PKG_NAME)/preinst
#!/bin/sh
	rm -rf /tmp/tmp/spdtst_payload.bin 2>&1
	exit 0
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
	/etc/init.d/oph5spdtst enable
	/etc/init.d/oph5spdtst start
	exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh

	exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh

	rm -rf /tmp/tmp/spdtst_payload.bin 2>&1
	exit 0 
endef

define Package/$(PKG_NAME)/install
	# $(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	# $(INSTALL_DATA) $(PKG_BUILD_DIR)/*.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(CP) $(PKG_BUILD_DIR)/root/* $(1)/
	# $(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
