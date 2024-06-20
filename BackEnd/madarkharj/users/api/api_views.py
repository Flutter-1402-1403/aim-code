from rest_framework import filters
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from rest_framework_simplejwt import views as jwt_views
from rest_framework_simplejwt.exceptions import InvalidToken, TokenError
from django.db.models import Q,Count
from users.api.serializers import UserSerializer, ChangePasswordSerializer, UserCreateSerializer
from users.models import User
from users.security import set_jwt_cookies, set_jwt_access_cookie, unset_jwt_cookies

from .serializers import GroupSerializer ,PaymentSerializer, WaitingListSerializer
from ..models import Group, Payment, WaitingList


class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['first_name', 'last_name', 'username']
    ordering_fields = ['id']

    @action(methods=['get'], detail=False, url_path='me', url_name='me')
    def me(self, request, *args, **kwargs):
        user = request.user
        serializer = self.get_serializer(user)
        data = serializer.data
        dept = Payment.objects.annotate(user_count=Count('users')).filter(Q(users=self.request.user)& 
                                              (Q(waiting_list__isnull=True) |
                                                Q(waiting_list__status__in=['P','R']))).values_list('price','user_count')
        demand = Payment.objects.filter(Q(owner=self.request.user)& 
                                              (Q(waiting_list__isnull=True) |
                                                Q(waiting_list__status__in=['P','R']))).values_list('price',flat=True)
        data['dept'] = sum([i[0] / i[1] for i in dept])
        data['demand'] = sum(demand)
        return Response(data, status=status.HTTP_200_OK)

    @action(methods=['post'], detail=False, url_path='change-password', url_name='change-password')
    def change_password(self, request, *args, **kwargs):
        user = request.user
        serializer = self.get_serializer(user, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'detail': 'پسورد با موفقیت تغییر کرد.'}, status=status.HTTP_200_OK)

    def get_serializer_class(self):
        if self.action == 'change_password':
            return ChangePasswordSerializer
        elif self.action == 'create':
            return UserCreateSerializer
        return self.serializer_class


class TokenObtainPairView(jwt_views.TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        try:
            serializer.is_valid(raise_exception=True)
        except TokenError as e:
            raise InvalidToken(e.args[0])
        response = Response(serializer.validated_data, status=status.HTTP_200_OK)
        access_token = response.data['access']
        refresh_token = response.data['refresh']
        set_jwt_cookies(response, access_token, refresh_token)
        return response


class TokenRefreshView(jwt_views.TokenRefreshView):
    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        access_token = response.data['access']
        set_jwt_access_cookie(response, access_token)
        return response


class TokenBlacklistView(APIView):
    def post(self, request, *args, **kwargs):
        response = Response(data={'detail': 'Successfully logged out.'}, status=status.HTTP_200_OK)
        unset_jwt_cookies(response)
        return response


class GroupViewSet(ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

    # def get_queryset(self):
    #     return super().get_queryset().filter(user=self.request.user)


class PaymentViewSet(ModelViewSet):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer


class WaitingListViewSet(ModelViewSet):
    queryset = WaitingList.objects.all()
    serializer_class = WaitingListSerializer

    @action(detail=True, methods=['POST'])
    def accept(self, request, pk=None):
        entry = self.get_object()
        entry.status = 'A'
        entry.save()
        return Response({'status' : 'accepted'}, status.HTTP_200_OK)
    
    @action(detail=True, methods=['POST'])
    def reject(self, request, pk=None):
        entry = self.get_object()
        entry.status = 'R'
        entry.save()
        return Response({'status' : 'rejected'}, status.HTTP_200_OK)
    
