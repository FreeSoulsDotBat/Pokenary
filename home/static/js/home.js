const setImage = (event) => {
    let pokemon = document.getElementById(`container__image-${event.target.attributes.name.value}`)
    let who = document.getElementById(`container__who-is-this-pokemon`)
    let see = document.getElementById(`container__hover-to-see`)
    let details = document.getElementById(`container__details`)
    who.style.display = 'none'
    see.style.display = 'none'
    details.style.display = 'block'
    pokemon.style.display = 'block'
}

const toggleImage = (pokemonName) => {
    let pokemonsToHide = document.querySelectorAll('div.container__box-pokemon')
    for (let item of pokemonsToHide) {
        item.style.display = 'none'
    }

    let pokemonBox = document.getElementById(`container__box-pokemon-${pokemonName}`);
    let who = document.getElementById(`container__who-is-this-pokemon`);
    let see = document.getElementById(`container__hover-to-see`);

    who.style.display = 'none';
    see.style.display = 'none';
    pokemonBox.style.display = 'flex';
}

const removeImage = (event) => {
    let pokemon = document.getElementById(`container__image-${event.target.attributes.name.value}`)
    let who = document.getElementById(`container__who-is-this-pokemon`)
    let see = document.getElementById(`container__hover-to-see`)
    let details = document.getElementById(`container__details`)
    who.style.display = 'block'
    see.style.display = 'block'
    details.style.display = 'none'
    pokemon.style.display = 'none'
}