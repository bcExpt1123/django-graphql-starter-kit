from django.contrib import admin

# Register your models here.

from .models import Friend, Note
admin.site.register(Friend)
admin.site.register(Note)
