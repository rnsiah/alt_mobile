from django.contrib import admin
from .models import Shirt, Atrocity, Category, NonProfit, Country

# Register your models here.
admin.site.register(Shirt)
admin.site.register(Atrocity)
admin.site.register(Category)
admin.site.register(NonProfit)
admin.site.register(Country)