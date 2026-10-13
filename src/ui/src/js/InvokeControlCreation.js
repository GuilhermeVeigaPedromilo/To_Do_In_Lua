function invoke_control_creation(newControl) {
    if (!VerifyInvoke()) return;

    window.external.invoke(JSON.stringify({
        action: "control.create",
        data: {
            name: newControl.name,
            description: newControl.description
        }
    }));
}

document.getElementById("create_control_form").addEventListener("submit", (event) => {
    event.preventDefault();

    const newControl = {
        name: document.getElementById("name").value,
        description: document.getElementById("description").value
    };

    invoke_control_creation(newControl);
});