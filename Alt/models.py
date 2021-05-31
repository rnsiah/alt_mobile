from django.db import models
from django.conf import settings
from django.shortcuts import reverse
from django.template.defaultfilters import slugify
from django.db.models.signals import pre_save





    

 





class Category(models.Model):
    name = models.CharField(max_length = 50, blank=False, null=False)
    image = models.ImageField( upload_to='media/media/causeImages', height_field=None, width_field=None, max_length=None)
    information =models.TextField()

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
    slug = models.SlugField(unique = True, null=True, blank=True)

    def __str__(self):
        return self.name

  
    
    def get_absolute_url(self):
        return reverse("Alt:shirts", kwargs={"slug": self.slug})

def slug_generator(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug='SLUG'

pre_save.connect(slug_generator, sender=Shirt)    
    



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

    



