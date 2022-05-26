const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const port = process.env.PORT || 3000;

module.exports = {
    entry: './src/Test.bs.js',
    output: {
        filename: 'bundle.js'
    },
    watch: true
};
