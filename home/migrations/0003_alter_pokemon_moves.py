# Generated by Django 4.0.3 on 2022-05-12 18:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_pokemon_abilities_pokemon_evolutions_pokemon_height_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pokemon',
            name='moves',
            field=models.CharField(default='', max_length=5000),
        ),
    ]
