var signIn = document.getElementById('sign_in');
var signUp = document.getElementById('sign_up');
var loginModal = document.getElementById('login_modal');
var signUpModal = document.getElementById('signUp_modal');
var closeBtn = document.getElementById('close_btn');
var closeBtnn = document.getElementById('close_btnn');


signIn.onclick = function () {
loginModal.style.display = 'inherit';
};

closeBtn.onclick = function () {
loginModal.style.display = 'none';
};

signUp.onclick = function () {
signUpModal.style.display = 'inherit';
};

closeBtnn.onclick = function () {
signUpModal.style.display = 'none';
};

