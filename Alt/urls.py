from django.urls import path
from .views import home

app_name= 'Alt'

urlpatterns = [
    path('', home, name='landing')
]


