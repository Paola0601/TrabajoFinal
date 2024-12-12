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