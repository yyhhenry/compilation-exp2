// ==UserScript==
// @name         us-bing-trigger
// @namespace    http://tampermonkey.net/
// @version      0.0.5
// @description  Automatically redirecting to the global version of Bing.
// @author       yyhhenry@foxmail.com
// @match        https://www.bing.com/*
// @match        https://cn.bing.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=bing.com
// @grant        none
// @noframes
// @homepage     https://github.com/yyhhenry/us-bing-trigger
// ==/UserScript==
const c = "www.bing.com",
    a = "cn.bing.com",
    t = "us-bing-trigger";
function s(n) {
    const e = window.location.href;
    return new URL(n || e, e);
}
function r(n) {
    const e = s(n);
    return (
        e.host === a || (e.host === c && e.searchParams.get("mkt") === "zh-CN")
    );
}
function i(n) {
    const e = s(n);
    e.host = c;
    const o = e.searchParams.get("q") || "";
    e.search = "";
    e.searchParams.set("cc", "us");
    e.searchParams.set("q", o);
    e.searchParams.set(t, "");
    return e;
}
function u() {
    return s().searchParams.has(t);
}
function l(n) {
    function f(e) {
        setTimeout(e, n);
    }
    return new Promise(f);
}
