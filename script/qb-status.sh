#! /bin/bash
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-2-6
# Description:          qb监控

echo 'export QB_VERSION=qb-nox-static-419-lt1114-oracle@shutu' >> /etc/profile
source /etc/profile

# sed '/QB/d' /etc/profile