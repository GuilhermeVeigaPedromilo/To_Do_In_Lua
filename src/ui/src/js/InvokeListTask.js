function invoke_list_tasks(verify_invoke){
    verify_invoke == true ? 
    window.external.invoke(JSON.stringify({
        action: "task.list",
    })) : false;
}