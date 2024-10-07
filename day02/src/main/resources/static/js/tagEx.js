function showAlert() {
    alert("버튼이 클릭되었습니다!");
}
document.getElementById('sampleForm').addEventListener('submit', function(event) {
    var password = document.getElementById('password').value;
    if (password.length < 8) {
        alert('비밀번호는 8자 이상이어야 합니다.');
        event.preventDefault();
    }
});