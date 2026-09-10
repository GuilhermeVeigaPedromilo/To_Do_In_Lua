function invoke_select_all_tasks(verify_invoke){
    verify_invoke == true ? 
    window.external.invoke(JSON.stringify({
        action: "task.selectAll",
    })) : false;
}