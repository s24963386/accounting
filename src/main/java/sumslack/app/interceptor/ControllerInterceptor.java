package sumslack.app.interceptor;

import javax.servlet.http.HttpServletRequest;

import com.sumscope.tag.aop.IAOPCallback;

public class ControllerInterceptor implements IAOPCallback{

	public void before(Object obj, Object[] args) {
		if(obj instanceof HttpServletRequest){
			HttpServletRequest controller = (HttpServletRequest)obj;
			System.out.println("===========visit url(before):"+controller.getRequestURI());
		}
	}

	public void after(Object obj, Object[] args) {
		if(obj instanceof HttpServletRequest){
			HttpServletRequest controller = (HttpServletRequest)obj;
			System.out.println("===========visit url(after):"+controller.getRequestURI());
		}
	}

}
