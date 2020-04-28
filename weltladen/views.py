from django.core.exceptions import NON_FIELD_ERRORS
from django.utils.translation import ugettext_lazy as _
from rest_framework import status
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from weltladen.forms import ContactUsForm

class ContactUsView(GenericAPIView):
    form_class = ContactUsForm
    template_name = 'weltladen/forms/contact-us.html'

    def post(self, request, *args, **kwargs):
        '''
        validate and such
        '''
        form_data = request.data.get(self.form_class.scope_prefix, {})
        form = self.form_class(data=form_data)
        #success
        if form.is_valid():
            form.save(request=request)
            response_data = {form.form_name: {
                'success_message': _("Successfully sent message"),
            }}
            return Response(response_data, status=status.HTTP_200_OK)
        #handle errors
        errors = dict(form.errors)
        if 'email' in errors:
            errors.update({NON_FIELD_ERRORS: errors.pop('email')})
        return Response({form.form_name: errors}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
