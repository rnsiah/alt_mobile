from django.urls import path
from . import views
from .views import UserRecordView

app_name= 'api'

urlpatterns = [
  path('user/', UserRecordView.as_view(), name='users' ),
  path('shirts', views.ShirtList.as_view()),
  path('atrocities', views.AtrocityList.as_view()),
  path('nonprofits', views.NonProfitList.as_view()),
    
]
