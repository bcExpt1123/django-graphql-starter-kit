from django.db import models

# Create your models here.


class Friend(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField()

    def __str__(self):
        return self.first_name


class Note(models.Model):
    notes = models.TextField()
    friend = models.ForeignKey(
        Friend, on_delete=models.CASCADE
    )
