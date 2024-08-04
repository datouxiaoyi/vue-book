#基底镜像
FROM node:20.12.2


#指定工作目录
WORKDIR vue-book


COPY . /vue-book

#换源
RUN npm config set registry https://mirrors.huaweicloud.com/repository/npm 

#安装依赖
RUN npm install && npm run build


FROM nginx:1.21

RUN mkdir /app

COPY --from=0 vue-book/dist /app

COPY nginx.conf /etc/nginx/nginx.conf






