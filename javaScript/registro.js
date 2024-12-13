document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('form-login');
    const errorLoginLabel = document.getElementById('errorLogin');
    const mensajesDeError = {
        camposVacios: 'Por favor, completa todos los campos.', // Commit: Agregar mensaje de error para campos vacíos
        correoInvalido: 'El correo electrónico no es válido.', // Commit: Agregar mensaje de error para correo inválido
        contrasenaInvalida: 'La contraseña debe tener al menos 8 caracteres, incluir letras y números.', // Commit: Agregar mensaje de error para contraseñas débiles
        credencialesIncorrectas: 'Credenciales incorrectas. Intenta nuevamente.' // Commit: Agregar mensaje de error para credenciales incorrectas
    };
    