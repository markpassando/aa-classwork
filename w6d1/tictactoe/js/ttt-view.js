const Board = require('./lib/board.js');

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    // when user clicks li
    // call playMove
    this.$el.on('click', 'li', (e) => {
      try {
        let $square = $(e.currentTarget);
        this.makeMove($square);
      } catch (error) {
        alert(error.msg);
        }
    });
  }

  makeMove($square) {
    let pos = ($square.attr("data")).split(",");
    let mark = this.game.currentPlayer;
    let move = this.game.playMove(pos);
    $square

    .addClass(`${mark}-marked`)
    .append(`<p>${mark}</p>`);
    if (this.game.isOver()) {
      if (this.game.winner()) {
        alert(`${this.game.winner()} has won!`);
      } else {
        alert('NO ONE WINS!');
      }
    }
  }

  setupBoard() {
    let rows = this.game.board.grid;
    $.each(this.game.board.grid, (rowIdx, row) => {
      let $ul = this.$el.append("<ul class='row'></ul>");
      $.each(row, (colIdx, col) => {
        $ul.append(`<li data="${rowIdx},${colIdx}"></li>`);
      });
    });
  }
}

module.exports = View;
