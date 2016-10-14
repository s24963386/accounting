package sumslack.app.interceptor;

import javax.servlet.http.HttpServletRequest;

import com.sumscope.tag.aop.IAOPCallback;

public class ControllerInterceptor implements IAOPCallback{

	public boolean before(Object obj, Object[] args) {
		if(obj instanceof HttpServletRequest){
			HttpServletRequest controller = (HttpServletRequest)obj;
			System.out.println("===========visit url(before):"+controller.getRequestURI());
		}
		return true;
	}

	public void after(Object obj, Object[] args) {
		if(obj instanceof HttpServletRequest){
			HttpServletRequest controller = (HttpServletRequest)obj;
			System.out.println("===========visit url(after):"+controller.getRequestURI());
		}
	}

}
