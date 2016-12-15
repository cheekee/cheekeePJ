<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="import" type="REPLACE">
        <style>

            input[type=text], input[type=password] {
                width: 300px;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
                clear: both;;
            }

            button {
                background-color: #26519e;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 355px;
            }

            button:hover {
                background-color: #1c3c75;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
            }

            .container {
                padding: 16px;
                text-align: center;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media only screen and (max-width: 560px) {

                img.avatar {
                    width: 120px;
                }

                input[type=text], input[type=password] {
                    width: 170px;
                }

                button {
                    width: 223px;
                    margin-bottom: 100px;
                }

            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">

        <section>

            <form>
                <div class="imgcontainer">
                    <img src="/resources/image/login.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">
                    <div>
                    <label><b>Username</b></label>
                    <input type="text" placeholder="Enter User Id" name="memberId" required>
                    </div>
                    <div>
                    <label><b>Password</b></label>
                    <input type="password" placeholder="Enter User Password" name="memberPw" required>
                    </div>
                    <div>
                    <button id="loginBtn" type="button">Login</button>
                    </div>
                </div>

            </form>

        </section>

    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            $(document).ready(function(){
                $('#loginBtn').click(function(){
                    // ajax로 체크 후 관리자만 로그인 후 홈으로 login.do
                    // 실패하면 화면 유지  , 경고창만
                });
            });

        </script>
    </layout:put>
</layout:extends>