//Libraries: uses Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, &
//
void setup() 
{
  //size(500,600); //Remeber, Display Geometry is Mandatory 
  minim = new Minim(this); //loads from data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("MusicDownload/The_Simplest.mp3"); //able to pass absolute path, file name & extension, and URL
}//End setup
// 
void draw() {
  if ( song1.isLooping() ) println("There are", song1.loopCount()-1, "loops left");
  if ( song1, isPlaying() && song1.isLooping() ) println("Play Once");
}//End draw
//
void keyPressed() 
{
  //Only press a number for this code below 
  println(key);
  if ( key=='1' || key=='9' ) { //Looping Functions
  if ( key == '1') println("Looping 1 time");
  if ( key == '9') println("Looping 9 times");
    String keystr = String.valueOf(key);
    println("Number of Repeats is", keystr);
    int num = int(keystr);
    song1.loop(num);
  }//End LOOP
  if ( key>='2' && key!='9' ) println("I do not loop that much! Try Again.");
  //
  //Alternate Play Button
  if ( key=='p' || key=='P' ); song1.play(); //Parameter is milli-seconds from start of audio file to start of playing
  //
  /*
  //Previous Play Button & Loop Button
   int loopNum = 2; //local Variables plays once and loops twice 
   if ( key=='l' || key=='L' ); song1.loop(loopNum); //Parameter is number of repeats;
   */
   //
   if () { //MUTE Button
   } else {
   }//End MUTE
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
