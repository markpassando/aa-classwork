import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props){
    super(props);

    this.handleLogOut = this.handleLogOut.bind(this);
  }

  handleLogOut(e) {
    e.preventDefault();
    this.props.logout();
  }

  render() {
    const { currentUser } = this.props;

    const greetingMessage = () => {
      if ( currentUser ) {
        return (
          <div>
            <p> Hello {currentUser.user} </p>
            <button onClick={this.handleLogOut} >Log Out</button>
          </div>
        );
      } else {
        return (
          <div>
            <Link to='/login' >Log In</Link><br />
            <Link to='/signup' >Sign Up</Link>
          </div>
        );
      }
    };

    return (
      <div>
        { greetingMessage() }
      </div>
    );
  }
}

export default Greeting;
