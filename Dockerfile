FROM alpine:3.6

LABEL maintainer="https://github.com/jkoChen"
# 参数均改成自己需要的参数
# 端口
ENV SSR_SERVER_PORT 2333
# 密码
ENV SSR_PASSWORD 2333
ENV SSR_METHOD aes-256-cfb
# 协议 加上 _compatible  可以兼容 SS
ENV SSR_PROTOCOL auth_sha1_v4_compatible
# 混淆 
ENV SSR_OBFS plain

RUN apk update && \
    apk --no-cache upgrade && \
    apk --no-cache add libsodium git python && \
    cd ~ && \
    git clone -b manyuser https://github.com/jkoChen/shadowsocksr

EXPOSE $SSR_SERVER_PORT

CMD python /root/shadowsocksr/shadowsocks/server.py -p $SSR_SERVER_PORT -k $SSR_PASSWORD -m $SSR_METHOD -O $SSR_PROTOCOL -o $SSR_OBFS