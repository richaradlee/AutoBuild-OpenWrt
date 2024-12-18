#!/bin/bash
#===============================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.1.251/g' openwrt/package/base-files/files/bin/config_generate

######## 修改默认 网关、DNS########
# ZZZ="package/base-files/files/bin/config_generate"
########
#cat >> $ZZZ <<-EOF
# 设置旁路由模式
#uci set network.lan.gateway='192.168.10.1'                     # 旁路由设置 IPv4 网关
#uci set network.lan.dns='223.5.5.5 8.8.8.8'            # 旁路由设置 DNS(多个DNS要用空格分开)
#uci set dhcp.lan.ignore='1'                                  # 旁路由关闭DHCP功能
#uci delete network.lan.type                                  # 旁路由桥接模式-禁用
#EOF
# 修改退出命令到最后
#sed -i '/exit 0/d' $ZZZ && echo "exit 0" >> $ZZZ
##################################

# 固件版本前面添加个性名字
#sed -i 's#LEDE#OpenWrt#g' /etc/openwrt_release

# 更改 Argon 主题背景 *必须有images目录对应里面的图片
#cp -f $GITHUB_WORKSPACE/images/bg1.jpg feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/kenzo/g' openwrt/package/base-files/files/bin/config_generate

#Custom settings
#sed -i 's?zstd$?zstd ucl upx\n$(curdir)/upx/compile := $(curdir)/ucl/compile?g' tools/Makefile
#sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite/' package/Makefile

# 设置 root 用户密码
#sed -i 's/root:.*/root:$1$tTPCBw1t$ldzfp37h5lSpO9VXk4uUE\/:18336:0:99999:7:::/g' package/base-files/files/etc/shadow  #默认密码password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/base-files/files/etc/shadow   #默认密码为空

# 添加额外插件
# git_clone https://github.com/kongfl888/luci-app-adguardhome
# clone_all https://github.com/sirpdboy/luci-app-ddns-go

# nclone_all lua https://github.com/sbwml/luci-app-alist
# clone_all v5-lua https://github.com/sbwml/luci-app-mosdns
# git_clone https://github.com/sbwml/packages_lang_golang golang

# git_clone lede https://github.com/pymumu/luci-app-smartdns
# git_clone https://github.com/pymumu/openwrt-smartdns smartdns

# git_clone https://github.com/ximiTech/luci-app-msd_lite
# git_clone https://github.com/ximiTech/msd_lite

# clone_all https://github.com/linkease/istore-ui
# clone_all https://github.com/linkease/istore luci

# 科学上网插件
# clone_all https://github.com/fw876/helloworld
# clone_all https://github.com/xiaorouji/openwrt-passwall-packages
# clone_all https://github.com/xiaorouji/openwrt-passwall
# clone_all https://github.com/xiaorouji/openwrt-passwall2
# clone_dir https://github.com/vernesong/OpenClash luci-app-openclash

# Themes
# git_clone https://github.com/kiddin9/luci-theme-edge
# git_clone https://github.com/jerrykuku/luci-theme-argon
# git_clone https://github.com/jerrykuku/luci-app-argon-confi
# clone_dir https://github.com/haiibo/packages luci-theme-opentomcat

# 调整 Docker 到 服务 菜单
# sed -i 's/"admin"/"admin", "services"/g' feeds/luci/applications/luci-app-dockerman/luasrc/controller/*.lua
# sed -i 's/"admin"/"admin", "services"/g; s/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
# sed -i 's/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/*.htm
# sed -i 's|admin\\|admin\\/services\\|g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/container.htm

# 调整 ZeroTier 到 服务 菜单
# sed -i 's/vpn/services/g; s/VPN/Services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
# sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm

# 添加防火墙规则
# sed -i '/PREROUTING/s/^#//' package/lean/default-settings/files/zzz-default-settings

# 取消对 samba4 的菜单调整
# sed -i '/samba4/s/^/#/' package/lean/default-settings/files/zzz-default-settings

# 开始下载openchash运行内核
# [ $CLASH_KERNEL ] && {
#     BEGIN_TIME=$(date '+%H:%M:%S')
#     chmod +x $GITHUB_WORKSPACE/scripts/preset-clash-core.sh
#     $GITHUB_WORKSPACE/scripts/preset-clash-core.sh $CLASH_KERNEL
#     status 下载openchash运行内核
# }

# 开始下载zsh终端工具
# BEGIN_TIME=$(date '+%H:%M:%S')
# chmod +x $GITHUB_WORKSPACE/scripts/preset-terminal-tools.sh
# $GITHUB_WORKSPACE/scripts/preset-terminal-tools.sh
# status 下载zsh终端工具

# 开始下载adguardhome运行内核
#[ $CLASH_KERNEL ] && {
#    BEGIN_TIME=$(date '+%H:%M:%S')
#    chmod +x $GITHUB_WORKSPACE/scripts/preset-adguard-core.sh
#    $GITHUB_WORKSPACE/scripts/preset-adguard-core.sh $CLASH_KERNEL
#    status 下载adguardhome运行内核
#}
