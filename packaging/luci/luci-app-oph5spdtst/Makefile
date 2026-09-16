include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-oph5spdtst
PKG_VERSION:=0.2.0
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/AzulEterno/oph5spdtst/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_SUBDIR:=oph5spdtst-$(PKG_VERSION)
PKG_HASH:=d6397604297db9d937dc4d32b1267cf2a5203ade642afc988ff6ec35b226caf5
PKG_MAINTAINER:=AzulEterno <jay2236419527@gmail.com>
PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=src/LICENSE src/www/luci-static/resources/oph5spdtst/License.md

PKG_BUILD_DIR:=$(BUILD_DIR)/oph5spdtst-$(PKG_VERSION)

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
	MAINTAINER:=AzulEterno <jay2236419527@gmail.com>
endef

define Package/$(PKG_NAME)/description
    Add native open html5 speed test application to your admin console. Use nginx to achieve best result.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
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

define Package/$(PKG_NAME)/install
	# $(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	# $(INSTALL_DATA) $(PKG_BUILD_DIR)/*.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(CP) $(PKG_BUILD_DIR)/root/* $(1)/

	$(INSTALL_DIR) $(1)/www/luci-static/resources/oph5spdtst
	$(CP) $(PKG_BUILD_DIR)/src/www/luci-static/resources/oph5spdtst/* \
		$(1)/www/luci-static/resources/oph5spdtst/
	# $(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
