<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML 태그 예시</title>
    <link href="/css/tagEx.css" rel="stylesheet">
    <script src="/js/tagEx.js"></script>
</head>

<body>
<div class="container">
    <header>
        <h1>HTML 태그 예시 페이지</h1>
        <nav>
            <ul>
                <li><a href="#text">텍스트 관련 태그</a></li>
                <li><a href="#list">목록 태그</a></li>
                <li><a href="#table">표 태그</a></li>
                <li><a href="#form">폼 태그</a></li>
                <li><a href="#media">미디어 태그</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="text">
            <h2>텍스트 관련 태그</h2>
            <p>이것은 <strong>굵은 텍스트</strong>입니다.</p>
            <p>이것은 <em>기울어진 텍스트</em>입니다.</p>
            <p>이것은 <u>밑줄 친 텍스트</u>입니다.</p>
            <p>이것은 <mark>하이라이트된 텍스트</mark>입니다.</p>
            <p>아래첨자: H<sub>2</sub>O</p>
            <p>위첨자: E=mc<sup>2</sup></p>
        </section>

        <section id="list">
            <h2>목록 태그</h2>
            <h3>순서 없는 목록</h3>
            <ul>
                <li>사과</li>
                <li>바나나</li>
                <li>오렌지</li>
            </ul>

            <h3>순서 있는 목록</h3>
            <ol>
                <li>첫 번째 항목</li>
                <li>두 번째 항목</li>
                <li>세 번째 항목</li>
            </ol>

            <h3>정의 목록</h3>
            <dl>
                <dt>HTML</dt>
                <dd>웹 페이지의 구조를 정의하는 마크업 언어</dd>
                <dt>CSS</dt>
                <dd>웹 페이지의 스타일을 정의하는 스타일 시트 언어</dd>
            </dl>
        </section>

        <section id="table">
            <h2>표 태그</h2>
            <table>
                <caption>직원 정보</caption>
                <thead>
                <tr>
                    <th>이름</th>
                    <th>부서</th>
                    <th>이메일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>홍길동</td>
                    <td>개발팀</td>
                    <td>hong@example.com</td>
                </tr>
                <tr>
                    <td>김철수</td>
                    <td>디자인팀</td>
                    <td>kim@example.com</td>
                </tr>
                </tbody>
            </table>
        </section>

        <section id="form">
            <h2>폼 태그</h2>
            <form action="/submit" method="post" id="sampleForm">
                <div class="form-group">
                    <label for="username">사용자 이름:</label>
                    <input type="text" id="username" name="username" required minlength="3" maxlength="20">
                </div>

                <div class="form-group">
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" required minlength="8">
                </div>

                <div class="form-group">
                    <label for="age">나이:</label>
                    <input type="number" id="age" name="age" min="18" max="100">
                </div>

                <div class="form-group">
                    <label for="birthdate">생년월일:</label>
                    <input type="date" id="birthdate" name="birthdate">
                </div>

                <div class="form-group">
                    <label for="country">국가:</label>
                    <select id="country" name="country">
                        <option value="">선택하세요</option>
                        <option value="kr">대한민국</option>
                        <option value="us">미국</option>
                        <option value="jp">일본</option>
                        <option value="cn">중국</option>
                    </select>
                </div>

                <fieldset>
                    <legend>성별:</legend>
                    <input type="radio" id="male" name="gender" value="male">
                    <label for="male">남성</label>
                    <input type="radio" id="female" name="gender" value="female">
                    <label for="female">여성</label>
                    <input type="radio" id="other" name="gender" value="other">
                    <label for="other">기타</label>
                </fieldset>

                <fieldset>
                    <legend>관심사:</legend>
                    <input type="checkbox" id="sports" name="interests" value="sports">
                    <label for="sports">스포츠</label>
                    <input type="checkbox" id="music" name="interests" value="music">
                    <label for="music">음악</label>
                    <input type="checkbox" id="movies" name="interests" value="movies">
                    <label for="movies">영화</label>
                </fieldset>

                <div class="form-group">
                    <label for="bio">자기소개:</label>
                    <textarea id="bio" name="bio" rows="4"></textarea>
                </div>

                <div class="form-group">
                    <label for="avatar">프로필 사진:</label>
                    <input type="file" id="avatar" name="avatar" accept="image/*">
                </div>

                <div class="form-group">
                    <label for="color">좋아하는 색상:</label>
                    <input type="color" id="color" name="color">
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" name="agree" required>
                        이용약관에 동의합니다.
                    </label>
                </div>

                <input type="hidden" name="form_id" value="registration_form_v1">

                <input type="submit" value="제출">
            </form>

            <script>

            </script>
        </section>

        <section id="media">
            <h2>미디어 태그</h2>
            <h3>이미지</h3>
            <img src="/api/placeholder/300/200" alt="플레이스홀더 이미지">

            <h3>오디오</h3>
            <audio controls>
                <source src="audio_file.mp3" type="audio/mpeg">
                Your browser does not support the audio element.
            </audio>

            <h3>비디오</h3>
            <video width="320" height="240" controls>
                <source src="video_file.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 HTML 예시 페이지. All rights reserved.</p>
    </footer>
</div>

<script>
    // 페이지가 로드된 후 실행될 JavaScript 코드
    document.addEventListener('DOMContentLoaded', function() {
        console.log('페이지가 완전히 로드되었습니다.');
    });
</script>
</body>

</html>