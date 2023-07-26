const likes = document.getElementById('likes');

function updateLikes(href_patch) {
    console.log(href_patch);
    fetch(href_patch, {
        method: 'PATCH',
    }).then(response => {
        response.text().then(text => {
            switch (response.status) {
                case 200:
                    likes.innerHTML = text;
                    break;

                case 403, 422:
                    likes.innerHTML = 'Error';
                    break;
            }
        });
    });
}