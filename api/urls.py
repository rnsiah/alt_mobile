from django.urls import path
from . import views

app_name= 'api'

urlpatterns = [
  path('shirts', views.ShirtList.as_view()),
  path('atrocities', views.AtrocityList.as_view()),
  path('nonprofits', views.NonProfitList.as_view()),
    
]
