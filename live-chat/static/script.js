document.addEventListener('DOMContentLoaded', () => {
    const messages = document.getElementById('messages');
    const messageInput = document.getElementById('message-input');
    const sendButton = document.getElementById('send-button');

    // Generate a simple client ID
    const clientId = Math.random().toString(36).substr(2, 9);

    const ws = new WebSocket(`ws://127.0.0.1:8000/ws/${clientId}`);

    ws.onmessage = (event) => {
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message');

        const messageContent = event.data;

        if (messageContent.startsWith(`User-${clientId}:`)) {
            messageDiv.classList.add('user');
            messageDiv.textContent = messageContent.substring(messageContent.indexOf(':') + 2);
        } else if (messageContent.includes('joined') || messageContent.includes('left')) {
            messageDiv.classList.add('system');
            messageDiv.textContent = messageContent;
        } else {
            messageDiv.classList.add('other');
            messageDiv.textContent = messageContent;
        }

        messages.appendChild(messageDiv);
        messages.scrollTop = messages.scrollHeight; // Auto-scroll to the bottom
    };

    const sendMessage = () => {
        const message = messageInput.value.trim();
        if (message && ws.readyState === WebSocket.OPEN) {
            ws.send(message);
            messageInput.value = '';
        }
    };

    sendButton.addEventListener('click', sendMessage);
    messageInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });
});
