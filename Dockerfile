# 基础镜像
FROM node:20-alpine
# 安装 OpenClaw 和 PM2
RUN npm install -g openclaw pm2
# 暴露端口
EXPOSE 10000
# 正确启动命令（用 sh 执行全局 openclaw 命令）
CMD ["sh", "-c", "openclaw gateway --bind 0.0.0.0 --port 10000 --allow-unconfigured --host 0.0.0.0"]
