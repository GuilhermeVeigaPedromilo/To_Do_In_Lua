function VerifyInvoke() {
    if (window.external && window.external.invoke) {
        return true;
    } else {
        console.log("API is inative, because 'window.external.invoke' isn't available")
        return false;
    }
}