<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/js/index.css"/>">


<script>
    $(document).ready(function () {
        js6.init();
    });
</script>

<div class="col-sm-10">
    <h2>회원가입</h2>
    <form id="signup_form">
        <legend>기본 정보</legend>
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" class="form-control" placeholder="아이디 입력" id="id" name="id" required>
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호:</label>
            <input type="password" class="form-control" placeholder="비밀번호 입력" id="pwd" name="pwd" required
                   pattern="(?=.*\d)(?=.*[a-z]).{8,}" title="최소 8자, 소문자, 숫자 포함">
        </div>
        <div class="form-group">
            <label for="pwd_confirm">비밀번호 확인:</label>
            <input type="password" class="form-control" placeholder="비밀번호 재입력" id="pwd_confirm" name="pwd_confirm"
                   required>
            <span id="pwd_match_message" class="error-message"></span>
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" class="form-control" placeholder="이름 입력" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" class="form-control" placeholder="이메일 입력" id="email" name="email" required>
                <span id="email_error" class="error-message"></span>
            </div>
            <fieldset>
                <legend>추가 정보</legend>
                <div class="form-group">
                    <label for="birthdate">생년월일:</label>
                    <input type="date" class="form-control" id="birthdate" name="birthdate">
                </div>
                <div class="form-group">
                    <label for="phone">전화번호:</label>
                    <input type="tel" class="form-control" placeholder="010-0000-0000" id="phone" name="phone"
                           pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
                </div>
                <div class="form-group">
                    <label for="profile_pic">프로필 사진:</label>
                    <input type="file" class="form-control-file" id="profile_pic" name="profile_pic" accept="image/*">
                </div>
                <div class="form-group">
                    <label for="gender">성별:</label>
                    <select class="form-control" id="gender" name="gender">
                        <option value="">선택하세요</option>
                        <option value="male">남성</option>
                        <option value="female">여성</option>
                        <option value="other">기타</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="interests">관심 상품:</label>
                    <input list="interest-options" class="form-control" id="interests" name="interests">
                    <datalist id="interest-options">
                        <option value="전자기기">
                        <option value="가전제품">
                        <option value="패션">
                        <option value="도서">
                    </datalist>
                </div>
            </fieldset>


            <div class="form-group">
                <label for="terms">이용약관:</label>
                <textarea class="form-control" id="terms" rows="1" readonly>당신의 개인정보를 팔아 넘기는 것에 동의하십니까?</textarea>
            </div>

            <div class="form-group">
                <label>
                    <input type="checkbox" name="agree_terms" required> 이용약관에 동의합니다
                </label>
            </div>

            <div class="form-group">
                <button type="button" class="btn btn-primary" id = btn_signup>가입</button>
                <button type="reset" class="btn btn-secondary">초기화</button>
            </div>

            <div class="form-group">
                <output name="registration_status"></output>
            </div>
        </div>
    </form>
</div>