# 用兼容更好的 Node 镜像
FROM node:20-slim
# 安装 OpenClaw + PM2，同时查找并保存实际入口路径
RUN npm install -g openclaw pm2 && \
    # 动态查找 OpenClaw 的 CLI 入口文件
    OPENCLAW_CLI=$(find /usr/local/lib/node_modules/openclaw -name "cli.js" -type f) && \
    # 把路径写入脚本，避免 Shell 解析问题
    echo "#!/bin/bash" > /start.sh && \
    echo "node \$OPENCLAW_CLI gateway --bind 0.0.0.0 --port 10000 --allow-unconfigured --host 0.0.0.0" >> /start.sh && \
    # 赋予执行权限
    chmod +x /start.sh
# 暴露端口
EXPOSE 10000
# 执行启动脚本
CMD ["/start.sh"]
