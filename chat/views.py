from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
import logging
from chat.models import MessageModel
# Create your views here.

# def chatapp(request):
#     pass
#     return render(request, 'chat/chat.html')

# import schedule
# import time


# def job():
#     print("I'm working...")

# schedule.every(10).minutes.do(job)
# schedule.every().hour.do(job)
# schedule.every().day.at("10:30").do(job)
# schedule.every().monday.do(job)
# schedule.every().wednesday.at("13:15").do(job)

# while True:
#     schedule.run_pending()
#     time.sleep(1)

def last_messages(request):
    cuser = request.user
    qs = MessageModel.objects.filter(user = cuser)[:5]
    context= {
        'qs' : qs,
    }
    return render(request, 'chat:messages.html', context )


def draw(request):
    me = MessageModel.user
    p = MessageModel.objects.filter(id=request.user.id).first()
    u = p.user
    sent_message = MessageModel.objects.filter(user=p.user)
    rec_message = MessageModel.objects.filter(recipient=p.user)
    person = {
        'me': me,
        'user': u,
        'sent_message': sent_message,
        'rec_message': rec_message
    }
    return redirect(request, 'chat:messages.html', person)
# logger = logging.getLogger(__name__)

# def analysis(request):
#     # log = logger.error('Something went wrong!')
#     # print(log)
#     print("how are you doing")
#     return render(request, 'mainPage/graph.html')

# for logging the user out
def logoutUser(request):
    logout(request)
    return redirect('accounts:login')
