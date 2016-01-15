module.exports = {
    entry: "./entry.js",
    output: {
        path: __dirname,
        filename: "bundle.js"
    },
    module: {
        loaders: [
            { test:/\.vue*/, loader: "vue-loader" },
            { test:/\.css*/, loader: "style!css" },
            { test: /\.(png|woff|woff2|eot|ttf|gif|svg|jpg)$/, loader: "file-loader", query: {name: "[name].[hash].[ext]"} }
        ]
    },
    devtool: 'source-map'
};