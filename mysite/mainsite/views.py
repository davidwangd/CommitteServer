<<<<<<< HEAD
from django.shortcuts import render
from django.template.loader import get_template
from django.http import HttpResponse
from datetime import datetime
from .models import Post
from django.shortcuts import redirect


# Create your views here.

def homepage(request):
    template = get_template('index.html')
    posts = Post.objects.all()
    now = datetime.now()
    html = template.render(locals())
    return HttpResponse(html)


def showpost(request, slug):
    template = get_template('post.html')
    try:
        post = Post.objects.get(slug=slug)
        if post != None:
            html = template.render(locals())
            return HttpResponse(html)
    except:
        return redirect('/')

=======
from django.shortcuts import render
from django.http import HttpResponse
from .models import Post


# Create your views here.

def homepage(request):
    posts = Post.objects.all()
    post_lists = list()
    for count, post in enumerate(posts):
        post_lists.append("No.{}".format(str(count)) + str(post.title) + "<br>")
    return HttpResponse(post_lists)
>>>>>>> 2ceaa3d73868ec3ca50199036d7ade5400ff884a
