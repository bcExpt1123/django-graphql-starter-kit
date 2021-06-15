import graphene
from graphene_django import DjangoObjectType, DjangoListField


from .models import Friend, Note


class FriendType(DjangoObjectType):
    class Meta:
        model = Friend
        fields = ("id", "first_name", "last_name", "email")


class NoteType(DjangoObjectType):
    class Meta:
        model = Note
        fields = ("id", "notes", "friend")


class Query(graphene.ObjectType):
    all_friends = DjangoListField(FriendType)
    all_notes = graphene.List(NoteType)

    def resolve_all_notes(root, info):
        return Note.objects.select_related("friend").all()


schema = graphene.Schema(query=Query)
