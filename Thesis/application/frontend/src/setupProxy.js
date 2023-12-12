const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function(app) {
  app.use(
    '/api/data',
    createProxyMiddleware({
      target: 'http://backend-service:4000',
      changeOrigin: true,
    })
  );
};
