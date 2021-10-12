
const mergeSort = (array: number[]): number[] => {
    if (array.length <= 1) {
        return array;
    }

    const middle = Math.floor(array.length / 2);
    const left = array.slice(0, middle);
    const right = array.slice(middle);

    return merge(
        mergeSort(left),
        mergeSort(right)
    );
};

const merge = (left: number[], right: number[]): number[] => {
    const result: any[] = [];

    while (left.length > 0 && right.length > 0) {
        if (left[0] <= right[0]) {
            result.push(left.shift());
        } else {
            result.push(right.shift());
        }
    }

    while (left.length > 0) {
        result.push(left.shift());
    }
    while (right.length > 0) {
        result.push(right.shift());
    }

    return result;
};

const isSorted = (array: number[]): boolean => {
    for (let i = 1; i < array.length; i++) {
        if (array[i] < array[i - 1]) {
            return false;
        }
    }
    return true;
};

const og: number[] = [];

for (let i = 0; i < 20; ++i) {
    og.push(Math.floor(Math.random() * 100));
}

const sorted = mergeSort(og);

console.log(og);
console.log(mergeSort(og));
console.log(isSorted(sorted));