function Login () {
    const URL_TO_FETCH = 'login-servlet';
    var formData = new FormData(document.getElementById("form-log"));

     fetch(URL_TO_FETCH, { method: 'post',body: formData })
         .then(response=> {return response.text();})
         .then(dados=> { alert(dados) })
         .catch(error=> alert(error));

    alert("ja podi al-mossar!");
}