import g4p_controls.*;

//-------------------INITIALIZATION-------------------
PImage girl, man, RArrow, LArrow;
String model; //the og model is girl-esque
int currentTopIndex = 1;
int currentPantsIndex = 5;
int currentAccessoryIndex = 5;
PImage currentTopImage;
PImage currentPantsImage;
PImage currentAccessoryImage;
String userWord; //to store word user enters in text field
boolean showInfo = false; //shows info or not
boolean wordFound;
String[] allData;
int counter = 0;

ArrayList<Top> topsg = new ArrayList<Top>(); //two different sizing charts for the tops, therefore there r two diff lists
ArrayList<Top> topsm = new ArrayList<Top>();
ArrayList<Pants> pants = new ArrayList<Pants>();
ArrayList<Accessory> accessories = new ArrayList<Accessory>();

Top currentTop;
Pants currentPants;
Accessory currentAccessory;

void setup() {
  createGUI();
  size(900, 700);
  allData = loadStrings("txt storage.txt"); //load in data from txt file
  girl = loadImage("transparent WOMAN.png");
  man = loadImage("transparent MAN.png");
  RArrow = loadImage("processing arrow.png");
  LArrow = loadImage("left arrow.png");
  model = "girl"; //initially, a girlesque model

  // Initialize tops
  topsg.add(new Top("black zipup.png", 452, 300, 253, 253));   //each top has a url, index, coordinates and size
  topsg.add(new Top("brown tank.png", 452, 260, 86, 86));
  topsg.add(new Top("green longsleeve.png", 455, 313, int(281*0.55), int(395*0.55)));
  topsg.add(new Top("pink tank.png", 452, 260, 86, 86));
  topsg.add(new Top("orange shirt.png", 455, 280, int(343*0.4), int(517*0.4)));
  topsg.add(new Top("yellow athletic.png", 451, 291, int(343*0.5), int(517*0.5)));
  topsg.add(new Top("black shirt.png", 452, 304, int(500*0.39), int(500*0.39)));
  topsg.add(new Top("blouse.png", 453, 284, int(442*0.29), int(565*0.29)));
  topsg.add(new Top("black grey.png", 451, 280, int(500*0.35), int(500*0.35)));
  topsg.add(new Top("suit.png", 451, 280, int(432*0.44), int(557*0.44)));
  topsg.add(new Top("turtleneck.png", 453, 282, int(433*0.35), int(577*0.35)));

  topsm.add(new Top("black zipup.png", 452, 300, 330, 280));   //each top has a url, index, coordinates and size
  topsm.add(new Top("brown tank.png", 452, 260, 94, 98));
  topsm.add(new Top("green longsleeve.png", 455, 328, int(281*0.73), int(395*0.65)));
  topsm.add(new Top("pink tank.png", 452, 260, 94, 98));
  topsm.add(new Top("orange shirt.png", 455, 302, int(343*0.55), int(517*0.55)));
  topsm.add(new Top("yellow athletic.png", 451, 305, int(343*0.65), int(517*0.6)));
  topsm.add(new Top("black shirt.png", 452, 300, int(500*0.43), int(500*0.41)));
  topsm.add(new Top("blouse.png", 454, 301, int(442*0.37), int(565*0.37)));
  topsm.add(new Top("black grey.png", 451, 288, int(500*0.4), int(500*0.4)));
  topsm.add(new Top("suit.png", 451, 289, int(432*0.57), int(557*0.50)));
  topsm.add(new Top("turtleneck.png", 454, 288, int(433*0.46), int(577*0.38)));

  // Initialize pants
  pants.add(new Pants("elf pants.png", 453, 450, int(2400*0.1), int(3600*0.1)));
  pants.add(new Pants("black flared.png", 458, 489, int(429*0.75), int(582*0.75)));
  pants.add(new Pants("jeans.png", 452, 465, int(750*0.42), int(863*0.42)));
  pants.add(new Pants("long skirt.png", 452, 443, int(300*0.8), int(300*0.8)));
  pants.add(new Pants("adidas.png", 461, 451, int(1000*0.36), int(1000*0.36)));
  pants.add(new Pants("khakis.png", 451, 451, int(466*0.55), int(536*0.55)));

  // Initialize accessories
  accessories.add(new Accessory("chanel bag.png", 733, 440, int(300*0.54), int(300*0.54)));
  accessories.add(new Accessory("hello cutie heel.png", 733, 440, int(300*0.35), int(300*0.35)));
  accessories.add(new Accessory("glasses.png", 733, 440, int(300*0.5), int(300*0.5)));
  accessories.add(new Accessory("transparent HOODIE.png", 451, 312, int(695*0.3), int(825*0.3)));
  accessories.add(new Accessory("hat.png", 732, 440, int(500*0.35), int(500*0.35)));
  accessories.add(new Accessory("necklace.png", 732, 438, int(500*0.34), int(500*0.34)));
}

void draw() {
  background(227);
  imageMode(CENTER);
  image(loadImage("change room.jpg"), 450, 300, 5453*0.3, 3636*0.3);
  image(loadImage("transparent.png"), 450, 300, 5453*0.3, 3636*0.3);

  fill(255);
  stroke(255);
  if(showInfo){
    triangle(473, 34, 584, 30, 584, 60);
    rect(580, 30, 300, 290);
    fill(0);
    textSize(13);
    //info pop-up
    text("Get creative! Explore outfit dynamics and mix\nand match tops, bottoms, and accessories. On the\nleft are some of our favourites, and you can also\nsearch for an outfit mood in the top left text field.\nNever forget: you're a fashion ICON!\n\nPossible Adjectives: \n 'casual', 'comfy', 'formal', 'sporty', 'trendy', 'classic' \n'grunge', 'artsy', 'edgy', 'minimalistic' \n'glamourous', 'summer', 'chilly', 'spring', 'autumn' \n'elegant', 'chic', 'cool', 'extravagant', 'everyday' \n'elevated', 'school', 'fun', 'soft'", 595, 60); 
  }
  
  //text thing
  fill(0);
  textSize(17);
  text("Welcome to the most stylish program you've ever seen!", 60, 39);

  //DRAW MODEL
  if (model == "girl")
    image(girl, 454, 380);
  else
    image(man, 454, 380);

  //DRAW ARROWS
  image(RArrow, 570, 280, 50, 50); //top arrow RIGHT
  image(LArrow, 330, 280, 50, 50); //top arrow LEFT
  image(RArrow, 570, 440, 50, 50); //pants arrow RIGHT
  image(LArrow, 330, 440, 50, 50); //pants arrow LEFT
  image(RArrow, 829, 440, 20, 20); //access arrow RIGHT
  image(LArrow, 642, 440, 20, 20); //acess arrow LEFT
  image(loadImage("info icon.png"), 470, 34, 20, 20);
  
  if (currentAccessoryIndex == 3)
    text("Hoodie: On", 692, 443);

  //DRAW PANTS
  currentPants = getCurrentPants();
  image(currentPants.getIMG(), currentPants.getX(), currentPants.getY(), currentPants.getW(), currentPants.getH());

  //DRAW TOP
  currentTop = getCurrentTop();  //call function in Top tab
  image(currentTop.getIMG(), currentTop.getX(), currentTop.getY(), currentTop.getW(), currentTop.getH());

  //DRAW ACCESSORY
  noFill();
  strokeWeight(1.5);
  stroke(50);
  rect(650, 380, 170, 120);
  currentAccessory = getCurrentAccessory();
  image(currentAccessory.getIMG(), currentAccessory.getX(), currentAccessory.getY(), currentAccessory.getW(), currentAccessory.getH());
}
