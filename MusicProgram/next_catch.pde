void nextButtonArrayCatch() {
  if ( currentSong >= song.length-1 ) { // catch ArrayIndexOutOfBoundsException
    currentSong -= currentSong; //beginning of play list
  } else {
    currentSong++;
  }//end of catch
}//End nextButtonArrayCatch 
