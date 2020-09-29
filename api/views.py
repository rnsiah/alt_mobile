from rest_framework import generics
from .serializers import ShirtSerializer, NonProfitSerializer, AtrocitySerializer
from Alt.models import Shirt, NonProfit, Atrocity

class ShirtList(generics.ListCreateAPIView):
  serializer_class = ShirtSerializer
  queryset= Shirt.objects.all()
  
     
class NonProfitList(generics.ListAPIView):
  serializer_class = NonProfitSerializer
  queryset = NonProfit.objects.all()


class AtrocityList(generics.ListAPIView):
  serializer_class = AtrocitySerializer
  queryset= Atrocity.objects.all()



# Create your views here.
