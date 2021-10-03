// const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const arr: number[] = [];

for (let i = 0; i < 20; i++) {
    arr.push(i * 3 + 2);   
}

// arr.sort((a, b) => a - b);

console.log(arr);

const binarySearch = (
    arr: number[],
    target: number,
    min: number = 0,
    max: number = arr.length,
): number => {
    const midpt = Math.floor((min + max) / 2)
    if(midpt === min && min !== 0) return -1;
    const mid = arr[midpt];
    if(mid === target) {
        return midpt;
    } else if(mid <= target) {
        return binarySearch(arr, target, midpt, max);
    } else if(mid >= target) {
        return binarySearch(arr, target, min, midpt);

    }
    return -1;
}

arr.forEach(val => {
    console.log(`Binary Search - ${val} = ${binarySearch(arr, val)}`);
});

console.log(binarySearch(arr, 20));