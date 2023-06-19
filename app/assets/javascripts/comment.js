const comment_form = document.getElementById('comment_form');
const comment_message = document.getElementById('comment_message');

function addComment() {
    fetch(comment_form.action, {
        method: 'POST',
        body: new FormData(comment_form),
    }).then(response => {
        response.text().then(text => {

            switch (response.status) {
                case 201:
                    createCommentCreated(text);;
                    break;

                case 403, 422:
                    createError(text);
                    break;
            }
        });
    });
}


function createError(body) {
    comment_message.innerHTML = '';
    comment_message.classList.remove('alert-success');
    
    comment_message.classList.add('alert-danger');
    comment_message.innerHTML = body;
}

function createCommentCreated(body) {
    comment_message.innerHTML = '';
    comment_message.classList.remove('alert-danger');

    comment_message.classList.add('alert-success');
    comment_message.innerHTML = body;

    comment_form.reset();
}
