from django.shortcuts import render
from .models import POST
from django.shortcuts import HttpResponse

# Create your views here.




def index(request):
    if request.method=="POST":
        TxtSID = request.POST.get("TxtSID", None)
        TxtPwd = request.POST.get("TxtPwd", None)
        print(TxtSID, TxtPwd)
        return 1
    return render(request, "index.html")
