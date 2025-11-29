# 1. 使用标准的 Node.js 20 镜像
FROM node:20

# 2. 设置工作目录为 /app
WORKDIR /app

# 3. 先只复制 package.json 和 package-lock.json (如果存在)
# 这样可以利用 Docker 缓存，只有在依赖变化时，npm install 才会重新运行
COPY package*.json ./

# 4. 安装项目依赖
RUN npm install

# 5. 再复制所有其他文件（包括 index.js）
COPY . .

# 6. 暴露应用端口
EXPOSE 3000

# 7. 设置容器启动时要执行的命令
CMD ["node", "index.js"]
