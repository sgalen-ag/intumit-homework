#!/bin/bash
sudo -- sh -c "echo '127.0.0.1      test.com' >> /etc/hosts"
docker-compose up -d
sleep 10s

echo "正常情況下測試"
echo "--------------------------"
wget test.com > /dev/null 2>&1
head -5 index.html 2>&1
echo "--------------------------"
echo "可取得html代表訪問正常"
echo "--------------------------"
sleep 5s
rm index.html > /dev/null 2>&1

docker rm -f nginx1 > /dev/null 2>&1
echo "現在關閉nginx1服務"
echo "--------------------------"
sleep 20s
wget test.com > /dev/null 2>&1
head -5 index.html 2>&1
echo "--------------------------"
echo "可取得html代表訪問仍然正常"
echo "--------------------------"
sleep 5s
rm index.html > /dev/null 2>&1

docker rm -f nginx2 > /dev/null 2>&1
echo "現在接著再關閉nginx2服務"
echo "--------------------------"
wget test.com > /dev/null 2>&1
head -5 index.html 2>&1
echo "--------------------------"
echo "不可取得html代表訪問異常，因服務皆已關閉。"
echo "--------------------------"
sleep 5s
rm index.html > /dev/null 2>&1

echo "現在重啟nginx1、2服務"
echo "--------------------------"
docker-compose up -d

sleep 10s


docker rm -f wordpress1 > /dev/null 2>&1
sleep 20s
echo "現在關閉wordpress1服務"
echo "--------------------------"
wget test.com > /dev/null 2>&1
head -5 index.html 2>&1
echo "--------------------------"
echo "可取得html代表訪問仍然正常"
echo "--------------------------"
sleep 5s
rm index.html > /dev/null 2>&1

docker rm -f wordpress2 > /dev/null 2>&1
echo "接著再關閉wordpress2服務"
echo "--------------------------"
wget test.com > /dev/null 2>&1
head -5 index.html 2>&1
echo "--------------------------"
echo "不可取得html代表訪問異常，因服務皆已關閉。"
echo "--------------------------"
sleep 5s
rm index.html > /dev/null 2>&1

docker-compose down
sudo -- sh -c "sed -i '/test.com/d' /etc/hosts"