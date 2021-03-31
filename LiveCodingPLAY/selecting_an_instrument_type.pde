//if (decision[f][g] == 1 && instruments[f].getLabel() == "K I C K") {
//          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("K").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
//          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
//        }
//        if (decision[f][g] == 1 && instruments[f].getLabel() == "S N A R E") {
//          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("S").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
//          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
//        }
//        if (decision[f][g] == 1 && instruments[f].getLabel() == "H A T") {
//          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("H").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
//          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
//        }
//        if (decision[f][g] == 1 && instruments[f].getLabel() == "C L A P") {
//          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setCaptionLabel("C").setFont(font2).setColorCaptionLabel(0).setColorBackground( color(#eabafe) );
//          //print("\ndecision[upward][righty]==" + decision[upward][righty]);
//        }
//        if (decision[f][g] == 1 && instruments[f].getLabel() == "S Y N T H") {
//          cp5.get(controlP5.Button.class, "patternsArray" + f + g).setColorBackground( color(255, 255, 0) );
//        }

void selectInstrument(){
  if(patList2 == 0){
    if(instSelect[upward] == 1){
      highlight = 2;
      if(instUpward == 0){
        //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( #e0115f);
        if(intRighty == 0){
         fill(#e0115f);
         rect(120, height/2 + 30, 125, 95);
          //print(intRighty+"..."+intRighty);
          if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
          }
            if(entVal_instrument == 3){
            cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("K I C K").setColorCaptionLabel(255).setFont(font2).setColorBackground( color(#eabafe) );
                highlight = 1;
                instSelect[upward] = 0;
                cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color( #0B1D28) );
                cp5.get(controlP5.Button.class, "instruments" + upward).setColorBackground( color(#87CEFF) );
                entVal_instrument = 1;
                leave = 0;
             }
        }
        if(intRighty == 1){
          fill(#e0115f);
         rect(248, height/2 + 30, 125, 95);
          if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
            //cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S N A R E").setColorCaptionLabel(255).setFont(font2);
          }
          if(entVal_instrument == 3){
            cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S N A R E").setColorCaptionLabel(255).setFont(font2);
            highlight = 1;
            instSelect[upward] = 0;
            cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color( #0B1D28) );
            entVal_instrument = 1;
            leave = 0;
          }
        }
          if(intRighty == 2){
            fill(#e0115f);
             rect(375, height/2 + 30, 125, 95);
            if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 2){
              //cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("H A T").setColorCaptionLabel(255).setFont(font2);
            }
            if(entVal_instrument == 3){
              cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("H A T").setColorCaptionLabel(255).setFont(font2);
              highlight = 1;
              instSelect[upward] = 0;
              cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color( #0B1D28) );
              entVal_instrument = 1;
              leave = 0;
            }
          }
        }
        //print
        if(instUpward == 1){
          if(intRighty == 0){
            fill(#e0115f);
             rect(120, height/2 + 165, 125, 95);
            if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
              //cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S Y N T H").setColorCaptionLabel(255).setFont(font2);
            }
            if(entVal_instrument == 3){
              cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("S Y N T H").setColorCaptionLabel(255).setFont(font2);
                highlight = 1;
                instSelect[upward] = 0;
                cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color( #0B1D28) );
                entVal_instrument = 1;
                leave = 0;
              }
          }
          if(intRighty == 1){
            fill(#e0115f);
         rect(248, height/2 + 165, 125, 95);
            if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
              //cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("C L A P").setColorCaptionLabel(255).setFont(font2);
            }
            if(entVal_instrument == 3){
              cp5.get(controlP5.Button.class, "instruments" + upward).setCaptionLabel("C L A P").setColorCaptionLabel(255).setFont(font2);
                highlight = 1;
                instSelect[upward] = 0;
                cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color( #0B1D28) );
                entVal_instrument = 1;
                leave = 0;
            }
          }
        if(intRighty == 2){
          
        }
        }
        //if (instUpward == 2){
        //    if(intRighty == 0){
        //  }
          
          
        //  if (intRighty == 1){
        //  }
        //}    
    }       
    }
 }
