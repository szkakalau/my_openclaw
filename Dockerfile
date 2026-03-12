FROM node:20-alpine
RUN npm install -g openclaw pm2
EXPOSE 10000
CMD ["pm2-runtime", "start", "openclaw", "--", "gateway", "--bind", "0.0.0.0", "--port", "10000", "--allow-unconfigured", "--host", "0.0.0.0"]
