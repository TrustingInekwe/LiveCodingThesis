
// SELECTING FUNCTION ARGUMENTS!!!

void funcPropSelec(){
  // SETTING UP GAIN VALUES FOR AN INSTRUMENT
  if(instPropUpward == 0){
     if(instPropRighty == 0){
       if(time0Col == 0){
         propertiesArray[propUpward][propRighty].setCaptionLabel("G(0.5)").setColorCaptionLabel(0).setFont(font1);
         if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
           gainValue[propUpward] = 0.5f;
         }
         else if (instruments[propUpward].getLabel() == "S N A R E"){
             snare[propUpward].setGain(-20); // Setting a -20 gain value for a snare
         }
         else if (instruments[propUpward].getLabel() == "H A T"){
             hat[propUpward].setGain(-20); // Setting -20 gain value for a hat
         }
         else if (instruments[propUpward].getLabel() == "C L A P"){
             clap[propUpward].setGain(-20); // Setting -20 gain value for a clap
         }
       }
       if(time0Col == 1){
           propertiesArray[propUpward][propRighty].setCaptionLabel("G(1)").setColorCaptionLabel(0).setFont(font1);
           if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
           gainValue[propUpward] = 1.0f; // Setting -15 gain value for a synth
         }
         else if (instruments[propUpward].getLabel() == "S N A R E"){
             snare[propUpward].setGain(-15);// Setting -15 gain value for a snare
         }
         else if (instruments[propUpward].getLabel() == "H A T"){
             hat[propUpward].setGain(-15); // Setting -15 gain value for a hat
         }
         else if (instruments[propUpward].getLabel() == "C L A P"){
             clap[propUpward].setGain(-15); // Setting -15 gain value for a clap
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
        // SETTING UP TRANSPOSE VALUES FOR AN INSTRUMENT
       if(instPropRighty == 1){
         if (instruments[propUpward].getLabel() == "S Y N T H"){
         if(time0Col == 0){
           if (time0Row == 0){
             propertiesArray[propUpward][propRighty].setCaptionLabel("Tr0").setColorCaptionLabel(0).setFont(font1);
             transVal[propUpward] = 0.0; // transposing the synth value of a row
           }
           if (time0Row == 1){
             propertiesArray[propUpward][propRighty].setCaptionLabel("Tr1").setColorCaptionLabel(0).setFont(font1);
             transVal[propUpward] = 2.0; // transposing the synth value of a row
           }
           if (time0Row == 2){
             propertiesArray[propUpward][propRighty].setCaptionLabel("Tr2").setColorCaptionLabel(0).setFont(font1);
             transVal[propUpward] = 3.0; // transposing the synth value of a row
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
       }
        // SETTING UP THE EFFECT VALUES FOR AN INSTRUMENT
       if(instPropRighty == 2){
         if (instruments[propUpward].getLabel() == "S Y N T H"){
         if(time0Col == 0){ // Setting up delay values
           if (time0Row == 0){
             propertiesArray[propUpward][propRighty].setCaptionLabel("D_off").setColorCaptionLabel(0).setFont(font1);
             delayVal[propUpward] = 0.0;
           }
           if (time0Row == 1){
             propertiesArray[propUpward][propRighty].setCaptionLabel("D_on").setColorCaptionLabel(0).setFont(font1);
             delayVal[propUpward] = 1.0;
           }
         }
         if(time0Col == 1){ // Setting up bitcrush values
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
  }
   
   // SETTING UP THE WAVE VALUES FOR AN INSTRUMENT
   if(instPropUpward == 1){
     if(instPropRighty == 0){
       if (instruments[propUpward].getLabel() == "S Y N T H"){
       if(time0Col == 0){
           propertiesArray[propUpward][propRighty].setCaptionLabel("Sin").setColorCaptionLabel(0).setFont(font1);
           disWave[propUpward] = Waves.SINE; // sine wave
       }
       if(time0Col == 1){
           propertiesArray[propUpward][propRighty].setCaptionLabel("Sq").setColorCaptionLabel(0).setFont(font1);
           //panValue = 1;
           disWave[propUpward] =  Waves.SQUARE; //square wave
       }
       if(time0Col == 2){
           propertiesArray[propUpward][propRighty].setCaptionLabel("Saw").setColorCaptionLabel(0).setFont(font1);
           disWave[propUpward] = Waves.SAW; //saw wave
       }
       }
     }
     
    // DELETING VALUES FOR AN INSTRUMENT
   if(instPropRighty == 1){
     if(time0Col == 0){
       if(propertiesArray[propUpward][propRighty].getLabel() == "P1" || propertiesArray[propUpward][propRighty].getLabel() == "P-1"){
         panValue[propUpward] = 0;
         
         if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
           panValue[propUpward] = 0;;
         }
           else if (instruments[propUpward].getLabel() == "S N A R E"){ //setting a snare pan to zero
               snare[propUpward].setPan(0);
           }
           else if (instruments[propUpward].getLabel() == "H A T"){ //setting a hat pan to zero
               hat[propUpward].setPan(0);
           }
           else if (instruments[propUpward].getLabel() == "C L A P"){ ///setting a clap pan to zero
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
               snare[propUpward].setGain(-20); //setting a snare gain to default
           }
           else if (instruments[propUpward].getLabel() == "H A T"){
               hat[propUpward].setGain(-20); //setting a hat gain to default
           }
           else if (instruments[propUpward].getLabel() == "C L A P"){
               clap[propUpward].setGain(-20); //setting a clap gain to default
           }
         }
       if(propertiesArray[propUpward][propRighty].getLabel() != "D_OFF"){
         delayVal[propUpward] = 0.0; //setting a delay value to zero (default)
       }
       if(propertiesArray[propUpward][propRighty].getLabel() != "B_OFF"){
         bitRes[propUpward] = 0; //setting a bitCrush value to zero (default)
        }
       if(propertiesArray[propUpward][propRighty].getLabel() != "SQ" || propertiesArray[propUpward][propRighty].getLabel() != "SIN" || propertiesArray[propUpward][propRighty].getLabel() != "SAW"){
         disWave[propUpward] = Waves.SINE; //setting a wave value to sine (default)
       }
       propertiesArray[propUpward][propRighty].setCaptionLabel(""); //setting propertyArray caption to empty
     }
     if(time0Col == 1){
       if (instruments[propUpward].getLabel() == "S Y N T H"){ //if pattern array instrument is a synth
         for(int i = 0; i < 8; i++){
           patternsArray[propUpward][i].setCaptionLabel(""); //setting Pattern Array caption to empty
           cp5.get(controlP5.Button.class, "patternsArray" + propUpward + i).setColorBackground( color(#ffffff) ); //changing a synth Pattern Array colour to default(white)
         }
         for(int i = 0; i < 8; i++){
           instList[propUpward][i] = 0.0; //setting frequency values in pattern array to 0.0
         }
       }
       else{ //if pattern array instrument is not a synth
         for(int h = 0; h < 8; h++){
           decision[propUpward][h] = 0; // changing Pattern Array decision values to zero
           patternsArray[propUpward][h].setCaptionLabel(""); //setting Pattern Array caption to empty
           cp5.get(controlP5.Button.class, "patternsArray" + propUpward + h).setColorBackground( color(#ffffff) ); //changing a synth Pattern Array colour to default(white)
         }
       }
     }
   }
    
    // SETTING UP THE PAN VALUES FOR AN INSTRUMENT
   if(instPropRighty == 2){
     if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() != "S N A R E" ||  instruments[propUpward].getLabel() != "K I C K"){ //checking if instrument is a synth or snare
     if(time0Col == 0){
         propertiesArray[propUpward][propRighty].setCaptionLabel("P0").setColorCaptionLabel(0).setFont(font1);
         if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
           panValue[propUpward] = 0; //changing pan value for synth or kick to zero (default)
         }
         else if (instruments[propUpward].getLabel() == "S N A R E"){
             snare[propUpward].setPan(0); //changing pan value for snare to zero (default)
         }
         //else if (instruments[propUpward].getLabel() == "H A T"){ 
         //    hat[propUpward].setPan(0); //changing hat value for snare to zero (default)
         //}
         //else if (instruments[propUpward].getLabel() == "C L A P"){
         //    clap[propUpward].setPan(0); //changing clap value for snare to zero (default)
         //}
     }
     if(time0Col == 1){
         propertiesArray[propUpward][propRighty].setCaptionLabel("P1").setColorCaptionLabel(0).setFont(font1);
         if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
           panValue[propUpward] = 1; //changing snare value for synth and kick to right
         }
         else if (instruments[propUpward].getLabel() == "S N A R E"){
             snare[propUpward].setPan(1); //changing pan value for snare to right
         }
         //else if (instruments[propUpward].getLabel() == "H A T"){
         //    hat[propUpward].setPan(1); //changing pan value for hat to right
         //}
         //else if (instruments[propUpward].getLabel() == "C L A P"){
         //    clap[propUpward].setPan(1); //changing pan value for clap to right
         //}
     }
     if(time0Col == 2){
         propertiesArray[propUpward][propRighty].setCaptionLabel("P-1").setColorCaptionLabel(0).setFont(font1);
         if (instruments[propUpward].getLabel() == "S Y N T H" || instruments[propUpward].getLabel() == "K I C K"){
           panValue[propUpward] = -1; //changing pan value for synth and kick to left
         }
         else if (instruments[propUpward].getLabel() == "S N A R E"){
             snare[propUpward].setPan(-1); //changing pan value for snare to left
         }
         //else if (instruments[propUpward].getLabel() == "H A T"){
         //    hat[propUpward].setPan(-1); //changing pan value for hat to left
         //}
         //else if (instruments[propUpward].getLabel() == "C L A P"){
         //    clap[propUpward].setPan(-1); //changing pan value for clap to left
         //}
     }
     
   }
  }
 }
}
