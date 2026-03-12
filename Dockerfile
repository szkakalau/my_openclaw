# 基础镜像
FROM node:20-alpine
# 安装 OpenClaw 和 PM2，并获取 OpenClaw 绝对路径
RUN npm install -g openclaw pm2 && \
    echo "OPENCLAW_PATH=$(which openclaw)" > /env.sh && \
    chmod +x /env.sh
# 暴露端口
EXPOSE 10000
# 加载环境变量并执行 OpenClaw（用绝对路径）
CMD ["sh", "-c", "source /env.sh && $OPENCLAW_PATH gateway --bind 0.0.0.0 --port 10000 --allow-unconfigured --host 0.0.0.0"]
