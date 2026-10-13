function VerifyInvoke() {
    if (window.external && window.external.invoke) {
        return true;
    }
    console.log("API is inactive: 'window.external.invoke' isn't available");
    return false;
}