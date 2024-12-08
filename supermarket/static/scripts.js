document.querySelectorAll("button").forEach(button => {
    button.addEventListener("click", () => {
        button.classList.add("button-clicked");
        setTimeout(() => button.classList.remove("button-clicked"), 200);
    });
});

function showMessage(message, type = "success") {
    const container = document.querySelector(".container");
    const messageBox = document.createElement("div");
    messageBox.className = `message-box ${type}`;
    messageBox.textContent = message;

    container.insertBefore(messageBox, container.firstChild);

    setTimeout(() => {
        messageBox.remove();
    }, 3000);
}