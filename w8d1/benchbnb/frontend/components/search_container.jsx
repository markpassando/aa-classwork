import { connect } from 'react-redux';
import { fetchBenches } from '../actions/bench_actions';
import { updateBounds } from '../actions/filter_actions';
import Search from './search';
import { selectAllBenches } from '../reducers/selectors';

const mapStateToProps = (state) => {
  return ({
    benches: selectAllBenches(state),
    // currentbench: selectSingleBench(state)
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    fetchBenches: () => dispatch(fetchBenches()),
    updateBounds: () => dispatch(updateBounds())
  });
};

export default connect(mapStateToProps, mapDispatchToProps)(Search);
