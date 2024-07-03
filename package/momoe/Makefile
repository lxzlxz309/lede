include $(TOPDIR)/rules.mk  
  
PKG_NAME:=momoe  
PKG_VERSION:=1.0  
PKG_RELEASE:=1  
PKG_LICENSE:=GPL-2.0  
PKG_MAINTAINER:=Your Name <your.email@example.com>  
  
include $(INCLUDE_DIR)/package.mk  
  
define Package/$(PKG_NAME)  
  SECTION:=utils  
  CATEGORY:=Utilities  
  TITLE:=momoe  
  DEPENDS:=  
endef  
  
define Package/$(PKG_NAME)/install  
	$(INSTALL_DIR) $(1)/usr/share  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/share/ec200a.sh $(1)/usr/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/share/moat $(1)/usr/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/share/moimei $(1)/usr/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/usr/share/mosms $(1)/usr/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/etc/init.d/ec200a $(1)/etc/init.d  
      # 确保可执行文件具有执行权限  
    chmod 755 $(1)/usr/share/ec200a.sh  
    chmod 755 $(1)/usr/share/moat
    chmod 755 $(1)/usr/share/moimei 
    chmod 755 $(1)/usr/share/mosms 
	chmod 755 $(1)/etc/init.d/ec200a
	# 安装Lua文件到标准目录  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/momoe/  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/lib/lua/luci/controller/momoe.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/lib/lua/luci/model/cbi/momoe.lua $(1)/usr/lib/lua/luci/model/cbi/  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/usr/lib/lua/luci/view/momoe/ec200_status.htm $(1)/usr/lib/lua/luci/view/momoe/  

endef  
  
$(eval $(call BuildPackage,$(PKG_NAME)))