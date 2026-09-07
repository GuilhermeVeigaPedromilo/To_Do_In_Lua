function invoke_task_creation(verify_invoke){
    verify_invoke == true ? 
    window.external.invoke(JSON.stringify({
        action: "task.create",
        data: {
            title: "Minha primeira tarefa",
            description: "Criada pela interface"
        }
    })) : false;
}