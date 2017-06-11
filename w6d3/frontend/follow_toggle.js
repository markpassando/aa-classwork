// console.log('YOOOOOO');
const APIUtil = require('./api_util.js');

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
