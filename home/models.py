from django.db import models

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
