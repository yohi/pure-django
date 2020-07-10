# Pure Django Install From Docker And Dokcer-Compose

## Requred

* Docker
* Docker-Compose
* Git

## Installtaion

1. リポジトリのクローン

`$
git clone https://github.com/yohi/pure-django.git
`

2. ディレクトリの移動  

`$
cd pure-django
`

3. コンテナのビルド

`$
docker-compose build
`

4. プロジェクトの作成（初回のみ）

`$
docker-compose run app django-admin startproject conifg .
`

5. コンテナの起動

`$
docker-compose up
`

6. 起動確認

`
http://localhost:8000
`

## Useage

## Author
Yusuke Ohi (a.k.a. yohi)
