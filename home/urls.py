
from django.contrib import admin
from django.urls import path

from .views import HomeView, PokemonView

app_name = 'home'

urlpatterns = [
    path('', HomeView.as_view(), name='home'),
    path('<str:pokemon>/', PokemonView.as_view(), name='pokemon')
]