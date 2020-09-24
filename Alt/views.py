from django.shortcuts import render,get_object_or_404, redirect
from django.views.generic import ListView, DetailView, View
from .models import Shirt, Atrocity, NonProfit


def home(request):
  return render (request, 'landing.html')




class ShirtList(ListView):
  model = Shirt
  template_name = 'allshirts_list.html'


def view_shirt(request, slug):
  shirt = get_object_or_404(Shirt, slug=slug)

  return render(request, 'shirts.html',{ 'shirt':shirt} )

