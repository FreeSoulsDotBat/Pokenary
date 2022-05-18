const setImage = (event) => {
    let pokemon = document.getElementById(`container__image-${event.target.attributes.name.value}`)
    let who = document.getElementById(`container__who-is-this-pokemon`)
    let see = document.getElementById(`container__hover-to-see`)
    who.style.display = 'none'
    see.style.display = 'none'
    pokemon.style.display = 'block'
}

const removeImage = (event) => {
    let pokemon = document.getElementById(`container__image-${event.target.attributes.name.value}`)
    let who = document.getElementById(`container__who-is-this-pokemon`)
    let see = document.getElementById(`container__hover-to-see`)
    who.style.display = 'block'
    see.style.display = 'block'
    pokemon.style.display = 'none'
}