//uniq

function myUniq (array) {
  let result = [];

  array.forEach((el) => {
    if (!result.includes(el)) {
      result.push(el);
    }
  });

  return result;
}

myUniq([1,1,2,3,4,1]);


//twosum
function twoSum (array) {
  let result = [];

  for (let i=0; i < array.length-1; i++ ) {
    for (let j=i+1; j < array.length; j++){
      if (array[i] + array[j] === 0) {
        result.push([i, j]);
      }
    }
  }

  return result;
}

twoSum([-1, 0, 2, -2, 1]);


// transpose
function transpose (array) {
  let result = [];

  for (let i = 0; i < array.length; i++ ) {
    result[i] = [];
    for (let j = 0; j < array.length; j++ ) {
      result[i].push(array[j][i]);
    }
  }

  return result;
}

let rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];


transpose(rows);


// my each
function myEach (array, callback) {
  let i = 0;
  while (i < array.length) {
    callback(array[i]);
    i++;
  }
}


myEach([1,2,3,4], function(el) {
  console.log(el * 10);
});

// my map
function realMyMap (array, callback) {
  let result = [];

  myEach(array, (el) => {
    result.push(callback(el));
  });

  return result;
}

function dumbMyMap (array, callback) {
  let result = [];
  for (let i = 0; i < array.length; i++) {
    result.push(callback(array[i]));
  }

  return result;
}

let result = realMyMap([1,2,3,4], function(el) {
  return el * 10;
});

console.log(result);

// my inject
function myInject(array, callback) {
  let accu = array[0];

  myEach(array.slice(1), (el) => {
    accu += (callback(el));
  });

  return accu;


}

let result1 = myInject([1,2,3,4], function(el) {
  return el;
});

console.log(result1);


//bubble sort
function bubbleSort(array) {

  for (let tail = array.length-1; tail > 0; tail-- ) {
    for (let i = 0; i < tail; i++ ) {
      if (array[i] > array[i+1]) {
        let temp = array[i];
        array[i] = array[i+1];
        array[i+1] = temp;
      }
    }
  }
  return array;
}

let sortResult = bubbleSort([4, 3, 6, 7, 9, 2]);

console.log(sortResult);

//substrings
function subStrings (string) {
  let result = [];

  for (let start = 0; start < string.length; start++ ) {
    for (let end = start; end < string.length; end++ ) {
      let sub = string.slice(start, end + 1);
      if (!result.includes(sub))
        result.push(sub);
    }
  }

  return result;
}

let substr = subStrings("Hello");

console.log(substr);
