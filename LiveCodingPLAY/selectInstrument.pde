
// SELECTING AN INSTRUMENT TYPE!!!

void selectInstrument(){
  if(patList2 == 0){
    if(instSelect[upward] == 1){ // Checking an instrument row
      highlight = 2;
      
      //FIRST ROW FOR INSTRUMENTS
      if(instUpward == 0){
        //For selecting a KICK instrument
        if(intRighty == 0){ 
         fill(#C62222);
          int passedMillis = millis() - time; // calculates passed milliseconds
          if(passedMillis >= 315){
              time = millis();
            fill(#000000);
          }
         rect(120, height/2 + 30, 125, 95);
        if(entVal_instrument == 3){ //
          for(int i = 0; i < 8; i++){
               decision[upward][i] = 0;
               cp5.get(controlP5.Button.class, "patternsArray" + upward + i).setColorBackground( color(#ffffff) ).setCaptionLabel(""); 
             }
          cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("K I C K").setColorCaptionLabel(255).setFont(font2).setColorBackground( color(#eabafe) );
            highlight = 1;
            instSelect[upward] = 0;
            cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color( #0B1D28) );
            cp5.get(controlP5.Button.class, "instruments" + upward).setColorBackground( color(#87CEFF) );
            entVal_instrument = 1;
            leave = 0;
         }
        }
        //For selecting a SNARE instrument
        if(intRighty == 1){ 
          fill(#C62222);
          int passedMillis = millis() - time; // calculates passed milliseconds
          if(passedMillis >= 315){
              time = millis();
            fill(#000000);
          }
         rect(248, height/2 + 30, 125, 95);
          if(entVal_instrument == 3){
              for(int i = 0; i < 8; i++){
                   //patternsArray[propUpward][i].setCaptionLabel("");
                   decision[upward][i] = 0;
                   cp5.get(controlP5.Button.class, "patternsArray" + upward + i).setColorBackground( color(#ffffff) ).setCaptionLabel("");
                 }
            cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S N A R E").setColorCaptionLabel(255).setFont(font2);
            highlight = 1;
            instSelect[upward] = 0;
            cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color( #0B1D28) );
            entVal_instrument = 1;
            leave = 0;
          }
        }
        //For selecting a HAT instrument
        if(intRighty == 2){
          fill(#C62222);
        int passedMillis = millis() - time;
        if(passedMillis >= 315){
            time = millis();
          fill(#000000);
        }
           rect(375, height/2 + 30, 125, 95);
          if(entVal_instrument == 3){
            for(int i = 0; i < 8; i++){
                 //patternsArray[propUpward][i].setCaptionLabel("");
                 decision[upward][i] = 0;
                 cp5.get(controlP5.Button.class, "patternsArray" + upward + i).setColorBackground( color(#ffffff) ).setCaptionLabel("");
               }
            cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("H A T").setColorCaptionLabel(255).setFont(font2);
            highlight = 1;
            instSelect[upward] = 0;
            cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color( #0B1D28) );
            entVal_instrument = 1;
            leave = 0;
          }
        }
      }
        
      //SECOND ROW FOR INSTRUMENTS
      if(instUpward == 1){  
        //For selecting a SYNTH instrument
        if(intRighty == 0){
          fill(#C62222);
        int passedMillis = millis() - time; // calculates passed milliseconds
        if(passedMillis >= 315){
            time = millis();
          fill(#000000);
        }
           rect(120, height/2 + 165, 125, 95);
          if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
            //cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S Y N T H").setColorCaptionLabel(255).setFont(font2);
          }
          if(entVal_instrument == 3){
            for(int i = 0; i < 8; i++){
                 //patternsArray[propUpward][i].setCaptionLabel("");
                 decision[upward][i] = 0;
                 cp5.get(controlP5.Button.class, "patternsArray" + upward + i).setColorBackground( color(#ffffff) ).setCaptionLabel("");
               }
            cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S Y N T H").setColorCaptionLabel(255).setFont(font2);
            
              highlight = 1;
              instSelect[upward] = 0;
              cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color( #0B1D28) );
              entVal_instrument = 1;
              leave = 0;
            }
        }
        //For selecting a CLAP instrument
        if(intRighty == 1){
          fill(#C62222);
          int passedMillis = millis() - time; // calculates passed milliseconds
          if(passedMillis >= 315){
              time = millis();
            fill(#000000);
          }
          rect(248, height/2 + 165, 125, 95);
          if(entVal_instrument == 3){
            for(int i = 0; i < 8; i++){
                 //patternsArray[propUpward][i].setCaptionLabel("");
                 decision[upward][i] = 0;
                 cp5.get(controlP5.Button.class, "patternsArray" + upward + i).setColorBackground( color(#ffffff) ).setCaptionLabel("");
               }
            cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("C L A P").setColorCaptionLabel(255).setFont(font2);
              highlight = 1;
              instSelect[upward] = 0;
              cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color( #0B1D28) );
              entVal_instrument = 1;
              leave = 0;
          }
        }
      }    
    }       
  }
 }
