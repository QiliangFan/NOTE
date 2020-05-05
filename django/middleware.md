~~~properties
middleware 有多种实现方式, 但是这种方式最简单
~~~

~~~python
from django.utils.deprecation import MiddlewareMixin


class MyMiddle(MiddlewareMixin):

    def process_view(self, request: HttpRequest, view_func, view_args, view_kwargs):    # valid
        # ...
        return None
    
    def process_request(self, request):
        
        return None

    def process_response(self, request:HttpRequest, response:TemplateResponse):
		# ...
        return response
    
    # 还有其他的
    
~~~

