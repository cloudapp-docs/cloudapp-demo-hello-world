const http = require('http');

const server = http.createServer((req, res) => {
  // 响应获取 Service 地址的 API 请求
  res.end(JSON.stringify({
    message: `你好，当前服务器时间为 ${new Date().toLocaleDateString()} ${new Date().toLocaleTimeString()}`,
    env: process.env,
  }));
});

server.listen(80);