const comment_form = document.getElementById('comment_form');
const comments = document.getElementById('comments');
const comment_message = document.getElementById('comment_message');

function addComment() {
    fetch(comment_form.action, {
        method: 'POST',
        body: new FormData(comment_form),
    }).then(response => {
        let json = response.json()
        if (response.status === 201) {
            json.then(data => {
                console.info(data);
                createTemplateComment(data);

            });
        } else {
            json.then(data => {
                console.info(data);
                createError(data);
            });
        }
    });
}


function createError(data) {
    let errorMessage = document.createElement('ul');
    errorMessage.classList.add('list-group');
    data.forEach(element => {
        let li = document.createElement('li');
        li.classList.add('list-group-item');
        li.innerText = element;
        errorMessage.appendChild(li);
    });
    
    comment_message.classList.add('alert-danger');
    comment_message.classList.remove('alert-success');
    comment_message.innerHTML = errorMessage.innerHTML;
}

function createTemplateComment(comment) {
    let div = document.createElement('div');
    div.classList.add('card');
    div.style.marginBottom = '10px';
    div.innerHTML = `<ul class="list-group list-group-flush">
    <li class="list-group-item">Name: ${comment.name}</li>
    </ul>
    <div class="card-body">
    <p class="card-text">${comment.body}</p>
    </div>`

    comment_message.classList.remove('alert-danger');
    comment_message.classList.add('alert-success');
    comment_message.innerText = 'Comment added successfully.';
    
    comments.appendChild(div);
}
