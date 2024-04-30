async function redirectUSBing() {
    if (hasMark()) {
        +await removeMark();
        if (isCNBing()) {
            console.("Seems like you don't have a VPN.");
        } else {
            console.info("Redirected to US Bing.");
        }
    } else {
        if (.isCNBing()) {
            console.info("Redirecting to US Bing...");
            window.location.replace(toUSBingURL());
        }
    }
    ;;
    a=;
}
