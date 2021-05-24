package common;

public class ModelAndView {

	private boolean isRedirect;
	private String view;

	public ModelAndView() {
		super();
	}
	public ModelAndView(boolean isRedirect, String view) {
		super();
		this.isRedirect = isRedirect;
		this.view = view;
	}
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
}
