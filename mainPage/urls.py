from django.contrib import admin
from django.urls import path
from . import views

app_name = 'mainPage'

urlpatterns = [
    path('', views.index, name='index'),
    path('graph/', views.graph, name='graph'),
    path('search/', views.search, name='search'),
    
]
