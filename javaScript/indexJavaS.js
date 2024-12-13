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
}

function mostrarProductos(productosMostrar) {
    var container = document.querySelector('.productos');
    container.innerHTML = '<h2>Nuestros Productos</h2>';
    productosMostrar.forEach(function (producto) {
        var card = document.createElement('div');
        card.classList.add('producto');

        var image = document.createElement('img');
        image.src = 'img/' + producto.imagen;
        image.alt = producto.nombre;
        card.appendChild(image);
