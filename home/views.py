from unicodedata import name
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import CreateView
from django.core.paginator import Paginator
from .models import Favorites, Pokemon
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.forms import UserCreationForm

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
        return render(request, self.template)


class FavoritesView(LoginRequiredMixin, View):
    template = 'home/favorites.html'

    def post(self, request):
        data = request.POST
        data_dict = {
            'user': data['user'],
            'pokemon': data['pokemon']
        }
        user_model = User.objects.get(username=data_dict['user'])
        pokemon_model = Pokemon.objects.get(name=data_dict['pokemon'])
        
        Favorites.objects.get_or_create(pokemon=pokemon_model, user=user_model)

        context = {
            'data': Favorites.objects.filter(user=user_model)
        }

        return render(request, self.template, context)
    
    def get(self, request):
        context = {
            'data': Favorites.objects.filter(user=request.user)
        }

        return render(request, self.template, context)


class SignupView(CreateView):
    form_class = UserCreationForm
    success_url = reverse_lazy('login')
    template_name = 'home/signup.html'