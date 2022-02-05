# import online_users.models
from accounts.models import ToUse
from datetime import datetime
from matplotlib import pyplot as plt
from django.apps import apps
import pathlib
from os import path
import os
from django.shortcuts import render, redirect
from django.contrib.auth.models import User, auth
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.http import HttpResponse
import networkx as nx
import matplotlib
matplotlib.use('Agg')
from chat.models import MessageModel
from chat.serializers import MessageModelSerializer

# Create your views here.
model = apps.get_model('accounts', 'Profile')
model2 = apps.get_model('accounts', 'FriendRequest')



@login_required(login_url='accounts:login')
def index(request):
    form = model(request.POST, request.FILES)
    users = model.objects.exclude(user=request.user)
    test = model.objects.all()

    context = {'form': form, 'users': users, 'test': test} 
    return render(request, 'mainPage/index.html', context)

# def see_users(self):
#   user_status = online_users.models.OnlineUserActivity.get_user_activities(datetime.timedelta(seconds=60))
#   all_users = (user for user in  user_status)
#   context = {"online_users"}
#   return render( 'mainPage/index.html', context)


def check_admin(user):
    return user.is_superuser


# @user_passes_test(check_admin)

# @superuser_required
@user_passes_test(check_admin)
def graph(request):
    G = nx.Graph()
    frnds = ToUse.objects.all()
    user_classifier = MessageModel.objects.filter(user=request.user)[:10]
    newclas = 0
    for newclass in user_classifier:
        newclas =  newclass
    for f in frnds:
        G.add_edge(f.first_person, f.second_person)
    nx.draw(G, with_labels=True)
    file = pathlib.Path("static/graph-pic/graph1.png")

    graph = plt.savefig("static/graph-pic/graph1.png")
    plt.close()

    newclas += newclass
    return render(request, 'mainPage/graph.html', {'graph': graph, 'user_classifier': user_classifier, 'newclas': newclas})


def search(request):
    if request.GET.get('myform'):  # write your form name here
        book_name = request.GET.get('myform')
        try:
            search_result = User.objects.filter(bookname__icontains=book_name)
            return render(request, "mainPage/index.html", {"search_result": search_result})
        except:
            return render(request, "mainPage/index.html", {'search_result': search_result})
    else:
        search_result = "No user found!"
        return render(request, 'mainPage/index.html', {'search_result': search_result})


def logout(request):
    auth.logout(request)
    return redirect('accounts/sign-in.html')
