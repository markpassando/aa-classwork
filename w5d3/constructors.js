function Cat(owner, name) {
  this.owner = owner;
  this.name = name;
}

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`;
};

Cat.prototype.meow = function () {
  return `${this.name}: meow`;
};

const c1 = new Cat("o1", "c1");
const c2 = new Cat("o2", "c2");

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}`;
};

c2.meow = function () {
  return `this is c2: meow`;
};

console.log(c1.meow());
console.log(c2.meow());

Array.prototype.myEach = function (callback) {
  let i = 0;
  while (i < this.length) {
    callback(this[i]);
    i++;
  }
};

debugger;
