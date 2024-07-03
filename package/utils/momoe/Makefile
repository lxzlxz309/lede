include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk
 
PKG_NAME:=momoe  
PKG_VERSION:=1.0  
PKG_RELEASE:=1  
PKG_LICENSE:=GPL-2.0  
PKG_MAINTAINER:=Your Name <your.email@example.com>  
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)
PKG_CONFIG_DEPENDS :=
 
include $(INCLUDE_DIR)/package.mk
 
 
define Package/$(PKG_NAME)
    SECTION:=net
    CATEGORY:=Network
    TITLE:=momoe
    #DEPENDS:=+libuci
    #URL:=https://blog.csdn.net/qq_41453285/article/details/102545618
    #MAINTAINER:=1286550014@qq.com
endef



define Package/$(PKG_NAME)/description
    momoe description.
endef
 
define Build/Prepare
    mkdir -p $(PKG_BUILD_DIR)
    $(CP) ./src/* $(PKG_BUILD_DIR)/
endef
 
 
define Build/Configure
endef
 
define Build/Compile
    $(MAKE) -C $(PKG_BUILD_DIR) \
        $(TARGET_CONFIGURE_OPTS) \
        CFLAGS="$(TARGET_CFLAGS)" \
        CPPFLAGS="$(TARGET_CPPFLAGS)"\ 
        LDFLAGS="$(TARGET_LDFLAGS)"
endef
 
define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share  
	$(INSTALL_BIN) ./files/usr/share/ec200a.sh $(1)/usr/share/  
	$(INSTALL_BIN) ./files/usr/share/moat $(1)/usr/share/  
	$(INSTALL_BIN) ./files/usr/share/moimei $(1)/usr/share/  
	$(INSTALL_BIN) ./files/usr/share/mosms $(1)/usr/share/  
	$(INSTALL_BIN) ./files/etc/init.d/ec200a $(1)/etc/init.d  
      # 确保可执行文件具有执行权限  
    # chmod 755 $(1)/usr/share/ec200a.sh  
    # chmod 755 $(1)/usr/share/moat
    # chmod 755 $(1)/usr/share/moimei 
    # chmod 755 $(1)/usr/share/mosms 
	# chmod 755 $(1)/etc/init.d/ec200a
	# 安装Lua文件到标准目录  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/  
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/momoe/  
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/controller/momoe.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/model/cbi/momoe.lua $(1)/usr/lib/lua/luci/model/cbi/  
	$(INSTALL_DATA) ./files/usr/lib/lua/luci/view/momoe/ec200_status.htm $(1)/usr/lib/lua/luci/view/momoe/  
endef
 
$(eval $(call BuildPackage,$(PKG_NAME)))
