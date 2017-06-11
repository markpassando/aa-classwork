const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

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
