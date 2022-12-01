from django.urls import path
from django.views.decorators.csrf import csrf_exempt
from .views import *

urlpatterns = [

    path('get-queries',
          csrf_exempt(GetQueries.as_view()),
          name='get-queries'),

    path('get-query-result',
          csrf_exempt(GetQueryResults.as_view()),
          name='get-query-result'),
]