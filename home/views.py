from re import template
from sre_parse import SPECIAL_CHARS
from unicodedata import name
from django.http import HttpRequest, HttpResponseRedirect
from django.shortcuts import render
from django.template import Template
from django.views import View
from django.core.paginator import Paginator
from .models import Pokemon
import requests

# API URL
POKEMON_URL = 'https://pokeapi.co/api/v2/pokemon'
SPECIES_URL = 'https://pokeapi.co/api/v2/pokemon-species/'


class HomeView(View):
    template_name = 'home/home.html'
    model = Pokemon    

    def get(self, request):
        pokemons = Pokemon.objects.all().order_by('name')
        paginator = Paginator(pokemons, 20)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    
        context = {
            'page_obj': page_obj
        }
        return render(request, self.template_name, context)


class PokemonView(View):
    template = 'home/pokemon.html'
    
    def get(self, request, pokemon):
        pokemon_object = Pokemon.objects.get(name=pokemon)
        evolutions_list = pokemon_object.evolutions.replace(" ", "").replace(".", "").lower().split(",")

        context= {
            'name': pokemon_object.name,
            'abilities': pokemon_object.abilities,
            'moves': pokemon_object.moves,
            'types': pokemon_object.types,
            'weight': pokemon_object.weight,
            'height': pokemon_object.height,
            'evolutions': pokemon_object.evolutions,
            'url_image': pokemon_object.url_image,
            'evolutions_list': evolutions_list
        }

        return render(request, self.template, context)
    

class TypesView(View):
    template = 'home/types.html'

    def get(self, request):
        return render(request, self.template,)