document.addEventListener("DOMContentLoaded", () => {
    const navBar = document.querySelector(".navbar");
    window.addEventListener("scroll", () => {
        if (window.scrollY > 50) {
            navBar.style.padding = "10px 50px";
        } else {
            navBar.style.padding = "20px 50px";
        }
    });
    const images = document.querySelectorAll(".img-container img");
    images.forEach((img) => {
        img.style.transition = "transform 0.3s ease";
        img.addEventListener("mouseenter", () => {
            img.style.transform = "scale(1.1)";
        });