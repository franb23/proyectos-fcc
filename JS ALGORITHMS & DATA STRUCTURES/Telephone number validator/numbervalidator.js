const phoneRegex = /^(1\s?)?(\(\d{3}\)|\d{3})([\s\-]?)\d{3}([\s\-]?)\d{4}$/;


const userInput = document.getElementById('user-input');
const checkBtn = document.getElementById('check-btn');
const clearBtn = document.getElementById('clear-btn');
const resultsDiv = document.getElementById('results-div');


checkBtn.addEventListener('click', () => {
    const inputValue = userInput.value.trim();

    if (!inputValue) {
        alert("Please provide a phone number");
        return;
    }

    if (!phoneRegex.test(inputValue)) {
        resultsDiv.textContent = `Invalid US number: ${inputValue}`;
    } else {
        resultsDiv.textContent = `Valid US number: ${inputValue}`;
    }
});


clearBtn.addEventListener('click', () => {
    userInput.value = '';
    resultsDiv.textContent = '';
});