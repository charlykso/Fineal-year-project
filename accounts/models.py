from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.


class Profile(models.Model):
    user = models.OneToOneField(
        User, null=True, blank=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, null=True)
    profile_pic = models.ImageField(
        default="co.png", null=True, blank=True, upload_to='')
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    slug = models.SlugField(null=True, blank="True")
    friends = models.ManyToManyField(
        "Profile", blank=True)
    updated = models.DateTimeField(auto_now=True, blank=True)

    def __str__(self):
        return str(self.user.username)

    def get_friends(self):
        return self.friends.all()

    def get_friends_no(self):
        return self.friends.all().count()

    def get_absolute_url(self):
        return "/accounts/{}".format(self.id)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


class FriendRequest(models.Model):
    to_user = models.ForeignKey(
        User, related_name="to_user", on_delete=models.CASCADE)
    from_user = models.ForeignKey(
        User, related_name="from_user", on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)

    def get_friends_request(self):
        return self.FriendRequest.all().count()

    def __str__(self):
        return "From {}, To {}".format(self.from_user.username, self.to_user.username)


class ToUse(models.Model):
    first_person = models.ForeignKey(
        User, related_name="first_person", on_delete=models.CASCADE)
    second_person = models.ForeignKey(
        User, related_name="second_person", on_delete=models.CASCADE)
    timestp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "from {}, To {}".format(self.first_person.username, self.second_person.username)
