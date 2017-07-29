package com.yirong.framework.common.captcha;

import com.octo.captcha.service.CaptchaServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @author xn-h
 * @describe(生成验证码图片类)
 * @create 2017/7/26
 **/
@WebServlet(urlPatterns="/jcaptcha")
public class ImageCaptchaServlet extends HttpServlet {

	private static final Logger logger = LoggerFactory.getLogger(ImageCaptchaServlet.class);
	private static final long serialVersionUID = 2628793434150001850L;

	/**
	 * @describe (初始化)
	 * @author xn-h
	 * @create 2017/7/26
	 * @param [servletConfig]
	 * @return void
	**/
	@Override
	public void init(ServletConfig servletConfig) throws ServletException {
		super.init(servletConfig);
	}

	/**
	 * @describe (get请求获取验证码)
	 * @author xn-h
	 * @create 2017/7/26
	 * @param [httpServletRequest, httpServletResponse]
	 * @return void
	**/
	@Override
	protected void doGet(HttpServletRequest httpServletRequest,
	                     HttpServletResponse httpServletResponse) throws ServletException,
			IOException {
		genernateCaptchaImage(httpServletRequest, httpServletResponse);
	}

	/**
	 * @describe (生成验证码图片)
	 * @author xn-h
	 * @create 2017/7/26
	 * @param [request, response]
	 * @return void
	**/
	private void genernateCaptchaImage(final HttpServletRequest request,  final HttpServletResponse response) throws IOException {
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream();
		try {
			String captchaId = request.getSession(true).getId();
			BufferedImage challenge = (BufferedImage) CaptchaServiceSingleton .getInstance().getChallengeForID(captchaId, request.getLocale());
			ImageIO.write(challenge, "jpg", out);
			out.flush();
		}

		catch (CaptchaServiceException e) {
			logger.error("====生成验证码发生错误===="+e);
		}

		finally {
			out.close();
		}
	}
}
