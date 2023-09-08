float volt = 0.0;
int val = 0;
float cero = 0.0;
int relay = 9;
int f = 1;
int n = 1;

void setup()
{
  Serial.begin(19200, SERIAL_8N1);
  for (int i = 1; i <= 100; i++) {
    cero += analogRead(A0) /  100.0;
    delay(1);
  }
  pinMode(relay, OUTPUT);
  digitalWrite(relay, LOW);
  Serial.println('a');
  char a = 'b';
  while (a != 'a')  {
    a = Serial.read();
  }
}

void loop()
{

  if (Serial.available() > 0)
  {
    if (f == 1) {
      //digitalWrite(relay, HIGH);
      PORTB |= B11000010;
      f = 0;
    }

    val = Serial.read();

    if (val == 'C')
    {
      volt = (analogRead(A0) - cero) * 5.0 / 1023.0; //corriente
      Serial.println(volt, 2);
      n++;
    }

    if (val == 'V')
    {
      volt = analogRead(A1) * 5.0 / 1023.0; //voltaje
      Serial.println(volt, 2);
      n++;
    }

    else if (val == 'F')
    {
      Serial.println(volt, 2);
    }

    if (n >= 601) {
      PORTB &= B11111101;
    }

  }
}
