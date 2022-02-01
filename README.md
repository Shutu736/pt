## 安装

### 腾讯云

```bash
bash <(wget -qO- "https://raw.githubusercontent.com/Shutu736/pt/master/script/seedbox.sh") \
  --username username --password password \
  --domain domain.com \
  --dns_type dns_dp --dns_id xxxx --dns_key xxxx
```

### 阿里云

```bash
bash <(wget -qO- "https://raw.githubusercontent.com/Shutu736/pt/master/script/seedbox.sh") \
  --username username --password password \
  --domain domain.com \
  --dns_type dns_ali --dns_key xxxx --dns_secret xxxx
```

## 安装 qb

```bash
bash <(wget -qO- "https://raw.githubusercontent.com/Shutu736/pt/master/script/qb-nox-static.sh") username password
```

## 删除 qb

```bash
wget https://raw.githubusercontent.com/Shutu736/pt/master/script/qb-nox-remove.sh && chmod +x seedbox.sh
./qb-nox-remove.sh <username>
```
