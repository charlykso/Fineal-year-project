from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404
from rest_framework.fields import ImageField
from chat.models import MessageModel
from rest_framework.serializers import ModelSerializer, CharField
from rest_framework import serializers
from accounts.models import Profile


class MessageModelSerializer(ModelSerializer):
    user = CharField(source='user.username', read_only=True)
    # user_image = ImageField(source='user.profile.profile_pic.url')
    recipient = CharField(source='recipient.username')

    def create(self, validated_data):
        user = self.context['request'].user
        # user_img = self.context['request'].user.profile.profile_pic.url
        recipient = get_object_or_404(
            User, username=validated_data['recipient']['username'])
        msg = MessageModel(recipient=recipient,
                           body=validated_data['body'],
                           user=user)
        msg.save()
        return msg

    class Meta:
        model = MessageModel
        fields = ('id', 'user', 'recipient',
                  'timestamp', 'body', 'classifier')


class UserModelSerializer(ModelSerializer):
    friends = serializers.StringRelatedField(many=True)
    # friends = serializers.RelatedField(many=True, read_only=True)

    class Meta:
        model = Profile
        fields = ('id', 'name', 'profile_pic', 'friends')
