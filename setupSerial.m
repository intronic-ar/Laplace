function[obj,flag] = setupSerial(comPort)

flag = 1;
% Inicio de configuraciones de puerto
obj = serial(comPort);
set(obj,'DataBits',8);
set(obj,'StopBits',1);
set(obj,'BaudRate',19200);
set(obj,'Parity','none');
fopen(obj);
a = 'b';
while (a~='a') 
    a=fread(obj,1,'uchar');
end
if (a=='a')
    disp(' ')
    disp('Iniciando lectura de datos . . .');
end
fprintf(obj,'%c','a');
mbox = msgbox('Comunicación serial correcta'); uiwait(mbox);
fscanf(obj,'%u');
end
