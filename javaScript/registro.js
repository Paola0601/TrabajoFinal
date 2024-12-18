document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('form'); // Selecciona tu formulario
    const mensajesDeError = {
        camposVacios: 'Por favor, completa todos los campos.',
        dniInvalido: 'El DNI debe contener solo números y tener 8 dígitos.',
        correoInvalido: 'El correo electrónico no es válido.',
        contrasenaInvalida: 'La contraseña debe tener al menos 8 caracteres, incluir letras y números.',
        contrasenasNoCoinciden: 'Las contraseñas no coinciden.',
    };

    // Función para mostrar errores
    const mostrarError = (mensaje) => {
        alert(mensaje);
    };

    // Validaciones individuales
    const validaciones = {
        nombreC: (valor) => valor.trim() !== '', // No vacío
        dni: (valor) => /^\d{8}$/.test(valor), // Solo números y 8 dígitos
        correo: (valor) => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(valor), // Formato de correo
        contrasena: (valor) => valor.length >= 8 && /[A-Za-z]/.test(valor) && /\d/.test(valor), // 8 caracteres, letras y números
    };

    // Realizamos la validación y se mandará un mensaje si algo no está bien
    form.addEventListener('submit', (event) => {
        const nombre = form.querySelector('input[name="nombre"]').value.trim();
        const dni = form.querySelector('input[name="dni"]').value.trim();
        const correo = form.querySelector('input[name="correo"]').value.trim();
        const contrasena = form.querySelector('input[name="password"]').value.trim();
        const confirmarContrasena = form.querySelector('input[name="confirm-password"]').value.trim();

        // Validamos que el usuario no ingrese campos vacíos
        if (!nombre || !dni || !correo || !contrasena || !confirmarContrasena) {
            event.preventDefault(); // Evita el envío del formulario
            mostrarError(mensajesDeError.camposVacios);
            return;
        }

        // Validamos el dni
        if (!validaciones.dni(dni)) {
            event.preventDefault();
            mostrarError(mensajesDeError.dniInvalido);
            return;
        }

        // Validamos el correo
        if (!validaciones.correo(correo)) {
            event.preventDefault();
            mostrarError(mensajesDeError.correoInvalido);
            return;
        }

        // Validamos la contraseña
        if (!validaciones.contrasena(contrasena)) {
            event.preventDefault();
            mostrarError(mensajesDeError.contrasenaInvalida);
            return;
        }

        // Verificamos que ambas contraseñas sean iguales
        if (contrasena !== confirmarContrasena) {
            event.preventDefault();
            mostrarError(mensajesDeError.contrasenasNoCoinciden);
            return;
        }
    });
});