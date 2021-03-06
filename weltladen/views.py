from django.core.exceptions import NON_FIELD_ERRORS
from django.utils.translation import ugettext_lazy as _
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from .forms import ContactUsForm, MyRegisterUserForm
from .models import WeltladenCustomer, Activation
from .send_mail_helper import send_register_user_mail, send_activate_user_mail


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
   #template_name = 'weltladen/auth/activation.html'
    view_name = 'activation'
    def post(self, request, activation_key=None):
        activation = Activation.objects.filter(activation_key=activation_key).first()
        activation.activation_key = ''
        activation.save()
        email = activation.customer.email
        send_activate_user_mail(request, email)
        response_data = {self.view_name: {
            'success_message': _('Activation of your account has been successfull.')
        }}
        return Response(response_data ,status=status.HTTP_200_OK)

class NewActivationView(GenericAPIView):
    def post(self, request, activation_key=None):
        activation = Activation.objects.filter(activation_key=activation_key).first()
        activation.set_new_activation_key()
        activation.save()
        send_register_user_mail(request, activation.customer.user)
        return Response(status=status.HTTP_200_OK)
        


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

def custom_page_not_found(request):
    import django
    return django.views.defaults.page_not_found(request, None)