const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor () {
    this.stacks = [[3,2,1],[],[]];
  }

  move(from_tower, to_tower) {
    if (this.isValidMove(from_tower, to_tower)) {
      let disk = this.stacks[from_tower].pop();
      this.stacks[to_tower].push(disk);
      // this.printStacks();
      return true;
    }
    return false;
  }

  promptMove(completionCallback) {
    this.printStacks();
    let from_tower;
    let to_tower;

    if (this.isWon()) {
      completionCallback();
      reader.close();
    } else {
      reader.question("What tower to you want to move a disk from? ", (res) => {
        console.log("here");
        from_tower = parseInt(res);
        reader.question("What tower to you want to move that disk to? ", (res) => {
          to_tower = parseInt(res);
          console.log(this);
          // this.isValidMove(from_tower, to_tower);
          this.move(from_tower, to_tower);

          this.promptMove(completionCallback);
          // this.run(completionCallback);
        });
      });
    }
  }

  isValidMove(from_tower, to_tower){
    // invalid
    // if from tower is empty
    //  to tower disc is smaller than from tower
    // if from tower or to tower > 2 or < 0
    if ((from_tower < 3 && to_tower < 3) && (from_tower >= 0 && to_tower >= 0)){
      let from_stack = this.stacks[from_tower];
      if (from_stack.length > 0){
        let to_stack = this.stacks[to_tower];
        if (to_stack.length === 0) {
          return true;
        } else if (from_stack[from_stack.length - 1] < to_stack[to_stack.length - 1]){
          return true;
        }
      }
    }
    return false;
  }

  isWon() {
    if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
      return true;
    }
    return false;
  }

  printStacks() {
    this.stacks.forEach((el) => { console.log(el); } ) ;
  }

  // run(completionCallback) {
  //   while (!this.isWon()) {
  //     console.log(this);
  //     let [from, to] = this.promptMove();
  //     completionCallback(from, to);
  //   }
  //   console.log("You have won!");
  // }
}

Game.prototype.run = function (completionCallback) {
  // start stacks
  // take turn
  //   promt user to take ring
  //   prompt to place ring
  //
  // keep taking turn
  //   until win recursively call
  //
  // win
      this.promptMove(completionCallback);

};

var game = new Game();
game.run(()=> console.log("You have won!"));

// console.log(game.isValidMove(5, -99));
// console.log(game.isValidMove(2, 0));
// console.log(game.isValidMove(0, 1));
// console.log(game.isValidMove(0, 2));
