from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.models import User, auth
from django.template import RequestContext
from django.contrib import messages
from django.http import HttpResponseRedirect
# from django.core.files.storage import FileSystemStorage
from .models import *
from .forms import UserRegisterForm, ProfileForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group


# for login authentication
def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password1')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect("/")
        else:
            messages.info(request, 'Invalid credentials...')
            return redirect('accounts:login')

    return render(request, 'accounts/sign-in.html')

# for registeration authentication


def register(request):
    form = UserRegisterForm()
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')

            messages.success(request, 'Account was created for ' + username)
            return redirect('accounts:login')
    else:
        form = UserRegisterForm()
    return render(request, 'accounts/sign-up.html', {'form': form})


@login_required(login_url='accounts:login')
def profileSettings(request):
    profile = request.user.profile
    form = ProfileForm(instance=profile)
    if request.method == 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=profile)
        if form.is_valid():
            form = form.save()
            # context = RequestContext("accounts:profile.html", {'form': form})
            messages.success(request, 'Your profile was successfully updated!')
            return render(request, 'accounts/profile-account-setting.html', {'form': form})
        else:
            messages.info(request, 'Please correct the error below.')
    else:
        form = ProfileForm(instance=request.user.profile)

    context = {'form': form}
    return render(request, 'accounts/profile-account-setting.html', context)


# fro sending friend request
def send_friend_request(request, id):
    if request.user.is_authenticated:
        user = get_object_or_404(User, id=id)
        frequest, created = FriendRequest.objects.get_or_create(
            from_user=request.user,
            to_user=user
        )
        touserequest, created = ToUse.objects.get_or_create(
            first_person=request.user,
            second_person=user
        )
        return HttpResponseRedirect('/')


@login_required(login_url='accounts:login')
def cancel_friend_request(request, id):
    if request.user.is_authenticated:
        user = get_object_or_404(User, id=id)
        frequest = FriendRequest.objects.filter(
            from_user=request.user,
            to_user=user
        ).first()
        touserequest = ToUse.objects.filter(
            first_person=request.user,
            second_person=user
        ).first()
        frequest.delete()
        touserequest.delete()
        return HttpResponseRedirect('/')


def accept_friend_request(request, id):
    from_user = get_object_or_404(User, id=id)
    frequest = FriendRequest.objects.filter(
        from_user=from_user, to_user=request.user).first()
    user1 = frequest.to_user
    user2 = from_user
    user1.profile.friends.add(user2.profile)
    user2.profile.friends.add(user1.profile)
    frequest.delete()
    return HttpResponseRedirect('/')


def delete_friend_request(request, id):
    from_user = get_object_or_404(User, id=id)
    frequest = FriendRequest.objects.filter(
        from_user=from_user, to_user=request.user).first()
    touserequest = ToUse.objects.filter(
        first_person=first_person,
        second_person=request.user,
    ).first()
    touserequest.delete()
    frequest.delete()
    return HttpResponseRedirect('/')
    # return HttpResponseRedirect('accounts/{}'.format(request.user.profile.id))


def profile_view(request, id):
    p = Profile.objects.filter(id=id).first()
    # test = Profile.objects.filter(FriendRequest __friends__startwith= "from_user")
    u = p.user
    sent_friend_requests = FriendRequest.objects.filter(from_user=p.user)
    rec_friend_requests = FriendRequest.objects.filter(to_user=p.user)

    friends = p.friends.all()
    # test = FriendRequest.objects.filter(to_user ="29")

    no_of_request = rec_friend_requests.count()
    
    # is this user our friend
    button_status = 'none'
    if p not in request.user.profile.friends.all():
        button_status = 'not_friend'

        # if we have sent him a friend request
        if len(FriendRequest.objects.filter(
                from_user=request.user).filter(to_user=p.user)) == 1:
            button_status = 'friend_request_sent'

    context = {
        # 'test': test,
        'friends_no': Profile.get_friends_no,
        'u': u,
        'button_status': button_status,
        'friends_list': friends,
        'sent_friend_requests': sent_friend_requests,
        'rec_friend_request': rec_friend_requests,
        'no_of_request': no_of_request
    }

    return render(request, 'accounts/user-profile.html', context)


# for logging the user out
def logoutUser(request):
    logout(request)
    return redirect('accounts:login')
