// likes
const likes = document.getElementById('likes');

function updateLikes(link) {
    fetch(link, {
        method: 'PATCH',
    }).then(response => {
        response.text().then(text => {
            if (response.ok) {
                likes.innerHTML = text;
            }else {
                console.log("Likes not updated");
            }
        });
    });
}