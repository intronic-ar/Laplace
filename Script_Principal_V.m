%  ######################################################################
%                 LABORATORIO AMBULANTE. CAPTURA DE DATOS
%
%                      AUTOR: ING. FERNANDO LAGOMARSINO
%  ######################################################################

clear, clc
disp('                           Laboratorio ambulante de C�lculo III')
disp(' ')
disp('Ingrese datos de configuraci�n del microcontrolador:')
%comPort = input('Ingrese puerto COM: ');
comPort = 'COM3';
%F = input('Ingrese cantidad de datos a adquirir por segundo: ');
F = 10;
% Cantidad de datos por segundo (Frecuencia en Hz)
%Tiempo = input('Ingrese duraci�n de la captura de datos: ');
Tiempo = 120;
% segundos de toma de datos  
n = 0;
med = F * Tiempo; % C�lculo de la cantidad total de datos a adquirir
%disp('  ')
%disp('Ingrese datos de configuraci�n de gr�fica:')
%ymin = input('Ingrese Y m�nimo: ');
%ymax = input('Ingrese Y m�ximo: '); 
ymin = 0;
ymax = 6;
%% 

if(~exist('serialFlag','var'))
    [atmega,serialFlag] = setupSerial(comPort);
end

%%

if (~exist('h','var') || ~ishandle(h))
    h = figure(2);
    set(h,'UserData',1);
end

%%

if(~exist('myAxes','var'))
    index = 0: 1/F : Tiempo; 
    zeroIndex = zeros(size(index)); 
    tcdata = zeroIndex;
    limits = [ymin ymax];
    myAxes = axes('Xlim',[0 Tiempo],'Ylim',limits);
    grid on;
    l = line(index,[tcdata;zeroIndex]);
    set(l,'color','red','linewidth',1.5);
    xlabel('Tiempo [Seg]'),ylabel('Tensi�n [V]');
    title('Carga y descarga de un capacitor')
    drawnow;
end
%%
 

tic
           
while (n <= med )
    
    if (toc >=  1/F)
        
        tic
      mode = 'V';       
        tc = Temp(atmega,mode);
                  
        tcdata = [tcdata(2:end),tc];
        
        set(l,'Ydata',tcdata);
        
        drawnow
        
       
        n = n + 1;
    
    end
 
end
 mode = 'F';
 Temp(atmega,mode);
 fclose(atmega);
 delete(atmega);
 clc
 disp('                                Captura de datos finalizada')
 disp('Resultados: ')
 disp(' ')
 disp(['Cantidad total de datos adquiridos: ', num2str(n)])