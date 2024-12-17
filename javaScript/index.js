var productos = []; // Almacenar los productos de la farmacia

// Función para cargar los libros usando AJAX usa productos.pl
function cargarLibros() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../cgi-bin/productos.pl', true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            libros = JSON.parse(xhr.responseText);
            mostrarLibros(libros);
        }
    };
    xhr.send();
}

// Función para mostrar los productos
function mostrarProductos(productosMostrar) {
    var container = document.getElementById('productos');
    container.innerHTML = ''; // Limpiar los productos actuales

    productosMostrar.forEach(function (producto) {
        var card = document.createElement('div');
        card.classList.add('book-card');

        var image = document.createElement('img');
        image.src = '/images/' + producto.imagen;
        image.alt = producto.nombre;
        image.classList.add('book-image');
        card.appendChild(image);

        var title = document.createElement('h2');
        title.textContent = producto.nombre;
        title.classList.add('book-title');
        card.appendChild(title);

        var price = document.createElement('p');
        price.textContent = 'Precio: S/ ' + producto.precio;
        price.classList.add('book-price');
        card.appendChild(price);

        var button = document.createElement('button');
        button.classList.add('add-to-cart');
        button.innerHTML = '<img src="../images/carrito.png" alt="Carrito" class="cart-icon"> Añadir';
        card.appendChild(button);

        container.appendChild(card);
    });
}

// Función para filtrar los productos por el nombre
function buscarProductos() {
    var query = document.getElementById('search-input').value.toLowerCase();
    var productosFiltrados = libros.filter(function (libro) {
        return libro.nombre.toLowerCase().includes(query);
    });
    mostrarProductos(productosFiltrados);
}

// Función para verificar si el usuario está logueado
function verificarUsuario() {
    var nombreUsuario = localStorage.getItem('nombre_usuario'); // Suponiendo que guardas el nombre del usuario en localStorage
    var loginButton = document.getElementById('login-button');

    if (nombreUsuario) {
        loginButton.innerHTML = '<button id="user-button" onclick="toggleMenu()">' + nombreUsuario + '</button>';
        document.getElementById('logout-menu').style.display = 'none'; // Iniciar con el menú oculto
    } else {
        loginButton.innerHTML = '<button onclick="window.location.href=\'../login.html\'">Login</button>';
    }
}

// Función para mostrar/ocultar el menú desplegable
function toggleMenu() {
    var menu = document.getElementById('logout-menu');
    menu.style.display = (menu.style.display === 'none' || menu.style.display === '') ? 'block' : 'none';
}

// Función para cerrar sesión
function cerrarSesion() {
    localStorage.removeItem('nombre_usuario');
    window.location.href = '../index.html'; // Redirigir al inicio
}

// Llamar a la función cargarLibros cuando la página se haya cargado
window.onload = function () {
    cargarLibros();
    verificarUsuario(); // Verificar si el usuario está logueado
};
