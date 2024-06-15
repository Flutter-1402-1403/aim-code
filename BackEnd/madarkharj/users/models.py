from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    ...


class Group(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    user = models.ManyToManyField(User)

    def __str__(self) -> str:
        return self.name


class Payment(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE,related_name='payment_user',null=True,blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    name = models.CharField(max_length=255)
    users = models.ManyToManyField(User)


class WaitingList(models.Model):
    STATUS_CHOICES = [
        ('P', 'Pending'),
        ('A', 'Accepted'),
        ('R', 'Rejected'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    transaction = models.ForeignKey(Payment, on_delete=models.CASCADE,related_name='waiting_list')
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default="Pending")
    created_at = models.DateTimeField(auto_now_add=True)
