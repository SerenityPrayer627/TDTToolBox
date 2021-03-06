#include <MsTimer2.h>

unsigned int SOA = 250;
unsigned int ResetTime = 10;
unsigned char RandomRange[] = {2,12};
unsigned char StdSequence[] = {1,2};
unsigned char DevSequence[] = {4,8};

unsigned char NumStream = sizeof(StdSequence);
unsigned char NumSound[sizeof(StdSequence)];
unsigned char StreamNum = 0;
unsigned char EachStreamCount[sizeof(StdSequence)];
unsigned char DelayCount = 0;
boolean Previous = false;

volatile boolean flag = false;


void setup() {
  NumSound[0] = 3;
  NumSound[1] = 3;

  pinMode(10,INPUT);
  randomSeed(analogRead(0));
  MsTimer2::set(SOA,Interrupt);

  DDRD = ~0x00;
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
      NumSound[StreamNum] = 3;
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
    PORTD = ~0x00;
    StreamNum = 0;
    NumSound[0] = 3;
    NumSound[1] = 3;
    Previous = 0;
  }

  if ((PINB & 0x04) == 0x04 && Previous == false){
    Previous = 1;
    MsTimer2::start();
  }
  //------------------------------------------------------------

}

void Interrupt(){
  if (StreamNum < NumStream){
    PORTD = ~0x00;
    flag = 1;
  }
}
