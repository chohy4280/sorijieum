/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2019-10-11 07:58:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<!-- favicon 위치 -->\n");
      out.write("<link rel=\"shortcut icon\" href=\"/sori/resources/images/favicon.ico\">\n");
      out.write("<link rel=\"icon\" href=\"/sori/resources/images/favicon.ico\">\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>소리지음 메인페이지</title>\n");
      out.write("<style>\n");
      out.write("@font-face { font-family: 'S-CoreDream-7ExtraBold'; \n");
      out.write("\t\t\t src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); \n");
      out.write("\t\t\t font-weight: normal; \n");
      out.write("\t\t\t font-style: normal; }\n");
      out.write("\n");
      out.write("* { font-family: 'S-CoreDream-7ExtraBold';}\n");
      out.write("</style>\n");
      out.write("  <!-- 시맨틱유아이 cdn -->\n");
      out.write("\n");
      out.write(" <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css\">\n");
      out.write("  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js\"></script>\n");
      out.write("<link rel = \"stylesheet\" type=\"text/css\" href=\"/sori/resources/css/main.css\">\n");
      out.write("<style type=\"text/css\">\n");
      out.write("@font-face { font-family: 'S-CoreDream-7ExtraBold'; \n");
      out.write("\t\t\t src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-7ExtraBold.woff') format('woff'); \n");
      out.write("\t\t\t font-weight: normal; \n");
      out.write("\t\t\t font-style: normal; }\n");
      out.write("\n");
      out.write("* { font-family: 'S-CoreDream-7ExtraBold';}\n");
      out.write("\n");
      out.write(".wrapper {\n");
      out.write("\tz-index:1;\n");
      out.write("\tposition:relative;\n");
      out.write("\twidth:100%;\n");
      out.write("\theight:100%;\n");
      out.write("\t}\n");
      out.write("\t.wrapper:after{\n");
      out.write("\twidth:100%;\n");
      out.write("\theight:100%;\n");
      out.write("\tz-index:-1;\n");
      out.write("\tposition:absolute;\n");
      out.write("\ttop:0;\n");
      out.write("\tleft:0;\n");
      out.write("\tcontent:\"\";\n");
      out.write("\tbackground-image: url('/sori/resources/images/mainbook.jpg') ;\n");
      out.write("\tbackground-repeat:no-repeat;\n");
      out.write("\tbackground-position:center;\n");
      out.write("\tbackground-size: 100%; \n");
      out.write("\topacity: 1;\n");
      out.write("\t}\n");
      out.write("\n");
      out.write(".ui.cards {\n");
      out.write("\tfont-family: 'S-CoreDream-7ExtraBold';\n");
      out.write("}\n");
      out.write("\n");
      out.write(".ui.cards .card:hover{\n");
      out.write("\tbackground: #fbc21b; \n");
      out.write("\tbackground-opacity:0.4;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class=\"wrapper\">\n");
      out.write("<header>\n");
      out.write("<br>\n");
      out.write("<div align=\"right\" style=\"margin-top:10px;\">\n");
      out.write("   <button class=\"ui yellow button\" onclick=\"location.href='/sori/views/member/memberLoginView.jsp'\" style=\"font-family:'S-Core Dream 6';\">로그인</button>\n");
      out.write("   <button class=\"ui yellow button\" onclick=\"location.href='/sori/views/member/memberEnrollAgree.jsp'\" style=\"font-family:'S-Core Dream 6';\">회원가입</button> &nbsp;\n");
      out.write("</div>\n");
      out.write("</header>\n");
      out.write("<br>\n");
      out.write("<div class=\"ui four cards\" style=\"margin:10px 5% 0 5%\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("    \t<img onclick=\"location.href='/sori/index.jsp'\" src=\"/sori/resources/images/logo.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/sorijieumIntro.jsp'\" src=\"/sori/resources/images/사이트소개.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/booksearch/bookSearchList.jsp'\" src=\"/sori/resources/images/도서검색.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/bookmaking/bmmain.jsp'\" src=\"/sori/resources/images/도서제작.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>  \n");
      out.write("</div>\n");
      out.write("<div class=\"ui four cards\" style=\"margin:0 5% 0 5%\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/boardwishbook/wishbookListView.jsp'\" src=\"/sori/resources/images/도서신청.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/boardnotice/noticeListView.jsp'\" src=\"/sori/resources/images/공지사항.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/boardqna/qnaListView.jsp'\" src=\"/sori/resources/images/QNA.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"image\">\n");
      out.write("      \t<img onclick=\"location.href='/sori/views/boardfaq/faqListView.jsp'\" src=\"/sori/resources/images/FAQ.png\">\n");
      out.write("    </div>\n");
      out.write("  </div>  \n");
      out.write("</div>\n");
      out.write("<br><br>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
