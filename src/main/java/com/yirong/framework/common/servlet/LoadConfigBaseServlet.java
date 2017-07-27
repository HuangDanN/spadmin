package com.yirong.framework.common.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;

@WebServlet
@ConfigurationProperties(prefix="system.path")
public class LoadConfigBaseServlet extends HttpServlet {

	private static final long serialVersionUID = 3150775186972209295L;

	private static final Logger logger = LoggerFactory.getLogger(LoadConfigBaseServlet.class);
	
	@Value("web")
	private String webPath;
	@Value("admin")
	private String adminPath;
	@Value("common")
	private String commonPath;
	@Value("js")
	private String jsPath;
	@Value("css")
	private String cssPath;
	@Value("image")
	private String imagePath;
	@Value("upload")
	private String uploadPath;
	
	/**
	 * 初始化加载系统配置信息
	 */
	@Override
	public void init(ServletConfig conf) throws ServletException {
		 try {
			logger.info("Loading config files.");
			ServletContext application = this.getServletContext();
            String appPath = application.getRealPath("/");
            logger.info("appPath..." + appPath);

            // 把工程路径存入上下文、方便页面调用
            String path = application.getContextPath();
            if("/".equals(path.trim())){
            	path="";
            }
            application.setAttribute("ctxPath", path);
            application.setAttribute("adminPath", path + adminPath);
            application.setAttribute("commonPath", path + commonPath);
            application.setAttribute("webPath", path + webPath);
            application.setAttribute("jsPath", path + jsPath);
            application.setAttribute("cssPath", path + cssPath);
            application.setAttribute("imagePath", path + imagePath);
            application.setAttribute("uploadPath", path + uploadPath);
		 }catch (Exception e) {
            e.printStackTrace();
            logger.error("Loading config files failed.", e);
        }
	}
}
