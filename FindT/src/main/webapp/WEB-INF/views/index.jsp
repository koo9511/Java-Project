<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>koogunmo</title>

            <!-- main css -->
            <link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
            <!-- AOS cs -->
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <!-- jquery -->
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
            <script>
                $(document).ready(function(){
                    // setInterval(function(){
                    //     $('.main-circle-welcome').fadeOut()
                    // },2000)

                    $('.main-circle-welcome').fadeOut('fast')
                });

                function change_form(){
                    $('#login-content').toggleClass('hidden')
                    $('#enroll-content').toggleClass('hidden')
                    $('.enroll-email-hidden').addClass('hidden')

    
                    if(!$('#login-content').hasClass('hidden'))
                        $('.enroll-toggle-button').html('회원가입')
                    else 
                        $('.enroll-toggle-button').html('로그인')
                }
    
                function validate(){
                    var user_id = $('#login-id').val()
                    var user_pw = $('#login-pwd').val()
    
                    if(user_id == ''){
                        alert('아이디를 입력해주세요.')
                        $('#login-id').focus()
                        return false
                    }
    
                    if(user_pw == ''){
                        alert('비밀번호를 입력해주세요.')
                        $('#login-pwd').focus()
                        return false
                    }

                    var checkStatus = false;
                    $.ajax({
                        type:'post',
                        async: false,
                        data: {
                            user_id : user_id,
                            user_pw : user_pw
                        },
                        url: "login",
                        success: function(res){
                            // 100 : 비밀번호 일치
                            // 500 : 비밀번호 틀림
                            // 800 : 계정 비활성화됨
                            // 900 : 아이디 없음
                            switch(res){
                                case "100" : checkStatus = true; break;
                                case "500" : alert('아이디와 비밀번호가 일치하지 않습니다.');
                                             $('#login-pwd').focus(); break;
                                case "800" : alert('계정이 비활성화 되었습니다. 관리자에게 문의하세요.'); break;
                                default: alert('입력된 정보로 가입된 계정이 없습니다.');
                            }
                        }
                    })

                    return checkStatus;
                }

                function certValidate(){
                    var user_email = $('#enroll-email').val()
                    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

                    var vali_status = re.test(user_email)

                    if(vali_status == false){
                        alert('이메일 형식에 맞지 않습니다. 다시 입력해주세요.')
                        $('#enroll-email').focus()
                        return false
                    } else {
                        $.ajax({
                            type: 'post',
                            async: false,
                            data: {
                                email : user_email
                            },
                            url : "emailSMTP",
                            success : function(res){
                                if(res == "200"){
                                    alert('이미 사용중인 아이디입니다.')
                                    $('#enroll-email').focus()
                                    return false
                                } else {
                                    alert('인증번호가 발송되었습니다.')
                                    $('.enroll-desc-email').addClass('color-blue').html('사용 가능한 아이디입니다.').removeClass('color-red')
                                    $('.cert-check').removeClass('hidden')
                                    $('#idCheck').html('재전송')
                                    $('#enroll-email').attr('readonly',true)
                                    $('#enroll-code').focus()
                                }
                            }
                        })
                    }
                }

                function emailCheck(){
                    var user_email = $('#enroll-email').val()
                    var certKey = $('#enroll-code').val()

                    if(certKey.length != 10){
                        alert('인증번호 10자리를 정확히 입력해주세요.')
                        $('#enroll-code').focus()
                        return false
                    } else {
                        $.ajax({
                            type: 'post',
                            async: false,
                            data: {
                                user_email : user_email,
                                cert_key : certKey
                            },
                            url: "certCheck",
                            success: function(res){
                                if(res == "100"){
                                    alert('인증되었습니다.')
                                    $('.cert-check').addClass('hidden')
                                    $('#idCheck').addClass('hidden')
                                    $('#enroll-email').css('width','90%')
                                    $('#enroll-nickname').focus()
                                    $('.enroll-desc-code').addClass('color-blue').html('인증 되었습니다.').removeClass('color-red')
                                    return false
                                } else {
                                    alert('인증번호가 일치하지 않습니다.')
                                    $('.enroll-desc-code').addClass('color-red').html('인증번호를 입력해주세요.')
                                    $('#enroll-code').val("").focus()
                                    return false
                                }
                            }
                        })
                    }
                }

                function enrollDescBlur(str){
                    
                    $('.enroll-desc-'+str).css('visibility','visible');

                    if($('#enroll-'+str).val() == ""){

                        switch(str){
                            case "nickname" : $('.enroll-desc-'+str).html('닉네임을 입력해주세요.').addClass('color-red').removeClass('color-blue'); break;
                            case "pwd" : $('.enroll-desc-'+str).html('비밀번호를 입력해주세요.').addClass('color-red').removeClass('color-blue'); break;
                            case "pwd-cfm" : $('.enroll-desc-'+str).html('비밀번호를 확인 해주세요.').addClass('color-red').removeClass('color-blue');
                        }
                    }

                    if(str == "pwd"){
                        if($('#enroll-'+str).val().length < 6 || $('#enroll-'+str).val().length > 12){
                            $('.enroll-desc-'+str).html('비밀번호를 정해진 양식에 맞춰주세요 ( 6 ~ 12 자 이내 )').addClass('color-red');
                        } else {
                            $('.enroll-desc-'+str).html('사용 가능한 비밀번호 입니다.').addClass('color-blue').removeClass('color-red');
                        }
                    }

                    if(str == "nickname" && $('#enroll-'+str).val().length > 0){
                        $('.enroll-desc-'+str).html('사용 가능한 닉네임 입니다.').addClass('color-blue').removeClass('color-red');
                    }
                }

                function enroll_button_active(){
                    $('#signup-btn').toggleClass('enroll-email-hidden')
                    $('#signup-btn').toggleClass('hidden')

                    $('.enroll-desc-agree').toggleClass('color-red')
                    $('.enroll-desc-agree').toggleClass('color-blue')
                }

                function passCheck(){
                    var pass_one = $('#enroll-pwd').val()
                    var pass_two = $('#enroll-pwd-cfm').val()

                    if(pass_two.length > 0){
                        if(pass_one != pass_two){
                            $('.enroll-desc-pwd-cfm').html('비밀번호가 일치하지 않습니다.');
                            $('.enroll-desc-pwd-cfm').addClass('color-red').removeClass('color-blue')
                            return false
                        } else{
                            $('.enroll-desc-pwd-cfm').html('비밀번호가 일치합니다.');
                            $('.enroll-desc-pwd-cfm').removeClass('color-red').addClass('color-blue')
                        }
                    }

                    
                }

                function signupValidate(){
                    
                    if($('.enroll-desc:not(.enroll-desc-agree)').hasClass('color-red')){
                        alert('필수 기재 항목을 입력해주세요.');
                        return false;
                    } else {
                        var user_id = $('#enroll-email').val()
                        var user_nickname = $('#enroll-nickname').val()
                        var user_pw = $('#enroll-pwd').val()

                        $.ajax({
                            type: 'post',
                            async: false,
                            data: {
                                user_id : user_id,
                                user_pw : user_pw,
                                user_nickname : user_nickname
                            },
                            url: "userSignUp",
                            success: function(res){
                                if(res == "100"){
                                    var nowDate = new Date().toLocaleString()
                                    alert(nowDate + " 이용약관 동의처리 되었습니다.")
                                    alert('가입되었습니다.');
                                    location.reload()
                                    return false
                                } else {
                                    alert('가입 실패. 관리자에게 문의하세요.')
                                    return false
                                }
                            }
                        })



                    }
                }
    
            </script>
        </head>
    <body>
        
        <input type="checkbox" id="switch">
        <div class="app" data-aos="zoom-out">
        <div class="body">
            <div class="main-circle main-circle-welcome" style="z-index: 10;">
                <div id="welcome-msg"style="margin-top: 50%; width: 100%; text-align: center; vertical-align: middle; z-index: 10;">
                    <h2 data-aos="fade-down"  id="intro-korean" style="transition: 1000ms; color: white; font-weight: 600; font-size: 2em;font-family: 'InkLipquid' !important;">
                        스치면 인연, 스며들면 사랑</h2>
                    <h4 data-aos="fade-down"  id="intro-korean" style="margin-left: 25%; transition: 1000ms; font-weight: 600; transition-delay: 200ms;color: white; font-family: 'InkLipquid' !important;">- 잠자는 숲속의 공주 -</h4>  
                        
                    <br>
                    <h1  data-aos="fade-up"  style="transition: 1000ms; color: white; transition-delay: 500ms;">With U</h1>

                </div>
            </div>
            <div class="main-circle"></div>
            <div class="phone">
            <!-- Middle -->
            <div class="content" id="login-content">
                <div class="circle">
                    <div class="crescent"></div>
                </div>
                <p class="heading">With U</p><br>
                <div id="login-box">
                    <form action="index" onsubmit="return validate()">
                        <input id="login-id" name="login-id" type="email" class="login-input" placeholder="이메일">
                        <input id="login-pwd" name="login-pwd" type="password" class="login-input" placeholder="비밀번호">
                        <!-- <div id="login-check-box">
                            <input type="checkbox" id="remember-id">
                            <label for="remember-id" id="remember-id-chk">아이디 저장</label>
                        </div> -->
    
                        <button type="submit" class="button btn" id="login-btn" onclick="try_login()">로그인</button>
                    </form>
                </div>
    
                <label for="switch" class="toggle-switch">
                    <div class="toggle"></div>
                    <div class="names">
                        <p class="light">라이트</p>
                    <p class="dark">다크</p>
                </div>
                </label>
                <!-- choice theme -->
            </div>
            <div class="content hidden" id="enroll-content">
                <p class="heading">회원가입</p><br>
                <div id="login-box">
                    <h4 class="enroll-desc-email enroll-desc color-red">아이디로 사용할 이메일을 입력해주세요.</h4>
                    <input id="enroll-email" type="email" class="login-input enroll-input" placeholder="이메일" style="width: 70%;" onblur="enrollDescBlur('email')">
                    <button id="idCheck" type="button" class="button btn" style="font-size: 0.5em;" onclick="return certValidate()">인증요청</button>

                    <h4 class="enroll-desc-code cert-check enroll-desc enroll-email-hidden">이메일로 전송된 인증코드 10자리를 정확하게 입력해주세요.</h4>
                    <input id="enroll-code" type="text" class="cert-check enroll-hidden enroll-email-hidden login-input enroll-input" placeholder="이메일 인증 코드" style="width: 70%;" maxlength="10" onblur="enrollDescBlur(2)">
                    <button id="codeCheck" type="button" class="cert-check enroll-hidden enroll-email-hidden button btn" style="font-size: 0.5em;" onclick="emailCheck('code')">확인</button>

                    <h4 class="enroll-desc-nickname enroll-desc">사용할 닉네임을 입력해주세요.</h4>
                    <input id="enroll-nickname" type="text" class="enroll-hidden login-input enroll-input" placeholder="닉네임" onblur="enrollDescBlur('nickname')">

                    <h4 class="enroll-desc-pwd enroll-desc">아이디와 함께 사용할 비밀번호를 입력해주세요. ( 6 ~ 12 자 이내 )</h4>
                    <input id="enroll-pwd" type="password" class="login-input enroll-input" placeholder="비밀번호" onblur="enrollDescBlur('pwd')" minlength="6" maxlength="12">

                    <h4 class="enroll-desc-pwd-cfm enroll-desc">비밀번호를 한 번 더 입력해주세요.</h4>
                    <input id="enroll-pwd-cfm" type="password" class="login-input enroll-input" placeholder="비밀번호 확인" onblur="passCheck()" onblur="enrollDescBlur('pwd-cfm')" minlength="6" maxlength="12">
    
                    <h4 class="enroll-desc-agree enroll-desc color-red">아래의 이용 약관을 잘 읽고 동의해주세요.</h4>
                    <textarea id="agree-content" class="enroll-input" readonly>서비스를 사용하려면 만 14세 이상이어야 합니다. 폭력, 누드, 부분적 누드, 차별, 불법, 침해, 증오, 포르노 또는 선정적인 사진이나 기타 콘텐츠를 서비스를 통해 게시할 수 없습니다. 회원님은 본인의 계정을 통해 발생하는 모든 활동에 책임을 지고, 계정, 팔로워, 사용자 이름 또는 기타 계정에 관한 권리를 판매, 이전, 라이선스 또는 양도하지 않을 것에 동의합니다. 고용주나 고객을 대신하여 계정을 만들도록 명시적인 허가를 받은 사람 또는 회사를 제외하고, 'With U'은 이러한 계정 생성을 금지하며 회원님은 본인을 제외한 다른 사람을 위해 계정을 만들지 않을 것에 동의합니다. 또한 회원님은 가입 시 또는 그 외의 기간에 회원님이 'With U'에 제공하는 모든 정보가 사실이고, 정확하며, 최신의 것이며, 완전하다는 점을 진술하고, 사실성과 정확성을 유지하기 위해 필요할 경우 정보를 수정할 것에 동의합니다. 회원님은 다른 'With U' 사용자들의 로그인 정보를 요청, 수집 또는 사용하지 않을 것에 동의합니다. 회원님은 비밀번호의 기밀성과 안전성을 유지할 책임이 있습니다. 회원님은 사람이나 단체를 폄하, 스토킹, 괴롭힘, 악용, 학대, 협박, 사칭 또는 위협할 수 없으며, 서비스를 통해 본인이나 다른 사람의 신용카드 정보, 사회보장번호 또는 그 대신 사용되는 국민 식별 번호, 전체 공개되지 않은 전화번호나 이메일 주소 등 사적인 정보나 기밀 정보를 게시할 수 없습니다. 서비스를 불법적으로 또는 승인되지 않은 목적으로 이용할 수 없습니다. 회원님은 저작권법을 포함하되 이에 국한되지 않는, 서비스 및 콘텐츠(아래에 정의) 사용에 적용되는 모든 법률, 규칙, 규정(예: 연방, 주, 도)을 준수할 것에 동의합니다. 회원님 본인의 행동, 모든 데이터, 텍스트, 파일, 정보, 사용자 이름, 이미지, 그래픽, 사진, 프로필, 오디오 및 동영상 클립, 사운드, 음악 작업, 저작물, 앱, 링크, 회원님이 서비스에 또는 서비스를 통해 제출, 게시 또는 표시하는 기타 콘텐츠 또는 자료("콘텐츠"로 통칭)에 대해서는 회원님이 전적으로 책임을 집니다. 회원님은 서비스 또는 'With U'과 연관되어 있다는 허위 사실을 표시하기 위하여 서비스를 변경, 수정, 각색 또는 개조하거나 다른 웹사이트를 변경, 수정 또는 개조해서는 안 됩니다.
    'With U'이 허용한 방식이 아닌 다른 방식으로 'With U'의 비공개 API에 액세스해서는 안 됩니다. 'With U'의 API 사용에는 별도의 약관이 적용되며, 해당 약관은 여기("API 약관")에서 확인할 수 있습니다.
    원치 않은 이메일, 댓글, 좋아요 또는 다른 형태의 영리적이거나 타인을 괴롭히는 커뮤니케이션("스팸")을 다른 'With U' 사용자를 대상으로 만들거나 전송할 수 없습니다.
    'With U'의 사전 서면 동의 없이 도메인 이름 또는 웹 URL을 사용해서는 안 됩니다.
    웜, 바이러스, 스파이웨어, 악성 코드 또는 기타 파괴적이거나 방해를 야기하는 코드를 전송하는 등의 행위를 통해 서비스 또는 서비스에 연결된 서버나 네트워크에 개입하거나 이를 방해해서는 안 됩니다. 'With U' 페이지가 사용자의 브라우저나 기기에 렌더링 또는 표시되는 방식에 콘텐츠나 코드를 삽입하거나 수정 또는 방해할 수 없습니다.
    회원님은 반드시 'With U'의 커뮤니티 가이드라인을 준수해야 합니다.
    자동화된 기기, 스크립트, 봇, 스파이더, 크롤러, 스크레이퍼 사용 등을 포함하되 이에 국한되지 않는, 승인되지 않은 방식으로 서비스에 계정을 만들 수 없습니다.
    다른 사용자가 서비스를 사용하거나 즐기지 못하도록 제한해서는 안 되며, 이 이용 약관이나 기타 'With U' 약관의 위반을 유도 또는 조장해서는 안 됩니다.
    당사 서비스 이용자는 해당 이용 약관 및 'With U' 정책을 따라야 합니다. 회원님이 'With U'에 게시한 콘텐츠나 정보는 이 이용 약관, 'With U' 정책('With U' 커뮤니티 가이드라인 포함)에 위배된다고 판단되거나 법률에 따라 요구되는 경우 삭제될 수 있습니다. 회원님이 명백히, 심각하게 또는 반복적으로 이 이용 약관이나 'With U'의 정책, 커뮤니티 가이드라인을 위반하는 경우, 반복적으로 타인의 지적 재산권을 침해하는 경우 또는 법률에 따라 요구되는 경우, 'With U' 서비스의 전체 또는 일부 제공을 즉시 거절하거나 중단할 수 있습니다. 회원님의 계정을 비활성화시키는 경우, 이메일을 이용해서 또는 회원님이 계정에 로그인할 때 이러한 사실을 고지할 것입니다. 회원님은 언제든 본인의 계정을 삭제하거나 앱을 비활성화할 수 있습니다.
                    </textarea>
                    <div id="login-check-box" class="input-group">
                        <input type="checkbox" id="agree" hidden onclick="enroll_button_active()" />
                        <label for="agree" class="checkbox" id="agree-chk">
                            <span class="icon"></span>
                            <span class="text">약관에 동의합니다</span>
                        </label>
                    </div>
    
                    <button class="button btn enroll-email-hidden" id="signup-btn" onclick="return signupValidate()">가입하기</button>
                </div>
    
    
                <!-- <label for="switch" class="toggle-switch">
                <div class="toggle"></div>
                <div class="names">
                    <p class="light">라이트</p>
                    <p class="dark">다크</p>
                </div>
                </label> -->
                <!-- choice theme -->
            </div>
            <!-- Bottom --> 
            <div class="skip">
                <p class="enroll-toggle-button" onclick="change_form()">회원가입</p>
                <p>With U</p>
            </div>
            </div>
        </div>
        </div>
    
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
        AOS.init();
        </script>
    </body>
    
    </html>
    
