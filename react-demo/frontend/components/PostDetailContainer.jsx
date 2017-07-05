import { connect } from 'react-redux';
import PostDetail from './PostDetail';
import { requestSinglePost } from '../actions/post_actions';
import { selectAllPosts } from '../reducers/selectors';

const mapStateToProps = state => ({
  currentPost: state.posts.currentPost
});

const mapDispatchToProps = dispatch => ({
  requestSinglePost: (id) => dispatch(requestSinglePost(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PostDetail);
