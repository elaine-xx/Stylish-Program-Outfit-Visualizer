//There is a parent class, Item, and classes Top, Pants, and Accessory extend it!
//efficiency~

class Item {
  String url;
  int x, y, w, h; //coordinates and w and h

  Item(String imgURL, int x, int y, int w, int h) {
    this.url = imgURL;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  String getURL() {
    return url;
  }

  PImage getIMG() {
    return loadImage(url);
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getW() {
    return w;
  }

  int getH() {
    return h;
  }
}

class Top extends Item {
  Top(String imgURL, int x, int y, int w, int h) {
    super(imgURL, x, y, w, h);
  }
}

Top getCurrentTop() {
  if (model == "girl")
    return topsg.get(currentTopIndex);
  else
    return topsm.get(currentTopIndex);
}

class Pants extends Item {
  Pants(String imgURL, int x, int y, int w, int h) {
    super(imgURL, x, y, w, h);
  }
}

Pants getCurrentPants() {
  return pants.get(currentPantsIndex);
}

class Accessory extends Item {
  Accessory(String imgURL, int x, int y, int w, int h) {
    super(imgURL, x, y, w, h);
  }
}

Accessory getCurrentAccessory() {
  return accessories.get(currentAccessoryIndex);
}
