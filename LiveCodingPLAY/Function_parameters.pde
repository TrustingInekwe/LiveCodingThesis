void propFuncSel0() {
   for(int i = 0; i < 4; i++){
    if (propRighty == i){
      for (int h = 0; h < 400; h += 50){
        int j = h/50;
        if(propUpward == j){
          fill(color(#C62222));
          rect((width/2) + (width/5) + 95 + (i*70), h + 70, 60, 40);
        }
      }
    }
  }
  for(int i = 0; i < 3; i++){
    if (instPropRighty == i){
      for (int h = 0; h < 100; h += 50){
        int j = h/50;
        if(instPropUpward == j){
          fill(color(#C62222));
          rect(513 + (i*130), height/2 + 30 + (j*173), 125, 132);
        }
      }
    }
  }
  
  if (instPropUpward == 0) {
    if (instPropRighty == 0) {
      //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
      //fill(#AF69EF);
    //  fill(#1E64B6);
    //rect(910, height/2 , 220, 25);
      fill(#645605);
      rect(910, height/2 , 220, 25);
      fill(250);
      textSize(15);
      text("FUNCTION PARAMETERS", 910, height/2 + 20);
      fill(#FFED87);
      rect(910, height/2 + 35, 220, 290 );
      
      //stroke(#AF69EF);
      //strokeWeight(15.0);
      //strokeCap(SQUARE);
      //line(770, height/2 + 81, 1010, height/2 + 81 );
      //noStroke();
      time0 = cp5.addRadioButton("timeRadioButton1");
      time0.setPosition(930, height/2 + 80);
      time0.setSize(20, 20);
      time0.setColorForeground(color(255));
      time0.setColorActive(color(#C62222));
      time0.setColorLabel(color(0));
      //time0.setColorLabel(color(0));
      //time0.setItemsPerRow(3);
      //time0.setSpacingColumn(50);
      time0.setSpacingRow(15);
      time0.addItem("Normal(0.5)", 1).getItem(0).setFont(font1);
      time0.addItem("Medium(1.0)", 2).getItem(1).setFont(font1);
      time0.addItem("Medium(1.5)", 3).getItem(2).setFont(font1);
      time0.addItem("High(2.0)", 4).getItem(3).setFont(font1);
      time0.addItem("High(2.5)", 5).getItem(4).setFont(font1);
      time0.addItem("High(3.0)", 6).getItem(5).setFont(font1);
      ;
      if (time0Col == 0) {
        time0.activate(0);
      }
      if (time0Col == 1) {
        time0.activate(1);
      }
      if (time0Col == 2) {
        time0.activate(2);
      }
      if (time0Col == 3) {
        time0.activate(3);
      }
      if (time0Col == 4) {
        time0.activate(4);
      }
      if (time0Col == 5) {
        time0.activate(5);
      }
      if (time0Col == 6) {
        time0.activate(6);
      }
    }

    if (instPropRighty == 1) {
      fill(#645605);
      rect(910, height/2 , 220, 25);
      fill(250);
      textSize(15);
      text("FUNCTION PARAMETERS", 910, height/2 + 20);
      fill(#FFED87);
      rect(910, height/2 + 35, 220, 290 );
      //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
      transpose0 = cp5.addRadioButton("transposeRadioButton2");
      transpose0.setPosition(930, height/2 + 80);
      transpose0.setSize(20, 20);
      transpose0.setColorForeground(color(120));
      transpose0.setColorActive(color(#C62222));
      transpose0.setColorLabel(color(0));
      transpose0.setItemsPerRow(3);
      transpose0.setSpacingColumn(50);
      //transpose0.setSpacingRow(50);
      transpose0.setSpacingRow(15);
      transpose0.addItem("Tr0", 1).getItem(0).setFont(font1);
      transpose0.addItem("Tr+1", 2).getItem(1).setFont(font1);
      transpose0.addItem("Tr+2", 3).getItem(2).setFont(font1);
      transpose0.addItem("Tr+3", 4).getItem(3).setFont(font1);
      transpose0.addItem("Tr+4", 5).getItem(4).setFont(font1);
      transpose0.addItem("Tr-1", 2).getItem(5).setFont(font1);
      transpose0.addItem("Tr-2", 3).getItem(6).setFont(font1);
      transpose0.addItem("Tr-3", 4).getItem(7).setFont(font1);
      transpose0.addItem("Tr-4", 5).getItem(8).setFont(font1);
      ;
      if (time0Col == 0) {
        if (time0Row == 0) {
          transpose0.activate(0);
        }
        if (time0Row == 1) {
          transpose0.activate(1);
        }
        if (time0Row == 2) {
          transpose0.activate(2);
        }
      }
      if (time0Col == 1) {
        if (time0Row == 0) {
          transpose0.activate(3);
        }
        if (time0Row == 1) {
          transpose0.activate(4);
        }
        if (time0Row == 2) {
          transpose0.activate(5);
        }
      }
      if (time0Col == 2) {
        if (time0Row == 0) {
          transpose0.activate(6);
        }
        if (time0Row == 1) {
          transpose0.activate(7);
        }
        if (time0Row == 2) {
          transpose0.activate(8);
        }
      }
    }
    if (instPropRighty == 2) {
      fill(#645605);
      rect(910, height/2 , 220, 25);
      fill(250);
      textSize(15);
      text("FUNCTION PARAMETERS", 910, height/2 + 20);
      fill(#FFED87);
      rect(910, height/2 + 35, 220, 290 );
      fill(0,0,255);
      textSize(15);
      text("Delay", 930, height/2 + 70);
      text("BitCrush", 930, height/2 + 140);
      effect0 = cp5.addRadioButton("effectRadioButton3");
      effect0.setPosition(930, height/2 + 80);
      effect0.setSize(20, 20);
      effect0.setColorForeground(color(120));
      effect0.setColorActive(color(#C62222));
      effect0.setColorLabel(color(0));
      effect0.setItemsPerRow(2);
      effect0.setSpacingColumn(100);
      effect0.setSpacingRow(50);
      effect0.addItem("Off", 1).getItem(0).setFont(font3);
      effect0.addItem("On", 2).getItem(1).setFont(font3);
      effect0.addItem(" Off", 3).getItem(2).setFont(font3);
      effect0.addItem(" On", 4).getItem(3).setFont(font3);
      ;
      if (time0Col == 0) {
        if (time0Row == 0) {
          effect0.activate(0);
        }
        if (time0Row == 1) {
          effect0.activate(1);
        }
      }
      if (time0Col == 1) {
        if (time0Row == 0) {
          effect0.activate(2);
        }
        if (time0Row == 1) {
          effect0.activate(3);
        }
      }
    }
  }
  if (instPropUpward == 1) {
    if (instPropRighty == 0) {
      fill(#645605);
      rect(910, height/2 , 220, 25);
      fill(250);
      textSize(15);
      text("FUNCTION PARAMETERS", 910, height/2 + 20);
      fill(#FFED87);
      rect(910, height/2 + 35, 220, 290 );
      wave0 = cp5.addRadioButton("waveRadioButton4");
      wave0.setPosition(930, height/2 + 80);
      wave0.setSize(20, 20);
      wave0.setColorForeground(color(120));
      wave0.setColorActive(color(#C62222));
      wave0.setColorLabel(color(0));
      wave0.setItemsPerRow(1);
      //wave0.setSpacingColumn(50);
      wave0.setSpacingRow(50);
      wave0.addItem("Sine", 1).getItem(0).setFont(font1);
      wave0.addItem("Square", 2).getItem(1).setFont(font1);
      wave0.addItem("Saw", 3).getItem(2).setFont(font1);
      ;
      if (time0Col == 0) {
        wave0.activate(0);
      }
      if (time0Col == 1) {
        wave0.activate(1);
      }
      if (time0Col == 2) {
        wave0.activate(2);
      }
      if (time0Col == 3) {
        wave0.activate(3);
      }
      if (time0Col == 4) {
        wave0.activate(4);
      }
    }      
    if (instPropRighty == 1) {
      fill(#645605);
      rect(910, height/2 , 220, 25);
      fill(250);
      textSize(15);
      text("FUNCTION PARAMETERS", 910, height/2 + 20);
      fill(#FFED87);
      rect(910, height/2 + 35, 220, 290 );
      delete0 = cp5.addRadioButton("deleteRadioButton5");
      delete0.setPosition(930, height/2 + 80);
      delete0.setSize(20, 20);
      delete0.setColorForeground(color(120));
      delete0.setColorActive(color(#C62222));
      delete0.setColorLabel(color(0));
      //delete0.setItemsPerRow(3);
      //delete0.setSpacingColumn(5);
      delete0.setSpacingRow(50);
      delete0.addItem("Function", 1).getItem(0).setFont(font1);
      delete0.addItem("Pattern", 2).getItem(1).setFont(font1);
      ;
      if (time0Col == 0) {
        delete0.activate(0);
      }
      if (time0Col == 1) {
        delete0.activate(1);
      }
    }

    if (instPropRighty == 2) {
      fill(#645605);
      rect(910, height/2 , 220, 25);
      fill(250);
      textSize(15);
      text("FUNCTION PARAMETERS", 910, height/2 + 20);
      fill(#FFED87);
      rect(910, height/2 + 35, 220, 290 );
      pan0 = cp5.addRadioButton("panRadioButton8");
      pan0.setPosition(930, height/2 + 80);
      pan0.setSize(20, 20);
      pan0.setColorForeground(color(120));
      pan0.setColorActive(color(#C62222));
      pan0.setColorLabel(color(0));
      pan0.setItemsPerRow(1);
      //pan0.setSpacingColumn(50);
      pan0.setSpacingRow(50);
      pan0.addItem("Normal(0)", 1).getItem(0).setFont(font1);
      pan0.addItem("Right(1)", 2).getItem(1).setFont(font1);
      pan0.addItem("Left(-1)", 3).getItem(2).setFont(font1);
      ;
      if (time0Col == 0) {
        pan0.activate(0);
      }
      if (time0Col == 1) {
        pan0.activate(1);
      }
      if (time0Col == 2) {
        pan0.activate(2);
      }
    }
  }
}
