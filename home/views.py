from re import template
from sre_parse import SPECIAL_CHARS
from unicodedata import name
from django.http import HttpRequest, HttpResponseRedirect
from django.shortcuts import render
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

        return render(request, self.template, {})