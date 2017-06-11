class DOMNodeCollection {
  constructor (arr) {
    this.arr = arr;
  }

  html(string) {
    if (string || string === "") {
      this.arr.forEach((el) => {
        el.innerHTML = string;
      });
    } else {
      return this.arr[0];
    }
  }

  empty() {
    this.html("");
  }

  append(el) {
    this.arr.forEach((node) => {
      node.innerHTML += el;
    });
  }

  attr(attribute, val) {
    if (val !== undefined) {
      for (let i = 0; i < this.arr.length; i++) {
        this.arr[i].setAttribute(attribute, val);
        return val;
      }
    } else {
        return this.arr[0].getAttribute(attribute);
    }
  }

  addClass(...className) {
    this.arr.forEach((node) => {
      node.classList.add(...className);
    });
  }

  removeClass(...className) {
    this.arr.forEach((node) => {
      node.classList.remove(...className);
    });
  }

  children() {
    let kids = [];

    this.arr.forEach((node) => {
      kids = kids.concat(node.children);
    });

    return kids;
  }

  parent () {
    let parents = [];

    // this.arr.forEach((node) => {
    //   parents = parents.concat(node.parent);
    // });


    for (let i = 0; i < this.arr.length; i++) {
      if (!parents.length) {
        parents.push(this.arr[i].parentNode);
      } else {
        let inParents = false;

        for (let j = 0; j < parents.length; j++) {
          if (this.arr[i].parentNode === parents[j]) {
            inParents = true;
          }
        }

        if (!inParents) {
          parents.push(this.arr[i].parentNode);
        }
      }
    }

    return parents;
  }

  find (selector) {
    let found = [];

    this.arr.forEach((node) => {
      let findItem = node.querySelectorAll(selector);
      if (findItem.length > 0) {
        found.push(findItem);
      }
    });

    return found;
  }

  remove (){
    this.arr.forEach( (node) => {
      node.remove();
    });
  }

  on (e, callback) {
    this.arr.forEach( (node) => {
      node.myCallbacks[e] = callback;
      node.addEventListener(e, callback);
    });
  }

  off (e) {
    this.arr.forEach( (node) => {
      node.removeEventListener(e, node.myCallbacks[e]);
    });
  }

}

module.exports = DOMNodeCollection;
