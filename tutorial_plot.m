%% 

t=(0:.01:1); y=sin(2*pi*6*t);plot(t,y) %plot sin function with 6 cycles
hold on;
t=(0:.01:1); y1=cos(2*pi*6*t);plot(t,y1)
xlabel('time'),ylabel('value');legend('sin','cos');title('my plot');
%print -dpng myplot.png
%close
hold off;
%%
%%%%%%%%%%%%%%%% figure

t=[0:.01:1]; y1=cos(2*pi*6*t);
t=[0:.01:1]; y2=sin(2*pi*6*t);
%figure(1);plot(t,y1)
%figure(2);plot(t,y2,'r')
%%%%%%%%% subplot
figure(1);subplot(1,2,1);plot(t,y1);xlabel('time');ylabel('value');legend('cos');axis([0 .5 -.5 1]);
figure(1);subplot(1,2,2);plot(t,y2);xlabel('time');ylabel('value');legend('sin');axis([0 .5 -.5 1]);
%%%%%%%%%%%%%
%clf;
%%
a=magic(15);imagesc(a); colorbar;colormap gray
a(8,1)
a(7,1)
%%
% -------------fplot()......
% Plot 2-D function
%plots the function FUN between the limits of the current x axes, with a default of [-5 5].
% fplot(FUN,LIMS) plots the function FUN between the x-axis limits specified by LIMS = [XMIN XMAX].

fplot(@sin)
%%
%{
fplot3   Plot 3-D parametric curve
fplot3(FUNX,FUNY,FUNZ) plots the parametric curve FUNX(T), FUNY(T), and
FUNZ(T) over the default domain -5 < T < 5.
%}
 fplot3(@sin,@cos,@log)
 fplot3(@(t) sin(2*t),@(t) cos(t), @(t) sin(3*t+2), [-pi,pi], '--*')
 fplot3(@cos, @(t) t.*sin(t), @sqrt)
 fplot3(@(x)x.*cos(x),@(x)x.*sin(x),@log,[0.1 123],'LineWidth',2) 
 %%
c = 10;
mygrid = @(x,y) ndgrid((-x:x/c:x),(-y:y/c:y));
[x,y] = mygrid(pi,2*pi);
z = sin(x) + cos(y);
figure(1);subplot(1,2,1);plot3(x,y,z)
figure(1);subplot(1,2,2);mesh(x,y,z)
%%
%%