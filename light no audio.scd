(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=4;
s.options.numInputBusChannels=0;
s.options.maxNodes=1024;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot
)

(
///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(400,100,800,800),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
~v.animate;
~v.drawFunc ={
Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
1000.do{

		x1=x1+(~a/1000);
		p1= (x1)/1;
		x2=x2+(~b/1000);
		p2= (x2)/1;
		x3=x3+(~c/1000);
		p3= (x3)/1;
		x4=x4+(~d/1000);
		p4= (x4)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y1=exp(Complex(0,1)*(angle));
		y2=exp(Complex(0,1)*(angle+p1));
		y3=exp(Complex(0,1)*(angle));
		y4=exp(Complex(0,1)*(angle+p2));
		y5=exp(Complex(0,1)*(angle));
		y6=exp(Complex(0,1)*(angle+p3));
		y7=exp(Complex(0,1)*(angle));
		y8=exp(Complex(0,1)*(angle+p4));

			Pen.width=0.8;
			rad1=y2.real*300;
		    rad2=y2.imag*300;
		    rad3=y2.real*300;
		    rad4=y2.imag*300;
		    rad5=y2.real*300;
		    rad6=y2.imag*300;
		    rad7=y2.real*300;
		    rad8=y2.imag*300;

		Color(red:1,green:1,blue:1).set;

	    Pen.addOval(Rect.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,~a*100,~a*100));

		Pen.addOval(Rect.new(Polar.new(rad3,y3.theta).asPoint.x,Polar.new(rad4,y4.theta).asPoint.y,~b*100,~b*100));

		Pen.addOval(Rect.new(Polar.new(rad5,y5.theta).asPoint.x,Polar.new(rad6,y6.theta).asPoint.y,~c*100,~c*100));

		Pen.addOval(Rect.new(Polar.new(rad7,y7.theta).asPoint.x,Polar.new(rad8,y8.theta).asPoint.y,~d*100,~d*100));

		//Pen.line(Point.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y));
		//Pen.line(Point.new(Polar.new(rad3,y3.theta).asPoint.x,Polar.new(rad4,y4.theta).asPoint.y));
		//Pen.line(Point.new(Polar.new(rad5,y5.theta).asPoint.x,Polar.new(rad6,y6.theta).asPoint.y));
		//Pen.line(Point.new(Polar.new(rad7,y7.theta).asPoint.x,Polar.new(rad8,y8.theta).asPoint.y));

		Pen.rotate((4/3)*pi);
		Pen.stroke;~v.refresh;




			};

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/1000).wait } }.fork(AppClock);
)