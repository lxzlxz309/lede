include $(TOPDIR)/rules.mk  
  
PKG_NAME:=my-custom-package  
PKG_VERSION:=1.0  
PKG_RELEASE:=1  
PKG_LICENSE:=GPL-2.0  
PKG_MAINTAINER:=Your Name <your.email@example.com>  
  
include $(INCLUDE_DIR)/package.mk  
  
define Package/$(PKG_NAME)  
  SECTION:=utils  
  CATEGORY:=Utilities  
  TITLE:=My Custom Package  
  DEPENDS:=  
endef  
  
define Package/$(PKG_NAME)/install  
	# 安装可执行文件到非标准目录（通常不推荐）  
	$(INSTALL_DIR) $(1)/usr/sbin/share  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bin/exec1 $(1)/usr/sbin/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bin/exec2 $(1)/usr/sbin/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bin/exec3 $(1)/usr/sbin/share/  
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bin/exec4 $(1)/usr/sbin/share/  
  
	# 安装Lua文件到标准目录  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/lua/file1.lua $(1)/usr/lib/lua/luci/  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/lua/file2.lua $(1)/usr/lib/lua/luci/  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/lua/file3.lua $(1)/usr/lib/lua/luci/  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/lua/file4.lua $(1)/usr/lib/lua/luci/  
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/lua/file5.lua $(1)/usr/lib/lua/luci/  
endef  
  
$(eval $(call BuildPackage,$(PKG_NAME)))