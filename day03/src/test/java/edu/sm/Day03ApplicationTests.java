package edu.sm;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
@Slf4j
class Day03ApplicationTests {
    // BCryptPasswordEncoder 빈을 주입
    @Autowired
    BCryptPasswordEncoder encoder;
    // StandardPBEStringEncryptor 빈을 주입
    @Autowired
    StandardPBEStringEncryptor textEncoder;

    // 테스트 메소드
    @Test
    void contextLoads() {
        // 원본 비밀번호 설정
        String pwd = "abc";
        // BCrypt를 사용하여 비밀번호 암호화
        String encPwd = encoder.encode(pwd);
        // 원본 비밀번호 로깅
        log.info("Pwd: {}", pwd);
        // 암호화된 비밀번호 로깅
        log.info("Enc Pwd: {}", encPwd);

        // 입력된 비밀번호 (검증용)
        String inputPwd = "abc";

        // 입력된 비밀번호와 암호화된 비밀번호 일치 여부 확인
        boolean result1 = encoder.matches(inputPwd, encPwd);
        // 일치 여부 결과 로깅
        log.info("result 1 : {}", result1);

        // "서울시"라는 텍스트를 암호화
        String encText = textEncoder.encrypt("서울시");
        // 암호화된 텍스트 로깅
        log.info("text Encoding 1 : {}", encText);
        // 암호화된 텍스트를 복호화하여 로깅
        log.info("text Decoding 1 : {}", textEncoder.decrypt(encText));
    }
}