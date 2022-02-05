from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from . import views

app_name = 'accounts'

urlpatterns = [
    path('register/', views.register, name='register'),
    path('login/', views.loginPage, name='login'),
    path('profileSettings/', views.profileSettings, name='profileSettings'),
    path('logout/', views.logoutUser, name='logout'),
    url(r'^(?P<id>[\w-]+)/$', views.profile_view, name='profile_view'),
    url(r'^friend-request/send/(?P<id>[\w-]+)/$',
        views.send_friend_request, name='send_friend_request'),
    url(r'^friend-request/cancel/(?P<id>[\w-]+)/$',
        views.cancel_friend_request, name='cancel_friend_request'),
    url(r'^friend-request/accept/(?P<id>[\w-]+)/$',
        views.accept_friend_request, name='accept_friend_request'),
    url(r'^friend-request/delete/(?P<id>[\w-]+)/$',
        views.delete_friend_request, name='delete_friend_request'),
]
