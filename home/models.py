from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator

class Pokemon(models.Model):
    name = models.CharField(max_length=30)
    url_image = models.CharField(max_length=150)
    abilities = models.TextField()
    moves = models.TextField()
    types = models.TextField()
    evolutions = models.TextField()
    weight = models.IntegerField(default=0)
    height = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.name}"

class Favorites(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    pokemon = models.ForeignKey(Pokemon, on_delete=models.CASCADE)
    stars = models.IntegerField(default=0, validators=[MaxValueValidator(5), MinValueValidator(0)])

    def __str__(self):
        return f"The user {self.user} scored with {self.stars} the Pokémon {self.pokemon}"