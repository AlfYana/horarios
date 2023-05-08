let zinc = document.getElementById('sincronizar');
let data;
zinc.addEventListener('click', even => {
    fetch('/horarios/server/getpersonal.php', {
        method: 'GET',
        body: data, 
    })
    .then(response=> {
        console.log(response.json());
    })
    .catch(err => console.error("error"));
});