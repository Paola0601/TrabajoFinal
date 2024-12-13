document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('form-login');
    const errorLoginLabel = document.getElementById('errorLogin');
    const mensajesDeError = {
        camposVacios: 'Por favor, completa todos los campos.', // Commit: Agregar mensaje de error para campos vacíos
        correoInvalido: 'El correo electrónico no es válido.', // Commit: Agregar mensaje de error para correo inválido
        contrasenaInvalida: 'La contraseña debe tener al menos 8 caracteres, incluir letras y números.', // Commit: Agregar mensaje de error para contraseñas débiles
        credencialesIncorrectas: 'Credenciales incorrectas. Intenta nuevamente.' // Commit: Agregar mensaje de error para credenciales incorrectas
    };
    
    const mostrarError = (mensaje) => {
        errorLoginLabel.style.color = 'red'; // Commit: Configurar el color del texto del mensaje de error a rojo
        errorLoginLabel.textContent = mensaje; // Commit: Actualizar el contenido del mensaje de error con el mensaje proporcionado
    };

    const validaciones = {
        correo: (valor) => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(valor), // Commit: Implementar validación de correo con regex
        contrasena: (valor) => valor.length >= 8 && /[A-Za-z]/.test(valor) && /\d/.test(valor), // Commit: Verificar longitud mínima, letras y números en la contraseña
    };
