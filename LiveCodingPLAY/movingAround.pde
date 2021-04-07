
// MOVING AROUND THE INTRUMENT AND PATTERN ARRAY!!!

void movingAround() {
  if (patList1 == 0) {
    for (int y = 0; y < 8; y++) {
      cp5.get(controlP5.Button.class, "instruments" + y).setColorBackground(color(#B0D5FF));  //setting the default (sky blue) color for the instrument row
    }
    for (int l = 0; l < 8; l++) {
      if ((upward == 0) && (righty > 0 && righty < 7)) {
        cp5.get(controlP5.Button.class, "patternsArray" + (upward+1) + l).setColorBackground(color(#ffffff));  //setting the default (white) color for the next (upward + 1) patterns row for the first row 
      }
      if ((upward > 0 && upward < 7) && (righty > -1 && righty < 7)) {
        cp5.get(controlP5.Button.class, "patternsArray" + (upward-1) + l).setColorBackground(color(#ffffff));//setting the default (white) color for the previous (upward - 1) and next (upward + 1) patterns row
      }
      if ((upward == 7) && (righty > 0 && righty < 7)) {
        cp5.get(controlP5.Button.class, "patternsArray" + (upward-1) + l).setColorBackground(color(#ffffff));//setting the default (white) color for the previous (upward - 1) patterns row for the last row
      }
    }
    
    // BLINKING CURSOR FOR THE INSTRUMENT SECTION OF THE INTSTRUMENT AND PATTERN ARRAY
    if (righty == -1) {
      for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            rect(125, h + 70, 370, 40);
          }
        }
        
      if ( entVal_instrument == 2 && highlight == 1 ) {
        patList2 = 0;
        instSelect[upward] = 1;    
      } else {
        cp5.get(controlP5.Button.class, "instruments" + upward).setColorBackground( color(#87CEFF) );
        cp5.get(controlP5.Button.class, "patternsArray" + (upward) + (righty+1)).setColorBackground( color(#ffffff) );
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            if ( entVal_instrument != 2){
            fill(#C62222);
                int passedMillis = millis() - time3; // calculates passed milliseconds
                if(passedMillis >= 315){
                    time3 = millis();
                  fill(#000000);
                }
            rect(125, h + 70, 370, 40);
            }
            
          }
        }
      }
    }
    
   // BLINKING CURSOR FOR THE PATTERN ARRAY SECTION OF THE INTSTRUMENT AND PATTERN ARRAY
   for(int i = 0; i < 8; i++){
    if (righty == i) {
      instSelect[upward] = 0;
      if (entVal_pattern == 1 && highlight == 1) {
        if (instruments[upward].getLabel() == "S Y N T H") { //If instrument is a synth
          if ( synthSel == 1) {
            notes();
            for (int h = 0; h < 400; h += 50){
              int j = h/50;
              if(upward == j){
                fill(#C62222);
                int passedMillis = millis() - time; // calculates passed milliseconds
                if(passedMillis >= 315){
                    time = millis();
                  fill(#000000);
                }
                rect(500 + i*80, h + 70, 80, 40);
                //}
              }
            }
          }
        } 
            else { // If instrument is not a synth
                if (decision[upward][righty] == 1) {
                  decision[upward][righty] = 0;
                  cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setCaptionLabel("");
                } else if (instruments[upward].getLabel() != ""){
                  decision[upward][righty] = 1;
                }
                entVal_pattern = 0;
                print("\ndecision[upward][righty] =="+ decision[upward][righty]);
            }
      } 
      else {
        if (instruments[upward].getLabel() != "S Y N T H"){
          cp5.get(controlP5.Button.class, "patternsArray" + upward + righty).setColorBackground( color(#ffffff) );
        }
        for (int h = 0; h < 400; h += 50){
          int j = h/50;
          if(upward == j){
            fill(#C62222);
            int passedMillis = millis() - time; // calculates passed milliseconds
            if(passedMillis >= 315){
                time = millis();
              fill(#000000);
            }
            rect(500 + i*80, h + 70, 80, 40);
            //}
          }
        }
      }
    }
   }
  }
}
