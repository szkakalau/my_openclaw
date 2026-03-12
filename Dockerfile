# 基础镜像（用完整版 Node，避免 Alpine 环境问题）
FROM node:20-slim
# 安装 OpenClaw 和 PM2（slim 镜像兼容更好）
RUN npm install -g openclaw pm2
# 暴露端口
EXPOSE 10000
# 直接用 node 执行 OpenClaw 入口文件，参数明确传递
CMD ["node", "/usr/local/lib/node_modules/openclaw/bin/cli.js", "gateway", "--bind", "0.0.0.0", "--port", "10000", "--allow-unconfigured", "--host", "0.0.0.0"]
