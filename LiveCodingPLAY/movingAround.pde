void movingAround() {
  if (patList1 == 0) {
    for (int y = 0; y < 8; y++) {
      cp5.get(controlP5.Button.class, "instruments" + y).setColorBackground(color(#a6cee3));
    }
    for (int l = 0; l < 8; l++) {
      if ((upward == 0) && (righty > 0 && righty < 7)) {
        cp5.get(controlP5.Button.class, "patternsArray" + (upward+1) + l).setColorBackground(color(#ffffff));
      }
      if ((upward > 0 && upward < 7) && (righty > -1 && righty < 7)) {
        cp5.get(controlP5.Button.class, "patternsArray" + (upward-1) + l).setColorBackground(color(#ffffff));
        cp5.get(controlP5.Button.class, "patternsArray" + (upward+1) + l).setColorBackground(color(#ffffff));
        //print("\nNO YOU A'INT!!!!!!!!");
      }
      if ((upward == 7) && (righty > 0 && righty < 7)) {
        cp5.get(controlP5.Button.class, "patternsArray" + (upward-1) + l).setColorBackground(color(#ffffff));
      }
    }
  // for (int j = -1; j < 8; i++){
  // for (int i = -1; i < 8; i++){
  //  if (righty == i) {
  //    if(righty == -1){
  //      if (righty == -1) {
  //        if ( entVal_instrument == 2 && highlight == 1 ) {
  //              patList2 = 0;
  //              instSelect[upward] = 1;
  //            } else {
  //              cp5.get(controlP5.Button.class, "instruments" + upward).setColorBackground( color(#87CEFF) );
  //              cp5.get(controlP5.Button.class, "patternsArray" + (upward) + (righty+1)).setColorBackground( color(#ffffff) );
  //              for (int h = 0; h < 400; h += 50){
  //                int j = h/50;
  //                if(upward == j){
                    
  //                  fill(#C62222);
  //                  rect(125, h + 70, 370, 40);
                    
  //                }
  //              }
  //            }
  //          }
  //    }
  //    if (righty == 0) {
  //      instSelect[upward] = 0;
  //      if (entVal_pattern == 1 && highlight == 1) {
  //            if (instruments[upward].getLabel() == "S Y N T H") {
  //                if ( synthSel == 1) {
  //                  notes();
  //                }
  //            } 
  //            else {
  //                if (decision[upward][righty] == 1) {
  //                  decision[upward][righty] = 0;
  //                } else{
  //                  decision[upward][righty] = 1;
  //                }
  //                entVal_pattern = 0;
  //                print("\ndecision[upward][righty] =="+ decision[upward][righty]);
  //            }
  //      } 
  //      else {
  //        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
  //        for (int h = 0; h < 400; h += 50){
  //          int j = h/50;
  //          if(upward == j){
              
  //            ////if(decision[upward][righty] == 1){
  //            //  fill(0,255,0);
  //            //  rect(500, h + 70, 80, 40);
  //            //}
  //            //else{
  //            fill(#C62222);
  //            rect(500, h + 70, 80, 40);
  //            //}
  //          }
  //        }
  //      }
  //    }
     
     
     
  //  }
  //}
    
    if (righty == -1) {
      if ( entVal_instrument == 2 && highlight == 1 ) {
        patList2 = 0;
        instSelect[upward] = 1;
      } else {
        cp5.get(controlP5.Button.class, "instruments" + upward).setColorBackground( color(#87CEFF) );
        cp5.get(controlP5.Button.class, "patternsArray" + (upward) + (righty+1)).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            
            fill(#C62222);
            rect(125, h + 70, 370, 40);
            
          }
        }
      }
    }
   
    if (righty == 0) {
      instSelect[upward] = 0;
      if (entVal_pattern == 1 && highlight == 1) {
            if (instruments[upward].getLabel() == "S Y N T H") {
                if ( synthSel == 1) {
                  notes();
                }
            } 
            else {
                if (decision[upward][righty] == 1) {
                  decision[upward][righty] = 0;
                } else{
                  decision[upward][righty] = 1;
                }
                entVal_pattern = 0;
                print("\ndecision[upward][righty] =="+ decision[upward][righty]);
            }
      } 
      else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            
            ////if(decision[upward][righty] == 1){
            //  fill(0,255,0);
            //  rect(500, h + 70, 80, 40);
            //}
            //else{
            fill(#C62222);
            rect(500, h + 70, 80, 40);
            //}
          }
        }
      }
    }
  
    
    if (righty == 1) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            currentNotePosition = 1;   
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 80, h + 70, 80, 40);
          }
        }
      }
    }
    if (righty == 2) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 2*80, h + 70, 80, 40);
          }
        }
      }
    }
    if (righty == 3) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 3*80, h + 70, 80, 40);
          }
        }
      }
    }
    if (righty == 4) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 4*80, h + 70, 80, 40);
          }
        }
      }
    }
    if (righty == 5) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 5*80, h + 70, 80, 40);
          }
        }
      }
    }
    if (righty == 6) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 6*80, h + 70, 80, 40);
          }
        }
      }
    }
    if (righty == 7) {
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") {
          if ( synthSel == 1) {
            notes();
          }
        } else {
          if (decision[upward][righty] == 1) {
            decision[upward][righty] = 0;
          } else
            decision[upward][righty] = 1;
          entVal_pattern = 0;
        }
      } else {
        cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(500 + 7*80, h + 70, 80, 40);
          }
        }
      }
    }
  }
}
