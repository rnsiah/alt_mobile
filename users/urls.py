from django.urls import path, include
from .views import user_profile, update_profile



app_name= 'users'
urlpatterns = [
  path('<username>', user_profile, name='user_profile'),
  path('profile', update_profile, name='update_profile'),


]


