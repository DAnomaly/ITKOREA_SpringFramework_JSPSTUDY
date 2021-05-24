package common;

public class ModelAndView {

	// 응답 View + 이동방식(forward, redirect)
	private String view;
	private boolean isRedirect; // true : redirect, false : forward
	
	public ModelAndView() {}
	public ModelAndView(String view, boolean isRedirect) {
		super();
		this.view = view;
		this.isRedirect = isRedirect;
	}
	
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
