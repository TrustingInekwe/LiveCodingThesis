void funcPropSelec(){
          if(instPropUpward == 0){
             if(instPropRighty == 0){
               if(time0Col == 0){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("G(0.5)").setColorCaptionLabel(0).setFont(font1);
                 if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 0.5f;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setGain(-20);
                     //player.shiftGain(player.getGain(),-80,FADE);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setGain(-20);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setGain(-20);
                 }
               }
               if(time0Col == 1){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(1)").setColorCaptionLabel(0).setFont(font1);
                   if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 1.0f;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setGain(-15);
                     //player.shiftGain(player.getGain(),-80,FADE);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setGain(-15);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setGain(-15);
                 }
               }
               if(time0Col == 2){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(2)").setColorCaptionLabel(0).setFont(font1);
                   if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 1.5f;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setGain(-5);
                     //player.shiftGain(player.getGain(),-80,FADE);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setGain(-5);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setGain(-5);
                 }
               }
               if(time0Col == 3){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(3)").setColorCaptionLabel(0).setFont(font1);
                   if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 2.0f;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setGain(0);
                     //player.shiftGain(player.getGain(),-80,FADE);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setGain(0);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setGain(0);
                 }
               }
               if(time0Col == 4){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(4)").setColorCaptionLabel(0).setFont(font1);
                   if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 2.5f;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setGain(5);
                     //player.shiftGain(player.getGain(),-80,FADE);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setGain(5);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setGain(5);
                 }
               }
               if(time0Col == 5){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(5)").setColorCaptionLabel(0).setFont(font1);
                   if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 3.0f;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setGain(10);
                     //player.shiftGain(player.getGain(),-80,FADE);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setGain(10);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setGain(10);
                 }
               }
             }
         
               if(instPropRighty == 1){
                 if(time0Col == 0){
                   if (time0Row == 0){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr0").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 0.0;
                   }
                   if (time0Row == 1){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr1").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 2.0;
                   }
                   if (time0Row == 2){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr2").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 3.0;
                   }
                 }
                 if(time0Col == 1){
                   if (time0Row == 0){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr3").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 4.0;
                   }
                   if (time0Row == 1){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr4").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 5.0;
                   }
                   if (time0Row == 2){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr-1").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 0.5;
                   }
                 }
                 if(time0Col == 2){
                   if (time0Row == 0){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr-2").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 0.25;
                   }
                   if (time0Row == 1){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr-3").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 0.125;
                   }
                   if (time0Row == 2){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("Tr-4").setColorCaptionLabel(0).setFont(font1);
                     transVal[propUpward] = 0.0625;
                   }
                 }
               }
               if(instPropRighty == 2){
                 if(time0Col == 0){
                   if (time0Row == 0){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("D_off").setColorCaptionLabel(0).setFont(font1);
                     delayVal[propUpward] = 0.0;
                   }
                   if (time0Row == 1){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("D_on").setColorCaptionLabel(0).setFont(font1);
                     delayVal[propUpward] = 0.5;
                   }
                 }
                 if(time0Col == 1){
                   if (time0Row == 0){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("B_off").setColorCaptionLabel(0).setFont(font1);
                     bitRes[propUpward] = 0;
                   }
                   if (time0Row == 1){
                     propertiesArray[propUpward][propRighty].setCaptionLabel("B_on").setColorCaptionLabel(0).setFont(font1);
                     bitRes[propUpward] = 2;
                   }
                 }
               }
          }

         if(instPropUpward == 1){
           if(instPropRighty == 0){
             if(time0Col == 0){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("Sin").setColorCaptionLabel(0).setFont(font1);
                 disWave[propUpward] = Waves.SINE;
                   //sineOsc.patch( out );
             }
             if(time0Col == 1){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("Sq").setColorCaptionLabel(0).setFont(font1);
                 //panValue = 1;
                 disWave[propUpward] =  Waves.SQUARE;
                   //sineOsc.patch( out );
             }
             if(time0Col == 2){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("Saw").setColorCaptionLabel(0).setFont(font1);
                 //panValue = 2;
                 disWave[propUpward] = Waves.SAW;
             }
                   //propHighlight = 1;
           }
           if(instPropRighty == 1){
             if(time0Col == 0){
               if(propertiesArray[propUpward][propRighty].getLabel() == "P1" || propertiesArray[propUpward][propRighty].getLabel() == "P-1"){
                 panValue[propUpward] = 0;
                 
                 if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   panValue[propUpward] = 0;;
                 }
                   else if (instruments[propUpward].getLabel() == "S N A R E"){
                       snare[propUpward].setPan(0);
                   }
                   else if (instruments[propUpward].getLabel() == "H A T"){
                       hat[propUpward].setPan(0);
                   }
                   else if (instruments[propUpward].getLabel() == "C L A P"){
                       clap[propUpward].setPan(0);
                   }
                 
               }
               if(propertiesArray[propUpward][propRighty].getLabel() != "G0.5" || propertiesArray[propUpward][propRighty].getLabel() != "G1"  
               || propertiesArray[propUpward][propRighty].getLabel() != "G2"  || 
                 propertiesArray[propUpward][propRighty].getLabel() != "G3"  || propertiesArray[propUpward][propRighty].getLabel() != "G4"  
                 || propertiesArray[propUpward][propRighty].getLabel() != "G5"){
                   if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   gainValue[propUpward] = 0.5f;
                 }
                   else if (instruments[propUpward].getLabel() == "S N A R E"){
                       snare[propUpward].setGain(-20);
                   }
                   else if (instruments[propUpward].getLabel() == "H A T"){
                       hat[propUpward].setGain(-20);
                   }
                   else if (instruments[propUpward].getLabel() == "C L A P"){
                       clap[propUpward].setGain(-20);
                   }
                 }
               if(propertiesArray[propUpward][propRighty].getLabel() != "D_OFF"){
                 delayVal[propUpward] = 0.0; 
               }
               if(propertiesArray[propUpward][propRighty].getLabel() != "B_OFF"){
                 bitRes[propUpward] = 0;
                }
               if(propertiesArray[propUpward][propRighty].getLabel() != "SQ" || propertiesArray[propUpward][propRighty].getLabel() != "SIN" || propertiesArray[propUpward][propRighty].getLabel() != "SAW"){
                 disWave[propUpward] = Waves.SINE;
               }
               propertiesArray[propUpward][propRighty].setCaptionLabel("");
             }
             if(time0Col == 1){
               if (instruments[propUpward].getLabel() == "S Y N T H"){
                 for(int i = 0; i < 8; i++){
                   patternsArray[propUpward][i].setCaptionLabel("");
                   cp5.get(controlP5.Button.class, "patternsArray" + propUpward + i).setColorBackground( color(#ffffff) );
                 }
                 for(int i = 0; i < 8; i++){
                   instList[propUpward][i] = 0.0;
                 }
               }
               else{
                 for(int h = 0; h < 8; h++){
                   decision[propUpward][h] = 0;
                   cp5.get(controlP5.Button.class, "patternsArray" + propUpward + h).setColorBackground( color(#ffffff) );
                 }
               }
             }
           }
           if(instPropRighty == 2){
             if(time0Col == 0){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("P0").setColorCaptionLabel(0).setFont(font1);
                 if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   panValue[propUpward] = 0;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setPan(0);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setPan(0);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setPan(0);
                 }
             }
             if(time0Col == 1){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("P1").setColorCaptionLabel(0).setFont(font1);
                 if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   panValue[propUpward] = 1;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setPan(1);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     //hat[propUpward].setPan(1);
                     print("\n NEW VALUUUUUUUUUUUUUUUU");
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setPan(1);
                 }
             }
             if(time0Col == 2){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("P-1").setColorCaptionLabel(0).setFont(font1);
                 if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
                   panValue[propUpward] = -1;
                 }
                 else if (instruments[propUpward].getLabel() == "S N A R E"){
                     snare[propUpward].setPan(-1);
                 }
                 else if (instruments[propUpward].getLabel() == "H A T"){
                     hat[propUpward].setPan(-1);
                 }
                 else if (instruments[propUpward].getLabel() == "C L A P"){
                     clap[propUpward].setPan(-1);
                 }
             }
           }
         }
}
