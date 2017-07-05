import React from 'react';
import {connect} from 'react-redux';
import { createPost } from '../actions/post_actions';

class CreatePostForm extends React.Component {
  constructor(props) {
    super(props);
    this.state =  {
      title: '',
      body: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => {
      this.setState({[field]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const post = this.state;
    this.props.createPost({post});
    this.setState({ title: '', body: '' });
    // this.props.createPost({post}).then(action => this.props.history.push("/"));
  }

  render() {

    return (
      <div className="form">
        <h2>Create Post Form</h2>
        <form onSubmit={this.handleSubmit}>
          <div className="form-inputs">
            <label>Title</label>
            <input onChange={this.update("title")} value={this.state.title} />
          </div>

          <br />
            <div className="form-inputs">
              <label>Body</label>
              <input onChange={this.update("body")} value={this.state.body} />
            </div>

            <br />
            <div className="btn-container">
              <input className="btn" type="submit" value="Submit"/>
            </div>
        </form>
      </div>
    );
  }
}

const mapDispatchToProps = function(dispatch) {
    return { createPost: post => dispatch(createPost(post)) };
};

export default connect(null, mapDispatchToProps)(CreatePostForm);
