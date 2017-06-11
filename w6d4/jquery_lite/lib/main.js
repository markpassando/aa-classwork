const DOMNodeCollection = require('./dom_node_collection');

window.$l = function (selector) {
  let matches = document.querySelectorAll(selector);
  let matchesArr = Array.from(matches);
  return new DOMNodeCollection(matchesArr);


};
document.addEventListener('DOMContentLoaded', () => {
  $l('ul').on('click', () => alert('clicked'));

} );
$l('ul').off('click');
