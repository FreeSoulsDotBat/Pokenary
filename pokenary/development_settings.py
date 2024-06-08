from pokenary.common_settings import *


SECRET_KEY = 'django-insecure-^p52-_%y9x4#91p67lt7f0ckt3r80^h=w(hx&a3rwo8(qx7kkt'

DEBUG = True

ALLOWED_HOSTS = []

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'pokenary',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'pokenary_db',
        'PORT': '3306'
    }
}