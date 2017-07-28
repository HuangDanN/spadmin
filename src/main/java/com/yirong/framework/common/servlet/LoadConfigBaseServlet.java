package com.yirong.framework.common.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.yirong.framework.common.system.SystemParaUtil;

@WebServlet
public class LoadConfigBaseServlet extends HttpServlet {

	private static final long serialVersionUID = 3150775186972209295L;

	private static final Logger logger = LoggerFactory.getLogger(LoadConfigBaseServlet.class);
	
	@Autowired
	private SystemParaUtil systemParaUtil;
	
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
            application.setAttribute("adminPath", path + systemParaUtil.getAdminPath());
            application.setAttribute("commonPath", path + systemParaUtil.getCommonPath());
            application.setAttribute("webPath", path + systemParaUtil.getWebPath());
            application.setAttribute("jsPath", path + systemParaUtil.getJsPath());
            application.setAttribute("cssPath", path + systemParaUtil.getCssPath());
            application.setAttribute("imagePath", path + systemParaUtil.getImagePath());
            application.setAttribute("uploadPath", path + systemParaUtil.getUploadPath());
		 }catch (Exception e) {
            e.printStackTrace();
            logger.error("Loading config files failed.", e);
        }
	}
}
