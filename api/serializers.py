from rest_framework import serializers
from  Alt.models import Shirt, Atrocity, NonProfit
from django.contrib.auth.models import User
from rest_framework.validators import UniqueTogetherValidator



class ShirtSerializer(serializers.ModelSerializer):
  class Meta:
    model = Shirt
    fields = ['id', 'name', 'price', 'country', 'shirt_image','Atrocity', 'category', 'slug']


class AtrocitySerializer(serializers.ModelSerializer):
  class Meta:
    model = Atrocity
    fields = ['title', 'region', 'info', 'image_url', 'category','country','slug' ]


class NonProfitSerializer(serializers.ModelSerializer):
  class Meta:
    model = NonProfit
    fields = ['name','logo', 'description', 'year_started', 'mission_statement','vision_statement','website_url','category','slug']



class UserSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user

    class Meta:
        model = User
        fields = (
            'username',
            'first_name',
            'last_name',
            'email',
            'password',
        )
        validators = [
            UniqueTogetherValidator(
                queryset=User.objects.all(),
                fields=['username', 'email']
            )
        ]