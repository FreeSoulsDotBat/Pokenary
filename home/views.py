from unicodedata import name
from django.shortcuts import render
from django.views import View
from django.core.paginator import Paginator
from .models import Pokemon
import requests

# API URL
POKEMON_URL = 'https://pokeapi.co/api/v2/pokemon'


class HomeView(View):
    template_name = 'home/home.html'
    model = Pokemon

    def update_db(self):
        quantity = self.get_quantity_of_pokemons()
        if len(Pokemon.objects.all()) < quantity and quantity > 1126:
            response = requests.get(f'{POKEMON_URL}/?offset=0&limit={quantity}')
            data = response.json()

            for pokemon in data['results']:
                if Pokemon.objects.filter(name=pokemon['name']):
                    continue
                else:
                    response_image = requests.get(pokemon['url'])
                    data = response_image.json()
                    image = data['sprites']['other']['home']['front_default']
                    if image:
                        Pokemon.objects.create(name=pokemon['name'],url_image=image)
                    else:
                        if data['sprites']['other']['official-artwork']['front_default']:
                            image_alt = data['sprites']['other']['official-artwork']['front_default']
                            Pokemon.objects.create(name=pokemon['name'], url_image=image_alt)
                        else:
                            continue

            print('Updated')
        else:
            print('Nothing to update')


    def get_quantity_of_pokemons(self):
        response = requests.get(POKEMON_URL)
        data = response.json()
        quantity = data['count']
        return quantity
    

    def get(self, request):
        self.update_db()
        pokemons = Pokemon.objects.all().order_by('name')
        paginator = Paginator(pokemons, 20)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    
        context = {
            'page_obj': page_obj
        }
        return render(request, self.template_name, context)
