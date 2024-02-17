document.addEventListener("DOMContentLoaded", function () {
    const courseImages = document.querySelectorAll('.table-image');
    courseImages.forEach(function (image) {
        image.addEventListener('click', function () {
            document.querySelector('.registration-form').style.right = '0';
        });
    });

    document.getElementById('close-form').addEventListener('click', function () {
        document.querySelector('.registration-form').style.right = '-100%';
    });

    const faqQuestions = document.querySelectorAll('.faq-question');
    faqQuestions.forEach(question => {
        question.addEventListener('click', function () {
            const parent = this.parentElement;
            parent.classList.toggle('active');
        });
    });
});
