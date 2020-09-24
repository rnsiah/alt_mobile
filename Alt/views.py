from django.shortcuts import render,get_object_or_404, redirect
from django.views.generic import ListView, DetailView, View


def home(request):
  return render (request, 'landing.html')