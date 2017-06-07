const View = require('./ttt-view.js');
const Game = require('./lib/game.js');

$( () => {
  const game = new Game();
  const $ttt = $('.ttt');
  // debugger
  const view = new View(game, $ttt);
});
