import java.util.ArrayList;
import java.util.Calendar;

class TubeDay {
  String date;
  int journeys;

  TubeDay(String date, int journeys) {
    this.date = date;
    this.journeys = journeys;
  }

  void display(float x, float y) {
    noStroke();
    fill(map(journeys, 2, 6, 100, 255), 100, 200);
    ellipse(x, y, journeys * 10, journeys * 10);
    
    if (dist(mouseX, mouseY, x, y) < journeys * 5) {
      fill(0);
      textSize(12);
      textAlign(CENTER);

      // Adjust the offset to fully clear the circle
      float textOffset = (journeys * 5) + 15; // Add a margin of 15 units
      text(date + "\n" + journeys + " journeys", x, y - textOffset);
    }
  }
}

ArrayList<TubeDay> tubeData;

void setup() {
  size(1200, 600);
  initializeData();
}

void draw() {
  background(255);

  float x = 50;
  float y = 100;
  float gap = 20; // Minimum gap between circles

  for (int i = 0; i < tubeData.size(); i++) {
    float circleSize = tubeData.get(i).journeys * 10;

    // Ensure the next circle does not overlap or go offscreen
    if (x + circleSize > width - 50) { // Account for circle radius and margin
      y += 100; // Move to the next row
      x = 50; // Reset x for the new row
    }

    tubeData.get(i).display(x + circleSize / 2, y);
    x += circleSize + gap; // Move x for the next circle
  }
}

void initializeData() {
  tubeData = new ArrayList<>();

  // Static dataset for tube journeys
  String[] dates = {"4/11", "5/11", "6/11", "7/11", "8/11", "9/11", "10/11", "11/11", "12/11", "13/11", 
                    "14/11", "15/11", "16/11", "17/11", "18/11", "19/11", "20/11", "21/11", "22/11", "23/11", 
                    "24/11", "25/11", "26/11", "27/11", "28/11", "29/11", "30/11", "1/12", "2/12", "3/12", 
                    "4/12", "5/12", "6/12", "7/12", "8/12", "9/12", "10/12", "11/12", "12/12", "13/12"};
  int[] journeys = {3, 4, 5, 2, 6, 3, 4, 5, 2, 6, 4, 3, 5, 2, 3, 4, 5, 6, 2, 4, 3, 5, 6, 2, 4, 3, 5, 6, 2, 4, 
                    3, 5, 6, 2, 4, 3, 5, 6, 2, 4};

  for (int i = 0; i < dates.length; i++) {
    tubeData.add(new TubeDay(dates[i], journeys[i]));
  }
}
