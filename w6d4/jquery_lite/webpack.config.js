var path = require('path');

module.exports = {
  entry: './lib/main.js',
  output: {
    filename: 'jquery_lite.js',
    path: path.resolve(__dirname, 'lib')
  }
};
