class AudioController{
  AudioPlayer audioFile;
  int audioGain;
  
  AudioController(String fileName, int gain){
    audioGain = gain;
    audioFile = minim.loadFile(fileName);
    audioFile.setGain(audioGain);
    audioFile.play();
  }
  
  void switchPlay(){
    if(audioGain > -80){
      audioGain = -80;
      audioFile.setGain(audioGain);
    } else {
      audioGain = 0;
      audioFile.setGain(audioGain);
    }
  }
  
  void resetGain(){
    audioGain = -80;
    audioFile.setGain(audioGain);  
  }
}

