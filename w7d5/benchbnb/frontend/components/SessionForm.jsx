import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			username: "",
			password: ""
		};

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => {
      this.setState({[field]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    debugger
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    const { formType, errors } = this.props;

    let otherForm;
    if (formType === '/login') {
      otherForm = <Link to='/signup'>Sign Up</Link>;
    } else {
      otherForm = <Link to='/login'>Log In</Link>;
    }

    const showErrors = errors.map( (el) => {
      return <li>{el}</li>;
    });

    return (
      <div>
        <h2>{formType}</h2>
        <div>
          <ul>
            {showErrors}
          </ul>
        </div>
        <form onSubmit={this.handleSubmit}>
          <label> Username:
          <input onChange={this.update("username")} value={this.state.username} />
          </label>

          <label> Password:
          <input onChange={this.update("password")} value={this.state.password} />
          </label>

          <input type="submit" value={formType}/>
        </form>
      </div>
    );
  }
}

export default SessionForm;
