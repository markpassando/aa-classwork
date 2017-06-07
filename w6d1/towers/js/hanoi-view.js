class View{
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.clickTower(2);
  }

  setupTowers() {
    $.each(this.game.towers, (towerIdx, tower) => {
      let $ul = $(`<ul class='tower' data-index="${towerIdx}"></ul>`);
        this.$el.append($ul);
      $.each(tower.reverse(), (discIdx, disc) => {
          $ul.append(`<li>${disc}</li>`);
      });
    });
  }

  render() {
    this.$el.empty();
    for (let i = 0; i < this.game.towers.length; i++) {
      let $ul = $("<ul class='tower'></ul>");
        this.$el.append($ul);
      for (var j = 0; j < this.game.towers[i].length; j++) {
        $ul.append(`<li>${this.game.towers[i][j]}</li>`);
      }
    }
  }

  clickTower(numClicks) {
    const clicks = [];
    this.$el.on('click', 'ul', (e) => {
      let towerIdx = $(e.currentTarget).attr("data-index");
      console.log(towerIdx);
      const _clickTower = function() {
        clicks.push(towerIdx);
        console.log(clicks);
        if (numClicks === clicks.length) {
          this.game.move(...clicks);
        } else {
          return _clickTower;
        }
      };
      return _clickTower;
    });
  }
}

module.exports = View;
