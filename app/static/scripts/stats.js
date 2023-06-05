$().ready( function () {
    fetch('http://localhost:5000/api/stats/athletes', {
        method: 'GET',
        headers: {'content-type': 'application/json'},
        /*body: JSON.stringify({})*/   
    })
        .then(response => response.json())
        .then(athletes => {
            for (athlete of athletes) {
                const pic = `static/images/${athlete.name.toLowerCase().replace(' ', '_')}.png`
                const sport = `static/images/sport_logos/${athlete.country.name.toLowerCase().replace(' ', '_')}.png`
                const country = `static`
                $('#article').append(`
                <section class="object">
                    <div class="picture" style="background-image: url(${pic})"></div>
                    <h1 class="name">${athlete.name}</h1>
                    <div class="logos">
                        <section class="sport"></section>
                        <section class="team"></section>
                        <section class="flag"></section>
                    </div>
                </section>`);
            }
        })
});