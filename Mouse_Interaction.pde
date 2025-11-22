void mousePressed() {
  //-------------------TOP-------------------
  if (mouseX > 520 && mouseX < 620 && mouseY > 230 && mouseY < 330) { //right arrow for top
    currentTopIndex = (currentTopIndex + 1) % topsg.size();  //if it goes over the limit, goes back to 0
  } else if (mouseX > 280 && mouseX < 380 && mouseY > 230 && mouseY < 330) { //left arrow for top
    currentTopIndex = (currentTopIndex - 1 + topsg.size()) % topsg.size();
  }

  //-------------------PANTS-------------------
  if (mouseX > 555 && mouseX < 595 && mouseY > 390 && mouseY < 490) { //right arrow for pants
    currentPantsIndex = (currentPantsIndex + 1) % pants.size();  //if it goes over the limit, goes back to 0
  } else if (mouseX > 280 && mouseX < 380 && mouseY > 390 && mouseY < 490) {
    currentPantsIndex = (currentPantsIndex - 1 + pants.size()) % pants.size(); //left arrow for pants
  }
  
  //-------------------ACCESSORY-------------------
  if (mouseX > 809 && mouseX < 849 && mouseY > 420 && mouseY < 460) {
    currentAccessoryIndex = (currentAccessoryIndex + 1) % accessories.size();  //if it goes over the limit, goes back to 0
  } else if (mouseX > 622 && mouseX < 662 && mouseY > 420 && mouseY < 460) {
    currentAccessoryIndex = (currentAccessoryIndex - 1 + accessories.size()) % accessories.size();
  }
  currentTop = getCurrentTop();
  
  //-------------------CIRCLE INFO ICON-------------------
  if (mouseX > 450 && mouseX < 490 && mouseY > 14 && mouseY < 54 && showInfo == false)
    showInfo = true;
  else if (mouseX > 450 && mouseX < 490 && mouseY > 14 && mouseY < 54 && showInfo == true)
    showInfo = false;
}
