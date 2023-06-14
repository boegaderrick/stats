function load_sport (sport) {
    const param = `url(../static/images/sports_bgs/${sport.name.toLowerCase().replace(/ /g, '_')}.jpg)`
    $('#sport').css("background-image", param)
    if (sport.name === 'Formula 1') {
        $('#sport h1').text('FORMULA ONE')
    } else {
        $('#sport h1').text(sport.name.toUpperCase())
    }
};

function load_athletes (sport_name) {
    $('#teams').removeClass('active')
    $('#athletes').addClass('active');
    fetch('http://localhost:5005/stats/api/athletes', {
        method: 'GET',
        headers: {'content-type': 'application/json'},
        /*body: JSON.stringify({})*/
    })
        .then(response => response.json())
        .then(athletes => {
            for (let athlete of athletes) {
                if (athlete.sport.name != sport_name) {
                    continue
                }
                const picture = `../static/images/${athlete.type}s/${athlete.name.toLowerCase().replace(/ /g, '_')}.png`
                const sport_logo = `../static/images/sport_logos/${athlete.sport.name.toLowerCase().replace(/ /g, '_')}.png`
                const team_logo = `../static/images/team_logos/${athlete.team.name.toLowerCase().replace(/ /g, '_')}.png`
                const country_flag = `../static/images/flags/${athlete.country.toLowerCase().replace(/ /g, '_')}.png`
                $('#article').append(`
                <section class="object" data-id="${athlete.id}" data-type="${athlete.type}">
                    <div class="picture" style="background-image: url(${picture})"></div>
                    <h1 class="name">${athlete.name}</h1>
                    <div class="logos">
                        <section class="sport" style="background-image: url(${sport_logo})"></section>
                        <section class="team" style="background-image: url(${team_logo})"></section>
                        <section class="flag" style="background-image: url(${country_flag})"></section>
                    </div>
                </section>`);
            }
        })
        .then(() => {
            $('#article .object').on('click', function () {
                //const name = $(this).find('.name').text()
                const id = $(this).attr('data-id')
                const type = $(this).attr('data-type')
                window.location.href = `http://localhost:5005/stats/athletes/${type}/${id}`
            })
        })
};

function load_teams (sport_name) {
    $('#athletes').removeClass('active')
    $('#teams').addClass('active');
    fetch('http://localhost:5005/stats/api/teams', {
        method: 'GET',
        headers: {'content-type': 'application/json'},
        /*body: JSON.stringify({})*/
    })
        .then(response => response.json())
        .then(teams => {
            for (let team of teams) {
                if (team.sport.name != sport_name) {
                    continue
                }
                const picture = `../static/images/team_pics/${team.name.toLowerCase().replace(/ /g, '_')}.png`
                const sport_logo = `../static/images/sport_logos/${team.sport.name.toLowerCase().replace(/ /g, '_')}.png`
                const team_logo = `../static/images/team_logos/${team.name.toLowerCase().replace(/ /g, '_')}.png`
                const country_flag = `../static/images/flags/${team.country.toLowerCase().replace(/ /g, '_')}.png`
                $('#article').append(`
                <section class="object">
                    <div class="picture" style="background-image: url(${picture})"></div>
                    <h1 class="name">${team.name}</h1>
                    <div class="logos">
                        <section class="sport" style="background-image: url(${sport_logo})"></section>
                        <section class="team" style="background-image: url(${team_logo})"></section>
                        <section class="flag" style="background-image: url(${country_flag})"></section>
                    </div>
                </section>`);
            }
        })
};

$(document).ready(function () {
    let sports
    fetch('http://localhost:5005/stats/api/sports', {
        method: 'GET',
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())
        .then(sports => {
            let i = 0
            load_sport(sports[i])
            load_athletes(sports[i].name)

            $('#arrow_right').on('click', () => {
                i++
                if (i >= sports.length) {
                    i = 0
                }
                load_sport(sports[i])
                $('#article').empty()
                load_athletes(sports[i].name)
            })

            $('#arrow_left').on('click', () => {
                i--
                if (i < 0) {
                    i = sports.length - 1
                }
                load_sport(sports[i])
                $('#article').empty()
                load_athletes(sports[i].name)
            })

            $('#headlines #athletes').on('click', () => {
                $('#article').empty()
                $('#teams').removeClass('active')
                load_athletes(sports[i].name)
            })

            $('#headlines #teams').on('click', () => {
                $('#article').empty()
                $('#athletes').removeClass('active')
                load_teams(sports[i].name)
            })
        })
});
