from django.contrib.auth.models import User
from django.db.models import (Model, TextField, DateTimeField, ForeignKey,
                              CASCADE)
from asgiref.sync import async_to_sync
from channels.layers import get_channel_layer
from django.db import models
from accounts.models import Profile
from mainPage.analysis import textAnalyzer



# class Contact(models.Model):
#     person = models.ForeignKey(User, related_name='person', on_delete=models.CASCADE)
#     friend = models.ManyToManyField('self', blank=True)

class MessageModel(Model):
    # """
    # This class represents a chat message. It has a owner (user), timestamp and
    # the message body.
    # """
    user = ForeignKey(User, on_delete=CASCADE, verbose_name='user',
                      related_name='from_chat_user', db_index=True)
    # user_img = ForeignKey(Profile, on_delete = CASCADE, verbose_name='user_img', related_name='img_chat_user')
    recipient = ForeignKey(User, on_delete=CASCADE, verbose_name='recipient',
                           related_name='to_chat_user', db_index=True)
    # recepient_img = ForeignKey(Profile, on_delete = CASCADE, verbose_name='recepient_img', related_name='img_chat_recepient')
    timestamp = DateTimeField('timestamp', auto_now_add=True, editable=False,
                              db_index=True)
    body = TextField('body')
    classifier = models.IntegerField(null=True) 
    def __str__(self):
        return str(self.id)

    def characters(self):
        # """
        # Toy function to count body characters.
        # :return: body's char number
        # """
        return len(self.body)
    
    def last_five_messages(self): 
        # print(textAnalyzer.predicttext(self.body))
        # all_messages = self.classifier()[:5]
        print(self.classifier)
        return

    def notify_ws_clients(self):
        # """
        # Inform client there is a new message.
        # """
        notification = {
            'type': 'recieve_group_message',
            'message': '{}'.format(self.id)
        }

        channel_layer = get_channel_layer()
        print("user.id {}".format(self.user.id))
        print("user.id {}".format(self.recipient.id))
       

        async_to_sync(channel_layer.group_send)("{}".format(self.user.id), notification)
        async_to_sync(channel_layer.group_send)("{}".format(self.recipient.id), notification)

    def save(self, *args, **kwargs):
        # """
        # Trims white spaces, saves the message and notifies the recipient via WS
        # if the message is new.
        # """
        new = self.id
        self.body = self.body.strip()  # Trimming whitespaces from the body
        something = textAnalyzer.predicttext(self.body)
        self.classifier = something
        super(MessageModel, self).save(*args, **kwargs)
        if new is None:
            self.notify_ws_clients()

    # Meta
    class Meta:
        app_label = 'chat'
        verbose_name = 'message'
        verbose_name_plural = 'messages'
        ordering = ('-timestamp',)
