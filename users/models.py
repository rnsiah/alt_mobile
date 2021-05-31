from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from io import BytesIO
from django.core import files
#import qrcode
#from PIL import Image, Draw



class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField(max_length=500, blank=True)
    birth_date= models.DateField(blank=True, null=True)
    location = models.CharField(max_length=50, blank=True)
    #qr_code= models.ImageField(_(""), upload_to=None, height_field=None, width_field=None, max_length=None)
    
    
    def __str__(self):
        return self.user.username

# Create your models here.

@receiver(post_save, sender=User)
def createUserProfile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def saveUserProfile(sender, instance, **kwargs):
    instance.profile.save()



class Balance(models.Model):
    user = models.ForeignKey(Profile, on_delete=models.CASCADE)
    balance = models.IntegerField(default=0)