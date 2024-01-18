# 需求確認
⚫ 系統規格、網段可自行規劃,OS 平台請用您熟悉的版本
⚫ Front-End and Back-End Load Balance:請安裝 HAProxy
⚫ WEB:請安裝 Nginx 做 Reverse Proxy
⚫ AP:請安裝 WordPress
⚫ DB:請安裝 MySQL or MariaDB
## 測試項目:
### 1.WEB Server HA 切換
### 2.AP Server HA 切換

![系統工程師面試 Homework 系統架構 v1.0_page-0002](https://hackmd.io/_uploads/r1tj5fDK6.jpg)



# 運行方法
1. 調整測試所需hosts
    `sudo -- sh -c "echo '127.0.0.1      test.com' >> /etc/hosts"`
1. 執行docker-compose
    `docker-compose up -d`
1. 現在你可以訪問 test.com 看看自己的 wordpress 是否運行

# 測試 Server HA 切換

1. 請執行test.sh
    `sh test.sh`