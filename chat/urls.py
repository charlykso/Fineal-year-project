from django.urls import path, include
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from rest_framework.routers import DefaultRouter
from chat.api import MessageModelViewSet, UserModelViewSet
from django.contrib.auth import views as auth_views
from . import views
from django.conf.urls import url
# from mainPage.views import analysis
app_name = 'chat'

router = DefaultRouter()
router.register(r'message', MessageModelViewSet, basename='message-api')
router.register(r'user', UserModelViewSet, basename='user-api')
# router.register(r'^user/(?P<id>[\w-]+)/$', UserChatModelViewSet, basename='chat-api')

urlpatterns = [
    path(r'api/v1/', include(router.urls)),
    path('logout/', views.logoutUser, name='logout'),
    path('app/', TemplateView.as_view(template_name='chat/messages.html'), name='chatapp'),
    # path('app/draw/(?P<id>[\w-]+)/$', views.draw, name='draw'),
    url('draw', views.draw, name='draw'),
    url('last_msg', views.last_messages, name='last_messages'),
]
