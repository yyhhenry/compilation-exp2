/**
 * 这是一个实际可用的脚本的JavaScript版本，用于测试我们的语法分析器。
 */

// 基本的常量定义和简单字面量
const US_BING_HOST = "www.bing.com";
const CN_BING_HOST = "cn.bing.com";
const MARK_NAME = "us-bing-trigger";
const WAIT_TIME = 2000;

// 基本的函数定义、参数传递和返回值
function resolveURL(url) {
    const here = window.location.href;
    const urlObj = new URL(url ?? here, here); // ?? 运算符；new 运算符
    return urlObj;
}

function isCNBing(url) {
    const urlObj = resolveURL(url);
    return (
        urlObj.host === CN_BING_HOST ||
        (urlObj.host === US_BING_HOST &&
            urlObj.searchParams.get("mkt") === "zh-CN") // 严格相等运算符；成员方法
    );
}

function toUSBingURL(url) {
    const urlObj = resolveURL(url);
    urlObj.host = US_BING_HOST;
    const q = urlObj.searchParams.get("q") ?? "";
    urlObj.search = ""; // 成员赋值

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

// 函数嵌套定义
function asyncSleep(ms) {
    function executor(resolve) {
        setTimeout(resolve, ms);
    }
    return new Promise(executor);
}

// 异步函数
async function removeMark() {
    const urlObj = resolveURL();
    urlObj.searchParams.delete(MARK_NAME);
    const newURL = urlObj.href;
    await asyncSleep(WAIT_TIME); // await 运算符
    window.history.replaceState({}, "", newURL); // 对象字面量，根据上下文决定大括号的含义
}

async function redirectUSBing() {
    // 基本的条件语句
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
    "correct.js", // 复杂数组字面量
    "loaded",
    {
        // 复杂对象字面量，嵌套数组和表达式
        hosts: {
            US_BING_HOST: US_BING_HOST,
            CN_BING_HOST: CN_BING_HOST,
            all: [US_BING_HOST, CN_BING_HOST],
            urls: [
                new URL("https://" + US_BING_HOST),
                new URL("https://" + CN_BING_HOST)
            ]
        },
        MARK_NAME: MARK_NAME,
        WAIT_TIME: WAIT_TIME
    }
]);

function testCommaExpr() {
    let a = (4, 5); // 逗号运算符；let 声明
    /**
     * The comma operator evaluates each of its operands (from left to right) and returns the value of the last operand.
     */
    return 1, 2, 3, a; // 允许在 return 语句中使用逗号运算符
}
