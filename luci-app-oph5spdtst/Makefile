include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-oph5spdtst
PKG_VERSION:=0.1.0
PKG_MAINTAINER:=AzulEterno <https://github.com/AzulEterno/oph5spdtst>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/config


	config PACKAGE_oph5spdtst
	default y if PACKAGE_$(PKG_NAME)
	
	config PACKAGE_luci-compat
	default y if PACKAGE_$(PKG_NAME)
endef

define Package/$(PKG_NAME)
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=Open HTML5 speed test in OpenWRT, web page.
	PKGARCH:=all
	LUCI_TITLE:=Open HTML5 speed test in OpenWRT, web page.
	LUCI_DEPENDS:=+oph5spdtst +luci-compat
	LUCI_PKGARCH:=all
	DEPENDS:=+oph5spdtst +luci-compat
	MAINTAINER:=AzulEterno
endef

define Package/$(PKG_NAME)/description
    Add native open html5 speed test application to your admin console. Use nginx to achieve best result.
endef

define Build/Prepare
	$(CP) $(CURDIR)/root $(PKG_BUILD_DIR)
	# $(CP) $(CURDIR)/luasrc $(PKG_BUILD_DIR)
	
	# chmod 0755 $(PKG_BUILD_DIR)/root/etc/init.d/$(PKG_NAME)

	chmod -R 0644 $(PKG_BUILD_DIR)/root/usr/lib/lua/luci/controller/*
	chmod -R 0644 $(PKG_BUILD_DIR)/root/usr/lib/lua/luci/view/oph5spdtst/*
	chmod -R 0644 $(PKG_BUILD_DIR)/root/usr/lib/lua/luci/model/cbi/oph5spdtst/*

	chmod -R 0644 $(PKG_BUILD_DIR)/root/usr/share/rpcd/acl.d/*



	
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
	
	exit 0
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
	
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
