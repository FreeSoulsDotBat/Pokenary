from django.shortcuts import render
from django.views import View
from django.core.paginator import Paginator
from .models import Pokemon
import requests

# API URL
POKEMON_URL = 'https://pokeapi.co/api/v2/pokemon'


class HomeView(View):
    template_name = 'home/home.html'

    def update_db(self):
        quantity = self.get_quantity_of_pokemons()
        response = requests.get(f'{POKEMON_URL}/?offset=0&limit={quantity}')
        data = response.json()
        pokemons = []
        for pokemon in data['results']:
            response_url = requests.get(pokemon['url'])
            data_url = response_url.json()
            pokemons.append({'name': pokemon['name'], 
            'image_url': data_url['sprites']['other']['home']['front_default']})
        
        



    def get_name_pokemons_per_page(self, quantity):
        response = requests.get(
            f'{POKEMON_URL}/?offset=0&limit={quantity}')
        data = response.json()
        pokemons = []
        for result in data['results']:
            pokemons.append({'name': result['name']})
        
        return pokemons

    def get_quantity_of_pokemons(self):
        response = requests.get(POKEMON_URL)
        data = response.json()
        quantity = data['count']
        return quantity
    

    def get(self, request):
        self.update_db()
        quantity = self.get_quantity_of_pokemons()
        pokemons = self.get_name_pokemons_per_page(quantity)
        paginator = Paginator(pokemons, 20)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    
        context = {
            'page_obj': page_obj
        }
        return render(request, self.template_name, context)
