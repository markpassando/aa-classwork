// warm up range
function range(start, end) {
  if (start > end)
    return [];
  if (start == end)
    return [start];
  let result = [];
  result.push(start);
  result = result.concat(range(start + 1, end));
  return result;

}

let result = range(1, 0);

console.log(result);

// exponentiation
function exp1(base, power) {
  if (power === 0)
    return 1;
  return exp1(base, power-1) * base;
}

function exp2(base, power) {
  if (power === 0)
    return 1;
  if (power % 2 === 0) {
    let sqrt = exp2(base, power/2);
    return (sqrt * sqrt);
  }
  else {
    let sqrt = exp2(base, Math.floor(power/2));
    return (sqrt * sqrt * base);
  }
}


let result = exp1(2, 0);

console.log(result);

// Fibonacci
function fib(n) {
  if (n === 1)
    return [0];
  if (n === 2)
    return [0, 1];

  let old_fib = fib(n-1);

  let new_fib = old_fib.slice(-1)[0] + old_fib.slice(-2, -1)[0];
  old_fib.push(new_fib);
  return old_fib;
}

let result = fib(19);

console.log(result);

//bsearch
function realSearch(array, target, start, end) {
  if (start > end )
    return null;
  if (start === end && array[start] === target)
    return start;
  if (start === end && array[start] !== target)
    return null;

  mid = Math.floor((start + end) / 2);

  if (target > array[mid])
    return realSearch(array, target, mid + 1, end);
  else if (target < array[mid])
    return realSearch(array, target, start, mid - 1);
  else
    return mid;
}

function bSearch(array, target) {
  end = array.length-1;
  return realSearch(array, target, 0, end);
}

let result = bSearch([1, 2, 3, 4, 5, 6], 6);

//iterative Greedy First
function makeSimpleChange(total, coins) {
  if (total === 0)
    return [];
  if (total < coins.slice(-1)[0]) {
    console.log("ERROR !");
    return;
  }

  let resultChange = [];

  let i = 0;
  while (i < coins.length && total > 0) {
    while (total >= coins[i]) {
      resultChange.push(coins[i]);
      total -= coins[i];
    }

    i++;
  }

    return resultChange;
}

let result = makeSimpleChange(14, [10, 7, 1]);

console.log(result);


//recursive greedy make change
function makeRecurChange(total, coins) {
  if (total === 0)
    return [];
  if (total < coins.slice(-1)[0]) {
    console.log("ERROR !");
    return [];
  }

  let resultChange = [];

  let i = 0;
  while (i < coins.length && total > 0) {
    if (total >= coins[i]) {
      resultChange.push(coins[i]);
      total -= coins[i];
      let remaiderCoins = makeRecurChange(total, coins);
      if (remaiderCoins.length > 0)
        resultChange = resultChange.concat(remaiderCoins);
        return resultChange;
    }
    i++;
  }
    return resultChange;
}

let result = makeRecurChange(12, [10, 7, 1]);

console.log(result);

// better version of make change
function makeBetterChange(total, coins) {
  if (total === 0)
    return [];
  if (total < coins.slice(-1)[0]) {
    console.log("ERROR !");
    return [];
  }

  let tempChange = [];
  let possibleCoins = [];

  let i = 0;
  while (i < coins.length && total > 0) {
    if (total < coins[i]) {
      i++;
      continue;
    } else {
      tempChange.push(coins[i]);
      total -= coins[i];
      let remaiderCoins = makeBetterChange(total, coins);
      if (remaiderCoins.length > 0)
        tempChange = tempChange.concat(remaiderCoins);
      if (possibleCoins.length === 0)
        possibleCoins = tempChange;
      if (tempChange.length < possibleCoins.length)
        possibleCoins = tempChange;
    i++;
    }

  }

    return possibleCoins;
}

let result = makeBetterChange(12, [10, 7, 1]);

console.log(result);

// Mergesort

function mergeSort(array) {
  if (array.length <= 1)
    return array;

  const mid = Math.floor(array.length / 2);
  const left = array.slice(0 , mid);
  const right = array.slice(mid);
  const sortedLeft = mergeSort(left);
  const sortedRight = mergeSort(right);
  return merge(sortedLeft, sortedRight);
}

function merge(left, right) {
  let result = [];

  while (left.length !== 0 && right.length !== 0 ) {
    if (left[0] < right[0]) {
      result.push(left.shift());

    } else if (left[0] === right[0]) {
      result.push(left.shift());

      result.push(right.shift());

    } else {
      result.push(right.shift());

    }
  }

  result = result.concat(left.concat(right));
  return result;
}
//
// let result = mergeSort([2, 1]);
const result = mergeSort([5, 7, 4, 1]);

console.log(result);

// subSet
function subSet(array) {
  if (array.length === 0 )
    return [[]];

  let result = [];

  const element = array.pop();
  let subs = subSet(array);
  let new_subs = subs.map( function(sub) {
  return sub.concat([element]);
  });
  return subs.concat(new_subs);
}


console.log(subSet([1, 2, 3]));
