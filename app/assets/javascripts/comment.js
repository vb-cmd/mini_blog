const comment_form = document.getElementById('comment_form');
const comments = document.getElementById('comments');
const comment_message = document.getElementById('comment_message');

function addComment() {
    fetch(comment_form.action, {
        method: 'POST',
        body: new FormData(comment_form),
    }).then(response => {
        response.text().then(text => {

            switch (response.status) {
                case 201:
                    createTemplateComment(text);;
                    break;

                case 403, 422:
                    createError(text);
                    break;
            }
        });
    });
}


function createError(errors_body) {
    comment_message.classList.add('alert-danger');
    comment_message.innerHTML = errors_body;
}

function createTemplateComment(comment_body) {
    let div = document.createElement('div');
    div.innerHTML = comment_body

    comment_message.classList.remove('alert-danger');
    comment_message.innerHTML = '';

    comments.appendChild(div);
}
