<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <style>

        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>
            <form>
                <section>

                    <%--이름, 이메일, 비밀번호, 본문 정도?
                    댓글기능이 잘 되야함 (데이터베이스 관계 잘 생각해야할 듯)
                    보여질 때는 날짜, 답글달기
                    관리자는 수정,삭제 권한
                    작성자 본인(비밀번호로 확인)은 수정, 삭제 권한--%>

                    <!-- 입력공간 -->
                    <div>
                        <div>
                            Name : <input type="text">
                            Password : <input type="text">
                        </div>
                        <div>
                            <textarea placeholder="글을 남겨주세요."></textarea>
                        </div>
                        <div>전송아이콘</div>
                    </div>

                </section>
            </form>
        </section>

    </layout:put>
</layout:extends>