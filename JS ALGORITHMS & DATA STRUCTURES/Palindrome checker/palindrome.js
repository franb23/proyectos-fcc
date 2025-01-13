
const textInput = document.getElementById('text-input');
const checkBtn = document.getElementById('check-btn');
const result = document.getElementById('result');


function checkPalindrome() {
    const inputText = textInput.value.trim();
    
    if (inputText === "") {
        alert("Please input a value");
        return;
    }

    const cleanedText = inputText.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();

    if (cleanedText === cleanedText.split('').reverse().join('')) {
        result.textContent = `${inputText} is a palindrome`;
    } else {
        result.textContent = `${inputText} is not a palindrome`;
    }
}


checkBtn.addEventListener('click', checkPalindrome);