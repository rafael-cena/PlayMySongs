function EnviarMusica () {
    const divMensagem = document.getElementById("mensagem");

    const URL_TO_FETCH = 'upload-servlet';

    var formData = new FormData(document.getElementById("form-musicas"));
    document.getElementById('form-musicas').reset();
    fetch(URL_TO_FETCH, { method: 'post', body: formData })
        .then(async response => {
            if (response.ok)
                return response.text();
            throw new Error(await response.text());
        })
        .then(dados=> {
            showToast("ok", dados);
        })
        .catch(error=> {
            showToast("error", error); // Exibir mensagem de erro
            console.error(error);
        });
}

function showToast(type, message) {
    const toast = document.createElement("div");
    toast.classList.add("msg", "show", type);
    toast.textContent = message;

    document.body.appendChild(toast);

    setTimeout(() => {
        toast.classList.remove("show");
        setTimeout(() => toast.remove(), 400);
    }, 3000);
}