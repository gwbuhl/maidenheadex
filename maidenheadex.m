function [exmh]=maidenhead(lat,long)
% conversion long/lat en degr� d�cimaux vers maidenhead grid
% longitude positive vers l'est (n�gative vers l'ouest)
% latitude positive vers le nord (n�gative vers le sud)
% Y.OESCH / 30.5.2002

%===============================        choisir un exemple au choix ou en modifier un
%                                       supprimer les % en debut de ligne
%long=6.46673           %Suchet: JN36FS
%lat=46.77219

%long=6.62556           %Villars: JN36HP
%lat=46.65389

%long=6.63355           %Lsne: JN36HM
%lat=46.51979

%long=7.47194           %lommiswil: JN37RF
%lat=47.22470

%long=-41.683           %GG97DO
%lat=-22.40

%long=-97.73            %EM10DG
%lat=30.266

%long=7.00170            %ASULAB, Marin (NE)
%lat=47.01248
%================================

long_mh=long+180;                           %d�callage de la grille
lat_mh=lat+90;

digit1=floor(long_mh/20)+1;                 %1er digit (tranche de 20 degr�s longitude)
char1=char(digit1+64);                      %conversion en alphab�tique

digit2=floor(lat_mh/10)+1;                  %2�me digit (tranche de 10 degr�s latitude)
char2=char(digit2+64);                      %conversion en alphab�tique

digit3=floor(mod(long_mh,20)/2);            %3�me digit (tranche de 2 degr� longitude)
char3=num2str(digit3);                      %conversion ASCII

digit4=floor(mod(lat_mh,10)/1);             %4�me digit (tranche de 1 degr� latitude)
char4=num2str(digit4);                      %conversion ASCII

digit5=floor(mod(long_mh,2)*60/5)+1;        %5�me digit (tranche de 5 minutes d'arc longitude)
char5=char(digit5+64);                      %conversion en alphab�tique

digit6=floor(mod(lat_mh,1)/1*60/2.5)+1;     %6�me digit (tranche de 2.5 minutes d'arc latitude)
char6=char(digit6+64);                      %conversion en alphab�tique

digit7=floor(mod(long_mh,1/12)*120)            %7�me digit (tranche de 30 seconds longitude)
char7=num2str(digit7)                      %conversion ASCII

digit8=floor(mod(lat_mh,1/24)*240)             %8�me digit (tranche de 15 seconds latitude)
char8=num2str(digit8)   


exmh=strcat(char1,char2,char3,char4,char5,char6,char7, char8) %concat�nation et affichage