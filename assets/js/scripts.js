// Create an intersection observer to detect when the image comes into view
const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        const squareIndicator = document.getElementById('square-indicator');
        
        // If the image is in view, add the visible class to the square
        if (entry.isIntersecting) {
            squareIndicator.classList.add('visible');
        } else {
            squareIndicator.classList.remove('visible');
        }
    });
}, { threshold: 0.5 }); // Trigger when 50% of the image is visible

// Select all the images you want to observe
const images = document.querySelectorAll('.observable-image');
images.forEach(image => {
    observer.observe(image);
});
