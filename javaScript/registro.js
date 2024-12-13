document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('form-login');
    const errorLoginLabel = document.getElementById('errorLogin');
    const mensajesDeError = {
        camposVacios: 'Por favor, completa todos los campos.',
        correoInvalido: 'El correo electrónico no es válido.', 
        contrasenaInvalida: 'La contraseña debe tener al menos 8 caracteres, incluir letras y números.',
        credencialesIncorrectas: 'Credenciales incorrectas. Intenta nuevamente.'
    };

    const mostrarError = (mensaje) => {
        errorLoginLabel.style.color = 'red';
        errorLoginLabel.textContent = mensaje;
    };

    const validaciones = {
        correo: (valor) => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(valor),
        contrasena: (valor) => valor.length >= 8 && /[A-Za-z]/.test(valor) && /\d/.test(valor),
    };

    (() => {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('error') === '1') {
            mostrarError(mensajesDeError.credencialesIncorrectas);
        }
    })();

    form.addEventListener('submit', (event) => {
        const correo = form.querySelector('input[name="correo"]').value.trim();
        const contrasena = form.querySelector('input[name="password"]').value.trim();

        if (!correo || !contrasena) {
            event.preventDefault();
            mostrarError(mensajesDeError.camposVacios);
        } 
        else if (!validaciones.correo(correo)) {
            event.preventDefault();
            mostrarError(mensajesDeError.correoInvalido);
        } 
        else if (!validaciones.contrasena(contrasena)) {
            event.preventDefault();
            mostrarError(mensajesDeError.contrasenaInvalida);
        }
    });
});