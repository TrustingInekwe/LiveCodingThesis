void funcPropSelec(){
          if(instPropUpward == 0){
             if(instPropRighty == 0){
               if(time0Col == 0){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(0.5)").setColorCaptionLabel(0).setFont(font1);
                   gainValue[propUpward] = 0.5f;
               }
               if(time0Col == 1){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(1)").setColorCaptionLabel(0).setFont(font1);
                   gainValue[propUpward] = 1.0f;
               }
               if(time0Col == 2){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(2)").setColorCaptionLabel(0).setFont(font1);
                   gainValue[propUpward] = 1.5f;
               }
               if(time0Col == 3){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(3)").setColorCaptionLabel(0).setFont(font1);
                   gainValue[propUpward] = 2.0f;
               }
               if(time0Col == 4){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(4)").setColorCaptionLabel(0).setFont(font1);
                   gainValue[propUpward] = 2.5f;
               }
               if(time0Col == 5){
                   propertiesArray[propUpward][propRighty].setCaptionLabel("G(5)").setColorCaptionLabel(0).setFont(font1);
                   gainValue[propUpward] = 3.0f;
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
               }
               if(propertiesArray[propUpward][propRighty].getLabel() != "G0.5" || propertiesArray[propUpward][propRighty].getLabel() != "G1"  || propertiesArray[propUpward][propRighty].getLabel() != "G2"  || 
                 propertiesArray[propUpward][propRighty].getLabel() != "G3"  || propertiesArray[propUpward][propRighty].getLabel() != "G4"  || propertiesArray[propUpward][propRighty].getLabel() != "G5"){
                   gainValue[propUpward] = 0.5;
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
                 panValue[propUpward] = 0;
             }
             if(time0Col == 1){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("P1").setColorCaptionLabel(0).setFont(font1);
                 panValue[propUpward] = 1;
             }
             if(time0Col == 2){
                 propertiesArray[propUpward][propRighty].setCaptionLabel("P-1").setColorCaptionLabel(0).setFont(font1);
                 panValue[propUpward] = 2;
             }
           }
         }
}
