var productos =[];

function cargarProductos() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/cgi-bin/recuperarproductos.pl', true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            productos = JSON.parse(xhr.responseText);
            mostrarProductos(productos);
        }
    };
    xhr.send();