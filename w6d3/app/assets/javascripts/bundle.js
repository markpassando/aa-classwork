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

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

$( () => {

  $('button.follow-toggle').each((index, el) => {
    new FollowToggle( $(el) );
  });

  $('nav.users-search').each( (index, el) => {
    new UsersSearch( $(el) );
  });


});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

// console.log('YOOOOOO');
const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor($el) {
    this.userID = $el.data('user-id');
    this.followState = $el.data('initial-follow-state');
    // debugger
    this.$el = $el;
    this.render();
    this.handleClick();
    // this.render.call(this);
  }

  render() {
    if (this.followState === false) {
      this.$el.text("Follow!");
    } else {
      this.$el.text("Unfollow!");
    }
  }

  handleClick() {
    this.$el.on('click', (e) => {
      e.preventDefault();
      $(e.currentTarget).prop('disabled', true);

      // let method;
      if (this.followState === false) {
        // method = 'POST';
        APIUtil.followUser(this.userID)
        .then(this.success.bind(this), this.failure)
        .always( this.enable_button.bind(this) );
      } else {
        // method = 'DELETE';
        APIUtil.unfollowUser(this.userID)
        .then(this.success.bind(this), this.failure)
        .always( () => this.enable_button() );
        // .done(this.enable_button( $(e.currentTarget) ));
      }

      // debugger
      // $.ajax({
      //   method: method,
      //   url: `/users/${this.userID}/follow`,
      //   dataType: 'JSON',
      //   data: { user_id: this.userID }
      // })
      // .then(this.success.bind(this), () => console.log("NOT GOOODDD"));
    });
  }

  success() {

    if (this.followState === false) {
      this.followState = true;
      // this.$el.attr("data-initial-follow-state", "true");
    } else {
      this.followState = false;
      // this.$el.attr("data-initial-follow-state", "false");
    }

    this.render();
    // this.enable_button( this.$el );
    console.log("GOOODDD");
  }

  failure() {
    console.log("NOT GOOODDD");
  }

  enable_button(){
    this.$el.prop('disabled', false);
  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: 'JSON',
      data: { user_id: id }
    });
  },

  unfollowUser: id => {
    return $.ajax({
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: 'JSON',
      data: { user_id: id }
    });
  },

  searchUser: (queryVal, success) => {
    return $.ajax({
      method: 'GET',
      url: `/users/search`,
      dataType: 'JSON',
      data: { query: queryVal },
      success: success
    });
  },


};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

class UsersSearch {
    constructor($el) {
      this.$el = $el;
      this.input = $el.find('input[type=text]');
      this.ul = $el.find('ul.users');
      this.handleInput();
    }

    handleInput() {
      this.input.on('keyup', (e) => {
        console.log("typing");
        let queryVal = $(e.currentTarget).val();

        // APIUtil.searchUser(queryVal, (users) => console.log(users));
        APIUtil.searchUser(queryVal, this.appendUsers.bind(this));
      });
    }

    appendUsers(users) {
      debugger
      this.ul.empty();
      users.forEach((user) => {
        // this.ul.append($('<li>'));
        // let $button = $('<button>')
        // .addClass('follow-toggle')
        // .attr('data-user-id')
        this.ul.append(`<li>${user.username}</li>`);
      });
    }
}


module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map