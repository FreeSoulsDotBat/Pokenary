const setImage = (event) => {
    console.log(event.target.attributes.name.value)
    let pokemon = document.getElementById(`container__image-${event.target.attributes.name.value}`)
    let who = document.getElementById(`container__who-is-this-pokemon`)
    who.style.display = 'none'
    pokemon.style.display = 'block'
}

const removeImage = (event) => {
    let pokemon = document.getElementById(`container__image-${event.target.attributes.name.value}`)
    let who = document.getElementById(`container__who-is-this-pokemon`)
    who.style.display = 'block'
    pokemon.style.display = 'none'
}