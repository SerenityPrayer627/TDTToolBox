#include <MsTimer2.h>

unsigned int SOA = 250;
unsigned int ResetTime = 10;
unsigned char RandomRange = 10;
unsigned char StdSequence[] = {1,2};
unsigned char DevSequence[] = {4,8};

unsigned char NumStream = 0;
unsigned char DevCount = 0;
unsigned char Count = 0;
unsigned char DelayCount = 0;
unsigned char Previous = 0;
volatile boolean flag = false;


void setup() {
  NumStream = sizeof(StdSequence);
  DDRD = 0xFF;
  pinMode(10,INPUT);
  randomSeed(analogRead(0));
  MsTimer2::set(SOA,Interrupt);
}

void loop() {

  if(flag == 1){
    //------------------------------------------------------------
    //Delay for Pulse
    delay(ResetTime);


    //------------------------------------------------------------
    //Main Sound Sequence
    
    PORTD = ~StdSequence[Count];
    Count++;

    //------------------------------------------------------------
    //Reset Count
    if(Count == NumStream){
      Count = 0;
    }
    //------------------------------------------------------------
    //Reset Flag
    flag = 0;
    //------------------------------------------------------------
    
  }
  
  //------------------------------------------------------------
  //Switch
  if((PINB & 0x04) == 0 && Previous == 1){
    MsTimer2::stop();
    PORTD = ~0x00;
    Previous = 0;
  }

  if ((PINB & 0x04) == 0x04 && Previous == 0){
    Previous = 1;
    MsTimer2::start();
  }
  //------------------------------------------------------------

}

void Interrupt(){
  if (Count < NumStream){
    PORTD = ~0x00;
    flag = 1;
  }
}
