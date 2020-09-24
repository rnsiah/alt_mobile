from django.db import models
from django.conf import settings
from django.shortcuts import reverse
from django.template.defaultfilters import slugify




class Category(models.Model):
    name = models.CharField(max_length = 50, blank=False, null=False)

    def __str__(self):
        return self.name
    


class Country(models.Model):
    name= models.CharField( max_length=50, blank=False, null=False)
    flag = models.ImageField(upload_to='media/media/flags', height_field=None, width_field=None, max_length=None)

    def __str__(self):
        return self.name



class Atrocity(models.Model):
    title = models.CharField(max_length=30, blank=False, null=False)
    region = models.CharField(max_length=30, blank=False, null=False)
    info= models.TextField()
    image_url = models.TextField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    country = models.ForeignKey(Country, on_delete=models.CASCADE,blank=True, null=True )
    slug = models.SlugField(unique = True) 

    

    def __str__(self):
        return self.title
    def slug(self):
        return slugify(self.title)



class Shirt(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    price = models.FloatField()
    shirt_type = models.CharField(max_length=30, blank=False, null=False) 
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    shirt_image = models.ImageField( upload_to='media/media/shirts', height_field=None, width_field=None, max_length=None)
    original_image = models.ImageField(upload_to='media/media/shirts', height_field=None, width_field=None, max_length=None)
    Atrocity = models.ForeignKey(Atrocity, on_delete=models.CASCADE, blank = True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    slug = models.SlugField(unique = True)

    def __str__(self):
        return self.name

    def slug(self):
        return slugify(self.name)
    
    def get_absolute_url(self):
        return reverse("Alt:Shirt", kwargs={"slug": self.slug})

    
    



class NonProfit(models.Model):
    name= models.CharField(max_length=50, blank=False, null=False)
    logo =  models.TextField()
    description =models.TextField()
    year_started = models.IntegerField()
    mission_statement=models.TextField()
    vision_statement=models.TextField()
    website_url= models.URLField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    slug = models.SlugField(unique = True)

    def __str__(self):
        return self.name

    def slug(self):
        return slugify(self.name)



