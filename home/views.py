from django.shortcuts import render
import requests

# Create your views here.
API_URL = 'https://pokeapi.co/api/v2/'


def index(request):
    response = requests.get(f'{API_URL}/pokemon/1/')
    data = response.json()

    return render(request, 'home/index.html', {
        'url': data['sprites']['other']['home']['front_default']
    })
