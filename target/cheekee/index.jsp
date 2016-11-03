<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">

    <section>
        <!-- Main content area -->
        <div id="section-main">
            <div class="section-main-container">
                <div class="">
                    BlogImage
                </div>
                <div>
                    RecentBlog
                </div>
            </div>
            <div class="section-main-container">
                <div>
                    IdeaImage
                </div>
                <div>
                    RecentIdea
                </div>
            </div>
            <div class="section-main-container">
                <div>
                    LabImage
                </div>
                <div>
                    RecentLab
                </div>
            </div>
        </div>
    </section>

    </layout:put>
</layout:extends>