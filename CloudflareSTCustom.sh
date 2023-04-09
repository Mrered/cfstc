#!/bin/zsh

# 打开 URL Scheme
open "clash://quit"

# 等待 Clash for Windows 关闭
while pgrep -x "Clash for Windows" > /dev/null; do
  sleep 1
done

# 弹出开始提示
osascript -e 'display notification "开始优选Cloudflare CDN IPV6" with title "代理已关闭"'

# 等待2秒钟
sleep 1

# 执行 CloudflareST
/opt/homebrew/Cellar/cfstarm64/2.2.2/bin/CloudflareST -f /opt/homebrew/Cellar/cfstarm64/2.2.2/bin/ipv6.txt -o ~/.CloudflareSTResult/result.csv -n 1000 -dn 10 -tll 30 -dt 13 -tl 300 -sl 15 -p 5

# 等待2秒钟
sleep 1

# 打开 Clash for Windows
open "/Applications/Clash for Windows.app"

# 等待2秒钟
sleep 1

# 弹出提示信息并退出终端窗口
osascript -e 'display notification "优选完成" with title "代理已打开"'

# 关闭终端窗口
osascript -e 'tell application "Terminal" to close first window' & exit