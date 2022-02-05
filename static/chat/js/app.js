let currentRecipient = ''
let chatInput = $('#chat-input')
let chatButton = $('#btn-send')
let userList = $('#user-list')
let messageList = $('#messages')



renderTimestamp = timestamp => {
    let prefix = "";
    const timeDiff = Math.round(
        (new Date().getTime() - new Date(timestamp).getTime()) / 60000
    );
    if (timeDiff < 1) {
        // less than one minute ago
        prefix = "just now...";
    } else if (timeDiff < 60 && timeDiff > 1) {
        // less than sixty minutes ago
        prefix = `${timeDiff} minutes ago`;
    } else if (timeDiff < 24 * 60 && timeDiff > 60) {
        // less than 24 hours ago
        prefix = `${Math.round(timeDiff / 60)} hours ago`;
    } else if (timeDiff < 31 * 24 * 60 && timeDiff > 24 * 60) {
        // less than 7 days ago
        prefix = `${Math.round(timeDiff / (60 * 24))} days ago`;
    } else {
        prefix = `${new Date(timestamp)}`;
    }
    return prefix;
};


function updateUserList() {
    // let id = {{ request.user.profile.id }}
    $.getJSON('/chat/api/v1/user/', function(data) {

        userList.children('.user').remove()
            // for (let i = 0; i < data.length; i++) {
            //   const userItem = `<a class="list-group-item user">${data[i]['name']}</a>`
            //   $(userItem).appendTo('#user-list')
            // }
        for (let i = 0; i < data.length; i++) {
            // data[i]['profile_pic']
            data[i]['friends'].forEach(friend => {
                const userItem = `<a class="list-group-item user" onclick="go();">${friend}</a>`
                $(userItem).appendTo('#user-list')
            });
        }

        $('.user').click(function() {
            userList.children('.active').removeClass('active')
                // document.getElementById("chat-usr").innerHTML = currentRecipient;
            let selected = event.target
            $(selected).addClass('active')
            setCurrentRecipient(selected.text)
        })
    })
}

function drawMessage(message) {
    let position = 'left';

    var user = message.user;
    var namechat = user.substring(0, 3);
    let chatname = namechat.toLocaleUpperCase();
    const date = renderTimestamp(message.timestamp)
    if (message.user === currentUser) {
        position = 'right';
    }


    if (message.classifier == 1) {
        var output = "Please mind your statement";
        var newmessage = `<span style="color:#E81123">${message.body}<span>`;

    } else {
        var output = "No sentiment detected";
        var newmessage = `<span>${message.body}<span>`;
    }
    const messageItem = `
            <li class="message ${position}">
                <div class="avatar">
                    ${chatname}
                </div>
                    <div class="text_wrapper">
                        <div class="text">${newmessage}<br>
                            <span class="small little" style="color: #fff"><i>${date}</i></span><br>
                             
                        </div>
                    </div>
            </li>`
    $(messageItem).appendTo('#messages')
}

function getConversation(recipient) {
    $.getJSON(`/chat/api/v1/message/?target=${recipient}`, function(data) {
        messageList.children('.message').remove()
        for (let i = data['results'].length - 1; i >= 0; i--) {
            drawMessage(data['results'][i])
        }
        messageList.animate({ scrollTop: messageList.prop('scrollHeight') })
    })
}

function getMessageById(message) {
    id = JSON.parse(message).message
    $.getJSON(`/chat/api/v1/message/${id}/`, function(data) {
        if (
            data.user === currentRecipient ||
            (data.recipient === currentRecipient && data.user == currentUser)
        ) {
            drawMessage(data)
        }
        messageList.animate({ scrollTop: messageList.prop('scrollHeight') })
    })
}

function sendMessage(recipient, body) {
    $.post('/chat/api/v1/message/', {
        recipient: recipient,
        body: body,
    }).fail(function() {
        alert('Error! Check console!')
    })
}

function setCurrentRecipient(username) {
    currentRecipient = username
    getConversation(currentRecipient)
    enableInput()
}

function enableInput() {
    chatInput.prop('disabled', false)
    chatButton.prop('disabled', false)
    chatInput.focus()
}

function disableInput() {
    chatInput.prop('disabled', true)
    chatButton.prop('disabled', true)
}


$(document).ready(function() {
    updateUserList()
    disableInput()

    // let socket = new WebSocket(`ws://127.0.0.1:8000/?session_key=${sessionKey}`);
    var socket = new WebSocket(
        'ws://' + window.location.host + '/ws?session_key=${sessionKey}',
    )

    chatInput.keypress(function(e) {
        if (e.keyCode == 13) chatButton.click()
    })

    chatButton.click(function() {
        if (chatInput.val().length > 0) {
            sendMessage(currentRecipient, chatInput.val())
            chatInput.val('')
        }
    })

    socket.onmessage = function(e) {
        getMessageById(e.data)
    }
})