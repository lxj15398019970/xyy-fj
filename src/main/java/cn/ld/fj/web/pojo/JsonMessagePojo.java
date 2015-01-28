package cn.ld.fj.web.pojo;

/**
 * Json操作返回信息(通过JsonBinder可以方便的转换为Json格式)
 * 
 * @author fly
 * 
 */
public class JsonMessagePojo {

	private String statusCode;
	private String message;
	private String navTabId;
	private String forwardUrl;
	private String callbackType;

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getNavTabId() {
		return navTabId;
	}

	public void setNavTabId(String navTabId) {
		this.navTabId = navTabId;
	}

	public String getForwardUrl() {
		return forwardUrl;
	}

	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}

	public String getCallbackType() {
		return callbackType;
	}

	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}

}
