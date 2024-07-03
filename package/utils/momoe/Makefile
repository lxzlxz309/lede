include $(TOPDIR)/rules.mk

PKG_NAME:=momoe
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/momoe
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Momoe Package
endef

define Package/momoe/description
    This is a simple example package that copies files to specific directories.
endef

define Build/Compile
    # nothing to compile
endef

define Package/momoe/install
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_DIR) $(1)/usr/share
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/momoe

    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/config/ec200a $(1)/etc/config/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/etc/init.d/ec200a $(1)/etc/init.d/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/share/ec200a.sh $(1)/usr/share/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/share/moat $(1)/usr/share/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/share/moimei $(1)/usr/share/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/share/mosms $(1)/usr/share/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/lib/lua/luci/controller/momoe.lua $(1)/usr/lib/lua/luci/controller/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/lib/lua/luci/model/cbi/momoe.lua $(1)/usr/lib/lua/luci/model/cbi/
    $(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/lib/lua/luci/view/momoe/ec200_status.htm $(1)/usr/lib/lua/luci/view/momoe/

endef

$(eval $(call BuildPackage,momoe))
