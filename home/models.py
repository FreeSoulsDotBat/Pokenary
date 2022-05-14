from django.db import models

class Pokemon(models.Model):
    name = models.CharField(max_length=30)
    url_image = models.CharField(max_length=150)
    abilities = models.CharField(max_length=500, default='')
    moves = models.CharField(max_length=5000, default='')
    types = models.CharField(max_length=150, default='')
    evolutions = models.CharField(max_length=150, default='')
    weight = models.IntegerField(default=0)
    height = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.name}"
