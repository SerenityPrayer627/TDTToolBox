unsigned int SOA = 250;
unsigned int HTime = 230;
unsigned char ProDeno = 10;
unsigned char StdSequence[] = {1,2};
unsigned char DevSequence[] = {4,8};

boolean PreviousDev = false;

void setup() {

  for (int i=0;i<8;i++){
    pinMode(i,OUTPUT);
  }

  pinMode(10,INPUT);
  randomSeed(analogRead(0));
  
}

void loop() {
  while(digitalRead(10) == 1){
    for (int i=0;i<sizeof(StdSequence);i++){
      WriteByte(~0x00);
      delay(SOA-HTime);
      if (random(ProDeno) == 0 && PreviousDev == false){
        PreviousDev = true;
        WriteByte(~DevSequence[i]);
      }else{
        if (PreviousDev == true){
          WriteByte(~(StdSequence[i] | 0x80));
          PreviousDev = false;
        }else{
          WriteByte(~StdSequence[i]);
        }
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
