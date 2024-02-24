// 5. Create a form that gets input of several lines of text and a search character.On clicking
// the search button in the client form invoke suitable script function to display the number
// of occurrences of the character in the text using suitable string methods.

function count(){
    var c = 0;
    let TextArea = document.getElementById('area1').value
    let SearchText = document.getElementById('searchkey').value
    let TextArray = TextArea.split(" ")
    TextArray.forEach(word => {
        if(word.toLowerCase() === SearchText.toLowerCase()){
            c=c+1;
        }
    });
    let h3 = document.createElement('h3');
    h3.textContent = "Total counts of "+SearchText+" is "+c;
    let counts = document.getElementById('counts')
    counts.appendChild(h3);
}


// 4. Write a JavaScript program to change the background color by generating a random
// hexadecimal color code.
let Changeclr = document.getElementById('Changeclr');
Changeclr.addEventListener('click', function () {
    var colour = "#";
    var hexcode = "0123456789ABCDEF";
    for (let i = 0; i <= 5; i++) {
        let randomInRange = Math.floor(Math.random() * 16);
        colour += hexcode[randomInRange];
    }
    console.log(colour)
    document.body.style.backgroundColor = colour;
});

// 1.Write a java script function that print all combination of strings
let strings = ['a', 'b', 'c'];
let allCombinations = printCombinations(strings);
console.log(allCombinations);
function printCombinations(strings) {
    let combinations = [];
    function generateCombinations(currentCombo, index) {
        if (index === strings.length) {
            combinations.push(currentCombo);
            return;
        }
        generateCombinations(currentCombo, index + 1); 
        generateCombinations(currentCombo + strings[index], index + 1);
    }
    generateCombinations('', 0);
    return combinations;
}

// 2. Write a java script program to find out duplicate elements in an array.
let array = [1, 2, 3, 2, 4, 5, 3, 6];
let duplicates = findDuplicates(array);
console.log("Duplicate elements:", duplicates);
function findDuplicates(array) {
    let duplicates = {};
    let result = [];
    array.forEach(function (element) {
        if (duplicates[element]) {
            if (duplicates[element] === 1) {
                result.push(element);
            }
            duplicates[element]++;
        } else {
            duplicates[element] = 1;
        }
    });
    return result;
}

// 3. Write a java script function to add two complex numbers[create complex number as
//     objects]
let complex1 = { real: 2, imaginary: 3 };
let complex2 = { real: 1, imaginary: 2 };
let result = addComplexNumbers(complex1, complex2);
console.log("Result:", result);
function addComplexNumbers(complex1, complex2) {
    let realPart = complex1.real + complex2.real;
    let imaginaryPart = complex1.imaginary + complex2.imaginary;
    return { real: realPart, imaginary: imaginaryPart };
}
