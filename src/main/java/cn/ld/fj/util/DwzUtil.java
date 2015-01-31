package cn.ld.fj.util;


import cn.ld.fj.web.pojo.JsonMessagePojo;
import net.esoar.modules.utils.encode.JsonBinder;

/**
 * DWZ工具类
 * 
 * @author James.X
 * 
 */

public class DwzUtil {
	// 返回类型
	public static String DWZ_DIALOG_AJAX_DONE = "dialogAjaxDone";
	public static String DWZ_NAVTAB_AJAX_DONE = "navTabAjaxDone";
	public static String DWZ_CLOSE_CURRENT = "closeCurrent";

	// 状态码
	public static String SUCCESS_STATUS_CODE = "200";
	public static String FAIL_STATUS_CODE = "300";
	public static String TIMEOUT_STATUS_CODE = "301";
	public static JsonMessagePojo jmp;
	
	
	
	

	

	

	/**
	 * 获取dwz成功返回的json,返回类型为navTabAjaxDone
	 * 
	 * @param statusCode
	 *            状态码
	 * @param navTabId
	 *            需重载的navTabId
	 * @return
	 */
	public static String getNavtabReturn(String navTabId, String message) {
		jmp = new JsonMessagePojo();
		jmp.setCallbackType(DWZ_NAVTAB_AJAX_DONE);
		jmp.setStatusCode(SUCCESS_STATUS_CODE);
		jmp.setNavTabId(navTabId);
		jmp.setForwardUrl("");
		jmp.setMessage(message);

		return JsonBinder.buildNormalBinder().toJson(jmp);
	}

	/**
	 * 获取dwz成功返回的json,返回类型为dialogAjaxDone
	 * 
	 * @param statusCode
	 *            状态码
	 * @param navTabId
	 *            需重载的navTabId
	 * @return
	 */
	
	
	public static String getDialogReturn(String navTabId, String message) {
		
		jmp = new JsonMessagePojo();
		jmp.setCallbackType(DWZ_DIALOG_AJAX_DONE);
		jmp.setStatusCode(SUCCESS_STATUS_CODE);
		jmp.setNavTabId(navTabId);
		jmp.setMessage(message);

		return JsonBinder.buildNormalBinder().toJson(jmp);
	}

	/**
	 * 获取dwz成功返回的json,返回类型为closeCurrent
	 * 
	 * @param statusCode
	 *            状态码
	 * @param navTabId
	 *            需重载的navTabId
	 * @return
	 */
	public static String getCloseCurrentReturn(String navTabId, String message) {
		jmp = new JsonMessagePojo();
		jmp.setCallbackType(DWZ_CLOSE_CURRENT);
		jmp.setStatusCode(SUCCESS_STATUS_CODE);
		jmp.setNavTabId(navTabId);
		jmp.setMessage(message);

		return JsonBinder.buildNormalBinder().toJson(jmp);
	}

	/**
	 * 获取dwz失败返回的json
	 * 
	 * @param message
	 * @return
	 */
	public static String getFailReturn(String message) {
		jmp = new JsonMessagePojo();
		jmp.setStatusCode(FAIL_STATUS_CODE);
		jmp.setMessage(message);

		return JsonBinder.buildNormalBinder().toJson(jmp);
	}

	/**
	 * 获取dwz超时返回的json
	 * 
	 * @param message
	 * @return
	 */
	public static String getTimeoutReturn(String message) {
		jmp = new JsonMessagePojo();
		jmp.setStatusCode(TIMEOUT_STATUS_CODE);
		jmp.setMessage(message);

		return JsonBinder.buildNormalBinder().toJson(jmp);
	}
}
