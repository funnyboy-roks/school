const sorted = (arr) => {
	let out = true;
	Array.from({ length: arr.length - 1 }).forEach((_, i) => {
		if (arr[i] > arr[i + 1]) {
			out = false;
		}
	});
	return out;
};

const bubbleSort = (arr) => {
	while (!sorted(arr)) {
		arr.forEach((v, i) => {
			if (i === arr.length) return;

			if (v > arr[i + 1]) {
				arr[i] = arr[i + 1];
				arr[i + 1] = v;
			}
		});
	}
	return arr;
};

console.log(bubbleSort([4, 3, 2, 1]));
