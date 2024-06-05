from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    ...


class Group(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    users = models.ManyToManyField(User)

    def __str__(self) -> str:
        return self.name


class Payment(models.Model):
    price = models.DecimalField(max_digits=10, decimal_places=2)
    name = models.CharField(max_length=255)
    users = models.ManyToManyField(User)

