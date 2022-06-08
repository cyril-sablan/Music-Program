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
int numberOfSongs = 2;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "Play List" variables holding extensions WAV, AIFF, AU, SND, & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //song[currentSong]s meta data
int currentSong = numberOfSongs - numberOfSongs; 
//
color black=0, purple=#2C08FF; //grey scale vs. hexidecimal
PFont titleFont; 
//
void setup() 
{
  //size(500,600); //Remeber, Display Geometry is Mandatory 
  minim = new Minim(this); //loads from data directory, loadFile should also load from project folder, like loadImage
  song[currentSong] = minim.loadFile("MusicDownload/The_Simplest.mp3"); //able to pass absolute path, file name & extension, and URL
  song[currentSong+=1] = minim.loadFile("MusicDownload/Newsroom.mp3");
  //array always one less
  //
  currentSong-=currentSong; //currentSong = currentSong - currentSong
  for ( int i=currentSong; i<song.length; i+=1) {
    songMetaData[i] = song[i].getMetaData();
  }//end Meta Data
  /*
  songMetaData[0] = song[0].getMetaData(); //reads song meta 1, like song[currentSong], mimicing array notation 
   songMetaData[1] = song[1].getMetaData();
   */
  titleFont = createFont ("SimSun", 55); //must also tools / create font / find font / do not press "OK"
  //
  println("start of console");
  println("click the console to finish starting this program"); // see previous lesson for OS-level button
  println("title:", songMetaData[currentSong].title() );
}//End setup
// 
void draw() {
  if ( song[currentSong].isLooping() ) println("There are", song[currentSong].loopCount(), "loops left");
  if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  println("Computer Number of Current Song:", currentSong);
  println("Song Position", song[currentSong].position(), "Song Length", song[currentSong].length() ); //Values in milliseconds 
  //
  background (black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple); //ink, hexidecimal copied from color selector
  textAlign (CENTER, CENTER); //align X&Y, see processing.org / reference
  //values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(titleFont, 8);
  text(songMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //reset to white for rest of the program
  //
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
    song[currentSong].loop(num);
  }//End LOOP
  if ( key =='l' || key=='L' ) song[currentSong].loop(); //no parameter means "infinite loops"
  //
  if ( key>='2' && key!='9' ) println("I do not loop that much! Try Again.");
  //
  //Alternate Play Button
  if ( key=='p' || key=='P' ); {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5 ) { //special situation: at the end of the song 
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play(); //Parameter is milli-seconds from start of audio file to start of playing
    }
  }//End PLAY-PAUSE Button
  //
  //forward and reverse button 
  //built-in question .isPlaying()
  if ( key=='f' || key=='F' ) song[currentSong].skip(1000) ; // skip forward 1 second (1000 millisecond) 
  if ( key=='r' || key=='R' ) song[currentSong].skip(-1000) ; // skip backward, or reverse, 1 second (1000 millisecond)
  //
  if ( key=='m' || key=='M') { //MUTE Button
    if ( song[currentSong].isMuted() ) { 
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  }//End MUTE
  //
  if ( key=='s' || key=='S' ) {//StopButton
    if ( song[currentSong].isPlaying() ) {//StopButton
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }//End STOP Button
  //
  if ( key=='n' || key =='N' ) {//Next Button
    if ( song[currentSong].isPlaying() ) {
      //serious problems, playing multiple songs at the same time
      //built in pause feature or stop feature
      song[currentSong].pause();
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    }
  }//End Next Button
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
