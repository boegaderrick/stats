$(document).ready(function () {
    let year = new Date().getFullYear()
    $('footer p').html(`&copy; ${year} STATS`)

    $('.home_link').on('click', () => {
        window.location.href = 'http://localhost:5005/stats/home';
    });

    $('.about').on('click', () => {
        window.location.href = 'http://localhost:5005/stats'
    });

    $('.github').on('click', () => {
        window.open("https://github.com/boegaderrick/stats", "_blank")
    });

    $('.contact').on('click', () => {
        window.open("mailto:boegaderrick@gmail.com", "_blank")
    });
});
