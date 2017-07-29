package com.yirong.framework.common.captcha;


import com.octo.captcha.service.captchastore.FastHashMapCaptchaStore;
import com.octo.captcha.service.image.DefaultManageableImageCaptchaService;
import com.octo.captcha.service.image.ImageCaptchaService;

/**
 * @author xn-h
 * @describe(验证码业务单例类)
 * @create 2017/7/26
 **/
public class CaptchaServiceSingleton {

	private static ImageCaptchaService instance = new DefaultManageableImageCaptchaService(new FastHashMapCaptchaStore(),
			new CustomCaptchaEngine(),180, 100000, 75000);

	public static ImageCaptchaService getInstance() {
		return instance;
	}
}
