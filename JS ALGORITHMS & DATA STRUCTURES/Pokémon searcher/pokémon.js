document.getElementById('search-button').addEventListener('click', function() {
    const searchInput = document.getElementById('search-input').value.trim().toLowerCase();
    const pokemonName = document.getElementById('pokemon-name');
    const pokemonId = document.getElementById('pokemon-id');
    const weight = document.getElementById('weight');
    const height = document.getElementById('height');
    const hp = document.getElementById('hp');
    const attack = document.getElementById('attack');
    const defense = document.getElementById('defense');
    const specialAttack = document.getElementById('special-attack');
    const specialDefense = document.getElementById('special-defense');
    const speed = document.getElementById('speed');
    const types = document.getElementById('types');
    const sprite = document.getElementById('sprite');

    // Clear previous content
    pokemonName.innerHTML = '';
    pokemonId.innerHTML = '';
    weight.innerHTML = '';
    height.innerHTML = '';
    hp.innerHTML = '';
    attack.innerHTML = '';
    defense.innerHTML = '';
    specialAttack.innerHTML = '';
    specialDefense.innerHTML = '';
    speed.innerHTML = '';
    types.innerHTML = '';
    sprite.style.display = 'none';

    // Fetch Pokémon data from the API
    fetch(`https://pokeapi.co/api/v2/pokemon/${searchInput}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Pokémon not found');
            }
            return response.json();
        })
        .then(data => {
            // Update UI with Pokémon data
            const pokemonData = data;

            pokemonName.innerHTML = pokemonData.name.toUpperCase();
            pokemonId.innerHTML = `#${pokemonData.id}`;
            weight.innerHTML = `Weight: ${pokemonData.weight}`;
            height.innerHTML = `Height: ${pokemonData.height}`;
            hp.innerHTML = pokemonData.stats[0].base_stat;
            attack.innerHTML = pokemonData.stats[1].base_stat;
            defense.innerHTML = pokemonData.stats[2].base_stat;
            specialAttack.innerHTML = pokemonData.stats[3].base_stat;
            specialDefense.innerHTML = pokemonData.stats[4].base_stat;
            speed.innerHTML = pokemonData.stats[5].base_stat;

            // Display types
            pokemonData.types.forEach(type => {
                const typeElement = document.createElement('span');
                typeElement.classList.add('type');
                typeElement.innerHTML = type.type.name.toUpperCase();
                types.appendChild(typeElement);
            });

            // Display sprite
            sprite.style.display = 'block';
            sprite.src = pokemonData.sprites.front_default;
        })
        .catch(error => {
            // Show alert if Pokémon is not found
            alert(error.message);
        });
});