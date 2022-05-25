
from django.contrib import admin
from django.urls import path

from .views import FavoritesView, HomeView, PokemonView, SignupView, TypesView

app_name = 'home'

urlpatterns = [
    path('', HomeView.as_view(), name='home'),
    path('types/', TypesView.as_view(), name='types'),
    path('favorites/', FavoritesView.as_view(), name='favorites'),
    path('signup/', SignupView.as_view(), name='signup'),
    path('<str:pokemon>/', PokemonView.as_view(), name='pokemon'),
]