#!/bin/bash

# export ENV=${ENV}
# export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
# export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
# export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
# 
# # パラメータストアから環境変数を取得
# aws ssm get-parameters-by-path --path /${ENV}/pcs-product/env/ --region ap-northeast-1 --with-decryption --query Parameters[*].Value --output text > .env
# aws ssm get-parameters --name /${ENV}/pcs-central/oauth2-params --region ap-northeast-1 --with-decryption --query Parameters[*].Value --output text >> .env
# sed -e 's/^\s*//' -i .env

# uwsgi用の環境変数が定義されていない場合は起動できないようにする
if [ -z "${UWSGI_THREADS}" ] || [ -z "${UWSGI_PROCESSES}" ]; then
    echo 'uwsgi-env not found'
    exit 1
fi

# djangoのチェックコマンドが失敗したら起動しないようにする
echo 'django system check'
python3 ./manage.py check
if [ ${?} -ne 0 ]; then
    echo 'check command failed'
    exit 1
fi

echo 'django migrate'
python3 ./manage.py migrate

echo 'uwsgi start'
uwsgi --ini /code/uwsgi.ini
