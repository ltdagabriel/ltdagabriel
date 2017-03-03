$.post('samba/index.php', function (html) {
    //Essa é a função success
    //O parâmetro é o retorno da requisição 
    $('#sambacorpo').html(html);
});