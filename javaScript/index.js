var productos = []; // Almacenar los productos de la farmacia

// Función para cargar los productos usando AJAX
function cargarProductos() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '../cgi-bin/productos.pl', true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            productos = JSON.parse(xhr.responseText);
            mostrarProductos(productos);
        }
    };
    xhr.send();
}

// Función para mostrar los productos
function mostrarProductos(productosMostrar) {
    var container = document.getElementById('productos');
    if (!container) {
        console.error('El contenedor con id "productos" no se encontró.');
        return;
    }

    container.innerHTML = ''; // Limpiar los productos actuales

    productosMostrar.forEach(function (producto) {
        // Validar las propiedades del producto
        if (!producto || !producto.nombre || !producto.precio || !producto.imagen) {
            console.warn('Producto inválido:', producto);
            return;
        }

        // Crear la tarjeta del producto
        var card = document.createElement('div');
        card.classList.add('product-card');

        // Imagen del producto
        var image = document.createElement('img');
        image.src = '/Imagenes/' + producto.imagen;
        image.alt = producto.nombre;
        image.classList.add('product-image');
        card.appendChild(image);

        // Título del producto
        var title = document.createElement('h2');
        title.textContent = producto.nombre;
        title.classList.add('product-title');
        card.appendChild(title);

        // Precio del producto
        var price = document.createElement('p');
        price.textContent = 'Precio: S/ ' + producto.precio;
        price.classList.add('product-price');
        card.appendChild(price);

        // Botón "Añadir"
        var button = document.createElement('button');
        button.classList.add('add-to-cart');
        button.innerHTML = '<img src="../images/carrito.png" alt="Carrito" class="cart-icon"> Añadir';
        button.setAttribute('aria-label', 'Añadir ' + producto.nombre + ' al carrito');
        button.addEventListener('click', function () {
            console.log('Producto añadido:', producto.nombre);
        });
        card.appendChild(button);

        // Añadir la tarjeta al contenedor
        container.appendChild(card);
    });
}

// Función para filtrar los productos por el nombre
function buscarProductos() {
    var query = document.getElementById('search-input').value.toLowerCase();
    var productosFiltrados = productos.filter(function (producto) {
        return producto.nombre.toLowerCase().includes(query);
    });
    mostrarProductos(productosFiltrados);
}

// Función para verificar si el usuario está logueado
function verificarUsuario() {
    var nombreUsuario = getCookie('nombre_usuario'); // Obtener el nombre del usuario desde las cookies
    var loginButton = document.getElementById('login-button');

    if (nombreUsuario) {
        if (loginButton) {
            loginButton.innerHTML = '<button id="user-button" onclick="toggleMenu()">' + nombreUsuario + '</button>';
            document.getElementById('logout-menu').style.display = 'none'; // Iniciar con el menú oculto
        }
        var nombreUsuarioSpan = document.getElementById('nombre-usuario');
        if (nombreUsuarioSpan) {
            nombreUsuarioSpan.textContent = nombreUsuario;
        }
    } else {
        if (loginButton) {
            loginButton.innerHTML = '<button onclick="window.location.href=\'../html/login.html\'">Login</button>';
        }
    }
}

// Función para mostrar/ocultar el menú desplegable
function toggleMenu() {
    var menu = document.getElementById('logout-menu');
    menu.style.display = (menu.style.display === 'none' || menu.style.display === '') ? 'block' : 'none';
}

// Función para cerrar sesión
function cerrarSesion() {
    document.cookie = 'nombre_usuario=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
    window.location.href = '../index.html'; // Redirigir al inicio
}

// Función para obtener el valor de una cookie
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
}

// Llamar a la función cargarProductos cuando la página se haya cargado
window.onload = function () {
    var path = window.location.pathname;
    if (path.includes('bienvenida.html')) {
        var nombreUsuario = getCookie('nombre_usuario');
        if (nombreUsuario) {
            document.getElementById('nombre-usuario').textContent = nombreUsuario;
            cargarProductos();
        } else {
            window.location.href = '../html/login.html'; // Redirigir al login si no hay usuario
        }
    } else {
        cargarProductos();
        verificarUsuario(); // Verificar si el usuario está logueado
    }
};