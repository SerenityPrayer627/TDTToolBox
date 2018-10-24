unsigned int SOA = 250;
unsigned int HTime = 230;
unsigned char RandomRange = 10;
unsigned char StdSequence[] = {1,2};
unsigned char DevSequence[] = {4,8};

unsigned char DevCount = 0;

void setup() { 

  for (int i=0;i<8;i++){
    pinMode(i,OUTPUT);
  }

  pinMode(10,INPUT);
  randomSeed(analogRead(0));
  
}

void loop() {
  while(digitalRead(10) == 0){
    WriteByte(~0x00);
  }
  while(digitalRead(10) == 1){
    for (int i=0;i<sizeof(StdSequence);i++){
      WriteByte(~0x00);
      delay(SOA-HTime);
      if (random(RandomRange) == 0 && DevCount == 0){
        DevCount = 1;
        WriteByte(~DevSequence[i]);
      }else if(DevCount != 0){
        switch (DevCount){
          case 1:
            DevCount = 2;
            WriteByte(~StdSequence[i]);
            break;

          case 2:
            DevCount = 0;
            WriteByte(~(StdSequence[i] | 0x80));
            break;
        }
      }else{
          WriteByte(~StdSequence[i]);
      }
      delay(HTime);
    }
  }
}

void WriteByte(unsigned char Data){
    for(int i=0;i<8;i++){
        digitalWrite(i,((Data>>i)&0x01));
    }
}
