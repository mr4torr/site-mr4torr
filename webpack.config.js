const path = require('path');
const webpack = require('webpack')
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CopyWebpackPlugin = require('copy-webpack-plugin');

const dir_assets = path.resolve(__dirname, 'assets')
const dir_public = path.resolve(__dirname, 'source', 'assets')


const rules = [
    {
        test: /.js[x]?$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
            presets: ['es2015'],
            plugins: ['transform-object-rest-spread']
        }
    },
    {
        test: /\.[s]?css$/,
        use: [
            MiniCssExtractPlugin.loader,
            "css-loader",
            "sass-loader"
        ]
    }, {
        test: /\.woff|.woff2|.ttf|.eot|.svg*.*$/,
        loader: 'file'
    }
]
const assets = {
    entry: dir_assets + '/javascripts/application.js',
    output: {
        path: dir_public + '/javascripts',
        filename: 'application.js'
    },
    resolve: {
        extensions: ['.js', '.jsx', '.css', '.scss'],
        alias: {
          modules: path.resolve(__dirname, 'node_modules')
        }
    },
    module: {
        rules: rules
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '../stylesheets/application.css',
        }),
        new CopyWebpackPlugin([
            { from: path.join(__dirname, 'assets', 'images'),
              to: path.join(__dirname, 'source', 'assets', 'images')}
        ])

    ],
    resolveLoader: {
        moduleExtensions: ["-loader"]
    }
};

module.exports = assets
