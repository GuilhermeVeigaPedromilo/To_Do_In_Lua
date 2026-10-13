function handleResponse(res) {
    if (res.message) {
        
        return res.message;
    } else {
        console.warn("No handler for action:", res.action, res);
    }
}