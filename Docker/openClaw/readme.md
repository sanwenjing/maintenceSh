#penclaw-alpine
##一个基于alpine镜像安装了openclaw
20260310增加了传入参数

###加入时间:2026.02.08


需要开放局域网访问,需要执行命令
# 1. 允许局域网访问
openclaw config set gateway.bind lan

# 2. 允许非安全认证（解决 origin 限制的关键）
openclaw config set gateway.controlUi.allowInsecureAuth true

# 3. （可选）禁用设备认证
openclaw config set gateway.controlUi.dangerouslyDisableDeviceAuth true

