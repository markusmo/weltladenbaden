from datetime import date, timedelta
from django.core.exceptions import NON_FIELD_ERRORS
from django.utils.translation import ugettext_lazy as _
from rest_framework import status
from rest_framework.generics import GenericAPIView, RetrieveAPIView
from rest_framework.response import Response
from weltladen.forms import ContactUsForm, MyRegisterUserForm
from weltladen.models import WeltladenCustomer, Activation


class RegisterUserView(GenericAPIView):
    form_class = MyRegisterUserForm
    template_name = 'weltladen/auth/register-user.html'

    def post(self, request, *args, **kwargs):
        '''
        validate and such
        '''
        if request.customer.is_visitor:
            customer = WeltladenCustomer.objects.get_or_create_from_request(request)
        else:
            customer = request.customer
        form_data = request.data.get(self.form_class.scope_prefix, {})
        form = self.form_class(data=form_data, instance=customer)
        # success
        if form.is_valid():
            form.save(request=request)
            response_data = {form.form_name: {
                'success_message': _("Successfully registered yourself."),
            }}
            return Response(response_data, status=status.HTTP_200_OK)
        # handle errors
        errors = dict(form.errors)
        if 'email' in errors:
            errors.update({NON_FIELD_ERRORS: errors.pop('email')})
        return Response({form.form_name: errors}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)


class ActivateUserView(GenericAPIView):
    form_class = None
    def get(self, request):
        activation_key = request.GET.get('activation_key')
        activation = Activation.objects.first(activation_key=activation_key)
        form = self.form_class(instance=activation)
        if form.is_valid(): #check if expired full_clean()
            form.save(request=request)
            response_data = {form.form_name: {
                'success_message': _('Activation of your account has been successfull')
            }}
            return Response(response_data ,status=status.HTTP_200_OK)
        errors = {form.form_name: {
            dict(form.errors)
        }}
        return Response(errors, status=status.HTTP_400_BAD_REQUEST)
    


class ContactUsView(GenericAPIView):
    form_class = ContactUsForm
    template_name = 'weltladen/forms/contact-us.html'

    def post(self, request, *args, **kwargs):
        '''
        validate and such
        '''
        form_data = request.data.get(self.form_class.scope_prefix, {})
        form = self.form_class(data=form_data)
        # success
        if form.is_valid():
            form.save(request=request)
            response_data = {form.form_name: {
                'success_message': _("Successfully sent message"),
            }}
            return Response(response_data, status=status.HTTP_200_OK)
        # handle errors
        errors = dict(form.errors)
        if 'email' in errors:
            errors.update({NON_FIELD_ERRORS: errors.pop('email')})
        return Response({form.form_name: errors}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
