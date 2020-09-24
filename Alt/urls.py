from django.urls import path
from .views import home, ShirtList, view_shirt

app_name= 'Alt'

urlpatterns = [
    path('', home, name='landing'),
    path('allshirts', ShirtList.as_view(), name = 'allshirts_list'),
    path('shirts/<slug>/', view_shirt, name = 'shirts' )
   
]


