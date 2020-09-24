from django.urls import path, include
from .views import user_profile



app_name= 'users'
urlpatterns = [
  path('<username>', user_profile, name='user_profile'),


]


