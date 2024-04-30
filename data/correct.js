const US_BING_HOST = "www.bing.com";
const CN_BING_HOST = "cn.bing.com";
const MARK_NAME = "us-bing-trigger";
const WAIT_TIME = 2000;

function resolveURL(url) {
    const here = window.location.href;
    const urlObj = new URL(url ?? here, here);
    return urlObj;
}

function isCNBing(url) {
    const urlObj = resolveURL(url);
    return (
        urlObj.host === CN_BING_HOST ||
        (urlObj.host === US_BING_HOST &&
            urlObj.searchParams.get("mkt") === "zh-CN")
    );
}

function toUSBingURL(url) {
    const urlObj = resolveURL(url);
    urlObj.host = US_BING_HOST;
    const q = urlObj.searchParams.get("q") ?? "";
    urlObj.search = "";

    // Set cc=us to avoid redirecting to local Bing
    urlObj.searchParams.set("cc", "us");
    // Restore the search query
    urlObj.searchParams.set("q", q);
    // Add `trigger-from` mark to avoid redirecting again
    urlObj.searchParams.set(MARK_NAME, "");

    return urlObj;
}

function hasMark() {
    const urlObj = resolveURL();
    return urlObj.searchParams.has(MARK_NAME);
}

function asyncSleep(ms) {
    function executor(resolve) {
        setTimeout(resolve, ms);
    }
    return new Promise(executor);
}

async function removeMark() {
    const urlObj = resolveURL();
    urlObj.searchParams.delete(MARK_NAME);
    const newURL = urlObj.href;
    await asyncSleep(WAIT_TIME);
    window.history.replaceState({}, "", newURL);
}

async function redirectUSBing() {
    if (hasMark()) {
        await removeMark();
        if (isCNBing()) {
            console.info("Seems like you don't have a VPN.");
        } else {
            console.info("Redirected to US Bing.");
        }
    } else {
        if (isCNBing()) {
            console.info("Redirecting to US Bing...");
            window.location.replace(toUSBingURL());
        }
    }
}

redirectUSBing();

console.log([
    "correct.js",
    "loaded",
    {
        US_BING_HOST: US_BING_HOST,
        CN_BING_HOST: CN_BING_HOST,
        MARK_NAME: MARK_NAME,
        WAIT_TIME: WAIT_TIME
    }
]);

function testCommaExpr() {
    let a = (4, 5);
    /**
     * The comma operator evaluates each of its operands (from left to right) and returns the value of the last operand.
     */
    return 1, 2, 3;
}
