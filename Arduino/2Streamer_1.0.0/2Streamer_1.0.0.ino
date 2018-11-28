#include <MsTimer2.h>

unsigned int SOA = 180;
unsigned int ResetTime = 10;
unsigned char RandomRange[] = {3,17};
unsigned char StdSequence[] = {1,4,16};
unsigned char DevSequence[] = {2,8,32};

unsigned char NumStream = sizeof(StdSequence);
unsigned char NumSound[sizeof(StdSequence)];
unsigned char StreamNum = 0;
unsigned char EachStreamCount[sizeof(StdSequence)];
unsigned char DelayCount = 0;
boolean Previous = false;

volatile boolean flag = false;

void setup() {

  //------------------------------------------------------------
  //Port Settings
  DDRD = 0xFF;
  DDRB = 0x00;
  //------------------------------------------------------------

  //------------------------------------------------------------
  //Initialization
  Initialize();

  pinMode(10,INPUT);
  randomSeed(analogRead(0));
  MsTimer2::set(SOA,Interrupt);

  //------------------------------------------------------------

}

void loop() {

  if(flag == 1){
    
    //------------------------------------------------------------
    //Delay for Pulse
    delay(ResetTime);

    //------------------------------------------------------------
    //Main Sound Sequence

    if(NumSound[StreamNum] == 2){
      PORTD = ~DevSequence[StreamNum];
    }else if(NumSound[StreamNum] == 1){
      PORTD = ~(StdSequence[StreamNum] | 0x80);
    }else{
      PORTD = ~StdSequence[StreamNum];
    }

    //------------------------------------------------------------
    //Reset Some Values
    NumSound[StreamNum]--;
    if(NumSound[StreamNum] == 0){
      NumSound[StreamNum] = random(RandomRange[0],RandomRange[1]);
    }
    StreamNum++;
    if(StreamNum == NumStream){
      StreamNum = 0;
    }
    //------------------------------------------------------------
    //Reset Flag
    flag = 0;
    //------------------------------------------------------------
    
  }
  
  //------------------------------------------------------------
  //Switch
  if((PINB & 0x04) == 0 && Previous == true){
    MsTimer2::stop();
    Initialize();
    Previous = 0;
  }
  
  if ((PINB & 0x04) == 0x04 && Previous == false){
    Previous = 1;
    MsTimer2::start();
  }
  //------------------------------------------------------------

}

void Initialize(){
    PORTD = ~0x00;
    StreamNum = 0;
    for(int i=0;i<NumStream;i++){
      NumSound[i] = random(RandomRange[0],RandomRange[1]);
    }
    //NumSound[0] = 3;
    //NumSound[1] = 3;
}

void Interrupt(){
  if (StreamNum < NumStream){
    PORTD = ~0x00;
    flag = 1;
  }
}
