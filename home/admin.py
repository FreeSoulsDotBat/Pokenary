from django.contrib import admin
from django.contrib.admin import AdminSite
from django.contrib.auth.models import Group, User
from django.contrib.auth.admin import UserAdmin, GroupAdmin
from django.http import HttpResponseRedirect
from django.urls import path
import requests
from .models import Pokemon

POKEMON_URL = 'https://pokeapi.co/api/v2/pokemon'
SPECIES_URL = 'https://pokeapi.co/api/v2/pokemon-species/'

# Register your models here.)
class PokemonAdmin(admin.ModelAdmin):
    change_list_template = 'admin/new_change_list.html'
    list_display = ("name", "url_image", "evolutions")


class MyUserAdmin(UserAdmin):
    list_display = ['username', 'is_active', 'is_staff', 'is_superuser']
    list_filter = ['groups']

class MyGroupAdmin(GroupAdmin):
    list_display = ['name']


class MyAdminSite(AdminSite):

    def get_urls(self):
        urls = super().get_urls()
        my_urls = [
            path('update_db', self.admin_view(self.update_db, cacheable=False), name='update_db'),
        ]
        return my_urls + urls

    
    def update_db(self, request):
        response = requests.get(f'{POKEMON_URL}/?offset=0&limit={self.get_quantity_of_pokemons()}')
        data = response.json()

        for pokemon in data['results']:
            if Pokemon.objects.filter(name=pokemon['name']):
                continue
            else:
                response_to_update = requests.get(pokemon['url'])
                data_to_update = response_to_update.json()
                image = data_to_update['sprites']['other']['home']['front_default']
                if image:
                    Pokemon.objects.create(name=pokemon['name'],url_image=image, id=data_to_update['id'])
                    print(f"Created Pokemon: {pokemon['name']}")
                else:
                    if data_to_update['sprites']['other']['official-artwork']['front_default']:
                        image_alt = data_to_update['sprites']['other']['official-artwork']['front_default']
                        Pokemon.objects.create(name=pokemon['name'], url_image=image_alt)
                        print(f"Created Pokemon: {pokemon['name']}")

        for pokemon in Pokemon.objects.all():
            if (not pokemon.abilities 
            or not pokemon.moves 
            or not pokemon.types 
            or not pokemon.weight 
            or not pokemon.height):
                self.set_characteristics(pokemon.name)
            else:
                continue

            if not pokemon.evolutions:
                self.set_evolutions(pokemon.id)
            else:
                continue
        
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

    
    def get_quantity_of_pokemons(self):
        response = requests.get(POKEMON_URL)
        data = response.json()
        quantity = data['count']
        return quantity
    

    def set_evolutions(self, id):
        evolutions = []

        if requests.get(f"{SPECIES_URL}/{id}"):
            response = requests.get(f"{SPECIES_URL}/{id}")
            data = response.json()
            response_evolution = requests.get(data['evolution_chain']['url'])
            data_evolution = response_evolution.json()
        else:
            return

        evolutions.append(data_evolution['chain']['species']['name'])
        if data_evolution['chain']['evolves_to']:
            for entry in data_evolution['chain']['evolves_to']:
                evolutions.append(entry['species']['name'])
                if entry['evolves_to']:
                    for entry2 in entry['evolves_to']:
                        evolutions.append(entry2['species']['name'])
                        if entry2['evolves_to']:
                            for entry3 in entry2['evolves_to']:
                                evolutions.append(entry3['species']['name'])
                        else:
                            break
                else:
                    break
        else:
            pass

        evolutions_treated = []
        for evolution in evolutions:
            if evolution == evolutions[-1]:
                if len(evolutions) > 1:
                    evolutions_treated.append(f"{evolution}.")
                else:
                    evolutions_treated.append(f"{evolution.capitalize()}.")
            elif evolution == evolutions[0]:
                evolutions_treated.append(f"{evolution.capitalize()}, ")
            else:
                evolutions_treated.append(f"{evolution}, ")
        
        evolutions_string = ''.join(evolutions_treated)
        if evolutions_string == Pokemon.objects.get(id=id).evolutions:
            pass
        else:
            Pokemon.objects.filter(id=id).update(evolutions=evolutions_string)


    def set_characteristics(self, pokemon):
        characteristics = {}

        if requests.get(f"{POKEMON_URL}/{pokemon}"):
            response = requests.get(f"{POKEMON_URL}/{pokemon}")
            data = response.json()
        else:
            return
        
        characteristics['abilities'] = []
        for ability in data['abilities']:
            if ability == data['abilities'][-1]:
                if len(data['abilities']) > 1:
                    characteristics['abilities'].append(f"{ability['ability']['name']}.")
                else:
                    characteristics['abilities'].append(f"{ability['ability']['name'].capitalize()}.")
            elif ability == data['abilities'][0]:
                characteristics['abilities'].append(f"{ability['ability']['name'].capitalize()}, ")
            else:
                characteristics['abilities'].append(f"{ability['ability']['name']}, ")

        abilities_filtered = ''.join(characteristics['abilities'])
        if abilities_filtered == Pokemon.objects.get(name=pokemon).abilities:
            pass
        else:
            Pokemon.objects.filter(name=pokemon).update(abilities=abilities_filtered)
        

        characteristics['moves'] = []  
        for move in data['moves']:
            if move == data['moves'][-1]:
                if len(data['moves']) > 1:
                    characteristics['moves'].append(f"{move['move']['name']}.")
                else:
                    characteristics['moves'].append(f"{move['move']['name'].capitalize()}.")
            elif move == data['moves'][0]:
                characteristics['moves'].append(f"{move['move']['name'].capitalize()}, ")
            else:
                characteristics['moves'].append(f"{move['move']['name']}, ")

        moves_filtered = ''.join(characteristics['moves'])
        if moves_filtered == Pokemon.objects.get(name=pokemon).moves:
            pass
        else:
            Pokemon.objects.filter(name=pokemon).update(moves=moves_filtered)


        characteristics['types'] = []  
        for type_of_pokemon in data['types']:
            if type_of_pokemon == data['types'][-1]:
                if len(data['types']) > 1:
                    characteristics['types'].append(f"{type_of_pokemon['type']['name']}.")
                else:
                    characteristics['types'].append(f"{type_of_pokemon['type']['name'].capitalize()}.")
            elif type_of_pokemon == data['types'][0]:
                characteristics['types'].append(f"{type_of_pokemon['type']['name'].capitalize()}, ")
            else:
                characteristics['types'].append(f"{type_of_pokemon['type']['name']}, ")

        types_filtered = ''.join(characteristics['types'])
        if types_filtered == Pokemon.objects.get(name=pokemon).types:
            pass
        else:
            Pokemon.objects.filter(name=pokemon).update(types=types_filtered)


        characteristics['weight'] = data['weight']
        if characteristics['weight'] == Pokemon.objects.get(name=pokemon).weight:
            pass
        else:
            Pokemon.objects.filter(name=pokemon).update(weight=characteristics['weight'])


        characteristics['height'] = data['height']
        if characteristics['height'] == Pokemon.objects.get(name=pokemon).height:
            pass
        else:
            Pokemon.objects.filter(name=pokemon).update(height=characteristics['height'])

        return


admin_site = MyAdminSite(name='admin')
admin_site.register(Pokemon, PokemonAdmin)
admin_site.register(Group, MyGroupAdmin)
admin_site.register(User, MyUserAdmin)