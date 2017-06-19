import { values } from 'lodash';

export const selectAllBenches = ({ benches }) => values(benches);

// export const selectSingleBench = (state) => state.benches[state.currentBench] //select by currentBench id
