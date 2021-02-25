var signIn = document.getElementById('sign_in');
var loginModal = document.getElementById('login_modal');
var closeBtn = document.getElementById('close_btn');

signIn.onclick = function () {
loginModal.style.display = 'inherit';
};

closeBtn.onclick = function () {
loginModal.style.display = 'none';
};