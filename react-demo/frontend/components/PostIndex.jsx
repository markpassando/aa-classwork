import React from 'react';
import { Link } from 'react-router-dom';
import CreatePostForm from './CreatePostForm';

class PostIndex extends React.Component {
  constructor(props) {
    super(props);

    // this.handleDelete = this.handleDelete.bind(this);
  }

  componentDidMount() {
    this.props.requestAllPosts();
  }

  // handleDelete(e) {
  //   e.preventDefault();
  //   debugger
  //   this.props.deletePost(post.id);
  // }

  render() {
    const { posts } = this.props;
    const listPosts = posts.map((post) => {
      return (
        <li key={post.id}>
          <Link to={`/post/${post.id}`}>{post.title}</Link>
          <div>
            <Link to={`/post/edit/${post.id}`}>Edit</Link>
            <button onClick={ () => this.props.deletePost(post.id) }>Delete</button>
          </div>
        </li>
      );
    });

    return (
      <div >
        <h1>All Posts</h1>
        <div className="post-index">
          <div>
            <ul>{listPosts}</ul>
          </div>
          <div>
            <CreatePostForm />
          </div>
        </div>
      </div>
    );
  }
}

export default PostIndex;
