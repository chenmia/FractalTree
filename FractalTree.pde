private double fractionLength = 0.8; 
private int smallestBranch = 5; 
private double branchAngle1 = 3;
private double branchAngle2 = 0.1;

public void setup() 
{   
	size(800,800); 
  frameRate(200);
} 
public void draw() 
{ 
	background(0);     
  stroke(0,255,0,80);
  strokeWeight(10);  
	drawBranches(400,400,100,3*Math.PI/2,10); 
  branchAngle2+=0.05;
} 
public void drawBranches(int x,int y, double branchLength, double angle,double thickness) 
{  
  strokeWeight((float)thickness);
	double angle1 = angle + branchAngle1;
  double angle2 = angle - branchAngle2;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  double newthick = thickness/2;
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength>smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1,newthick);
    drawBranches(endX2, endY2, branchLength, angle2,newthick);
  }
} 
