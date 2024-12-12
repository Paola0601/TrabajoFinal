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
        img.addEventListener("mouseleave", () => {
            img.style.transform = "scale(1)";
        });
    });
    const productItems = document.querySelectorAll(".product-item");
    const productDetail = document.querySelector(".product-detail");
    const detailImages = document.querySelector(".detail-images");
    const closeButton = document.querySelector(".close-detail");

    productItems.forEach((item) => {
        item.addEventListener("click", () => {
            const productImages = item.dataset.images.split(",");
            productDetail.style.display = "block";
            detailImages.innerHTML = "";
            productImages.forEach((src, index) => {
                const img = document.createElement("img");
                img.src = src;
                img.alt = `Producto ${index + 1}`;
                img.className = "carousel-image";
                detailImages.appendChild(img);
            });
            setupCarousel();
        });
    });
    closeButton.addEventListener("click", () => {
        productDetail.style.display = "none";
    });
    function setupCarousel() {
        const images = document.querySelectorAll(".carousel-image");
        let currentIndex = 0;
        function showImage(index) {
            images.forEach((img, i) => {
                img.style.display = i === index ? "block" : "none";
            });
        }
        document.querySelector(".prev-btn").addEventListener("click", () => {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            showImage(currentIndex);
        });
        document.querySelector(".next-btn").addEventListener("click", () => {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
        });
        showImage(currentIndex);
    }
});


