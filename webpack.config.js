const path = require('path');
const autoprefixer = require('autoprefixer');
const FaviconsWebpackPlugin = require('favicons-webpack-plugin')
const settings = require('./src/settings.json')

function tryResolve_(url, sourceFilename) {
    // Put require.resolve in a try/catch to avoid node-sass failing with cryptic libsass errors
    // when the importer throws
    try {
        return require.resolve(url, { paths: [path.dirname(sourceFilename)] });
    } catch (e) {
        return '';
    }
}

function tryResolveScss(url, sourceFilename) {
    // Support omission of .scss and leading _
    const normalizedUrl = url.endsWith('.scss') ? url : `${url}.scss`;
    return tryResolve_(normalizedUrl, sourceFilename) ||
        tryResolve_(path.join(path.dirname(normalizedUrl), `_${path.basename(normalizedUrl)}`),
            sourceFilename);
}

function materialImporter(url, prev) {
    if (url.startsWith('@material')) {
        const resolved = tryResolveScss(url, prev);
        return { file: resolved || url };
    }
    return { file: url };
}


module.exports = [{
    mode: 'production',
    entry: './src/material-custom/main.scss',
    output: {
        // This is necessary for webpack to compile
        // But we never use style-bundle.js
        filename: 'style-bundle.js',
        path: path.resolve(__dirname, 'dist'),
        clean: true
    },
    performance: {
        hints: false,
        maxEntrypointSize: 512000,
        maxAssetSize: 512000
    },
    module: {
        rules: [
            {
                test: /\.scss$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: 'material-components-web.min.css',
                        },
                    },
                    { loader: 'extract-loader' },
                    { loader: 'css-loader' },
                    {
                        loader: 'postcss-loader',
                        options: {
                            postcssOptions: {
                                plugins: [
                                    autoprefixer()
                                ]
                            }
                        }
                    },
                    {
                        loader: 'sass-loader',
                        options: {
                            sassOptions: {
                                includePaths: ['./node_modules']
                            },
                            // Prefer Dart Sass
                            implementation: require('sass'),

                            // See https://github.com/webpack-contrib/sass-loader/issues/804
                            webpackImporter: false,
                        }
                    },
                ]
            }
        ]
    },
    plugins: [
        new FaviconsWebpackPlugin({
            logo: settings.logo,
            cache: true,
            outputPath: 'favicon',
            inject: true,
            favicons: {
                appName: settings.appName,
                appDescription: settings.appDescription,
                developerName: settings.developerName,
                developerURL: settings.developerURL,
                background: settings.background,
                theme_color: settings.theme_color,
                icons: {
                    coast: false,
                    yandex: false
                }
            }
        })
    ]
}];