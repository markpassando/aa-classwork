export const fetchBenches = (filters) => {
  return $.ajax({
  method: 'GET',
  url: '/api/benches/',
  data: filters
  });
};

// export const fetchBenches = () => {
//   return $.ajax({
//   method: 'GET',
//   url: '/api/benches/',
//   });
// };

export const postBench = (bench) => {
  return $.ajax({
  method: 'POST',
  url: '/api/benches/',
  data: bench
  });
};


//   $.ajax({
//   method: 'GET',
//   url: '/api/benches/',
// }).then((res) => console.log(res), () => console.log("no good"));
//
//   $.ajax({
//   method: 'POST',
//   url: '/api/benches/',
//   data: { bench: { description: "Test Bench", lat: 40.742814, long: -73.998426 } }
// }).then((res) => console.log(res), () => console.log("no good"));
