const strReverse = (s) => {
    return s.length > 1 ? strReverse(s.substring(1)) + s[0] : s;
}

const isPalendrome = s => s == strReverse(s);

console.log('hello', isPalendrome('hello'));
console.log('abcba', isPalendrome('abcba'));
