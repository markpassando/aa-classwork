/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

window.$l = function (selector) {
  let matches = document.querySelectorAll(selector);
  let matchesArr = Array.from(matches);
  return new DOMNodeCollection(matchesArr);


};
document.addEventListener('DOMContentLoaded', () => {
  $l('ul').on('click', () => alert('clicked'));

} );
$l('ul').off('click');


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor (arr) {
    this.arr = arr;
  }

  html(string) {
    if (string || string === "") {
      this.arr.forEach((el) => {
        el.innerHTML = string;
      });
    } else {
      return this.arr[0];
    }
  }

  empty() {
    this.html("");
  }

  append(el) {
    this.arr.forEach((node) => {
      node.innerHTML += el;
    });
  }

  attr(attribute, val) {
    if (val !== undefined) {
      for (let i = 0; i < this.arr.length; i++) {
        this.arr[i].setAttribute(attribute, val);
        return val;
      }
    } else {
        return this.arr[0].getAttribute(attribute);
    }
  }

  addClass(...className) {
    this.arr.forEach((node) => {
      node.classList.add(...className);
    });
  }

  removeClass(...className) {
    this.arr.forEach((node) => {
      node.classList.remove(...className);
    });
  }

  children() {
    let kids = [];

    this.arr.forEach((node) => {
      kids = kids.concat(node.children);
    });

    return kids;
  }

  parent () {
    let parents = [];

    // this.arr.forEach((node) => {
    //   parents = parents.concat(node.parent);
    // });


    for (let i = 0; i < this.arr.length; i++) {
      if (!parents.length) {
        parents.push(this.arr[i].parentNode);
      } else {
        let inParents = false;

        for (let j = 0; j < parents.length; j++) {
          if (this.arr[i].parentNode === parents[j]) {
            inParents = true;
          }
        }

        if (!inParents) {
          parents.push(this.arr[i].parentNode);
        }
      }
    }

    return parents;
  }

  find (selector) {
    let found = [];

    this.arr.forEach((node) => {
      let findItem = node.querySelectorAll(selector);
      if (findItem.length > 0) {
        found.push(findItem);
      }
    });

    return found;
  }

  remove (){
    this.arr.forEach( (node) => {
      node.remove();
    });
  }

  on (e, callback) {
    this.arr.forEach( (node) => {
      node.myCallbacks[e] = callback;
      node.addEventListener(e, callback);
    });
  }

  off (e) {
    this.arr.forEach( (node) => {
      node.removeEventListener(e, node.myCallbacks[e]);
    });
  }

}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);