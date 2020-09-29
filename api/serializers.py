from rest_framework import serializers
from  Alt.models import Shirt, Atrocity, NonProfit


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

