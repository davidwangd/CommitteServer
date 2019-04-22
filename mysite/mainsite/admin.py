<<<<<<< HEAD
from django.contrib import admin
from .models import Post

# Register your models here.


class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'pub_date')


admin.site.register(Post, PostAdmin)
=======
from django.contrib import admin
from .models import Post

# Register your models here.


class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'pub_date')


admin.site.register(Post, PostAdmin)
>>>>>>> 2ceaa3d73868ec3ca50199036d7ade5400ff884a
