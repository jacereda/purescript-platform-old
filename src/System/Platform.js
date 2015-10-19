"use strict";

// module System.Platform

exports.wrapPlatformImpl = function(just) {
  return function(nothing) {
    return function(p) {
    var toMaybe = function(x) { return x? just(x) : nothing; }
    return { description: '' + p.description
           , layout: toMaybe(p.layout)
           , manufacturer: toMaybe(p.manufacturer)
           , name: toMaybe(p.name)
           , prerelease: toMaybe(p.prerelease)
           , product: toMaybe(p.product)
           , ua: toMaybe(p.ua)
           , version: toMaybe(p.version)
           , os: { architecture: toMaybe(p.os.architecture)
                 , family: toMaybe(p.os.family)
                 , version: toMaybe(p.os.version)
                 , description: '' + p.os
                 }
           };
    };
  };
}

exports.platformImpl = require('platform');

exports.parseImpl = function(ua) {
  return require('platform').parse(ua);
}
