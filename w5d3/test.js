"use strict";

function subSet(array) {
  debugger;
  if (array.length === 0 )
    return [[]];

  let result = [];

  const element = array.pop();
  let subs = subSet(array);
  let new_subs = subs.map( function(sub) {
  return sub.push(element);
  });
  return subs.concat(new_subs);

}


console.log(subSet([1, 2]));
