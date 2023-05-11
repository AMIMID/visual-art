

(
var y1,y2,y3,y4,y5,y6,y7,y8;
var	p1,p2,p3,p4;
var run = true;
var x1=0,x2=0,x3=0,x4=0;
var ray=0, angle=ray.wrap(0,360);
var rad1=1,rad2=1,rad3=1,rad4=1,rad5=1,rad6=1,rad7=1,rad8=1,rad9=1,rad10=1;



///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(400,100,800,800),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
~v.animate;
~v.drawFunc ={
Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
2000.do{

		x1=x1+(1*(1));
		p1= (x1)/1;
		x2=x2+(1*(1));
		p2= (x2)/1;
		x3=x3+(1*(1));
		p3= (x3)/1;
		x4=x4+(1*(1));
		p4= (x4)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y1=exp(Complex(0,1)*(angle));
		y2=exp(Complex(0,1)*(angle+p1));
		y3=exp(Complex(0,1)*(angle+p2));
		y4=exp(Complex(0,1)*(angle+p3));
		y5=exp(Complex(0,1)*(angle+p4));

			Pen.width=1;
			rad1=y1.real*300;
		    rad2=y1.imag*300;
		    rad3=y2.real*300;
		    rad4=y2.imag*300;
		    rad5=y3.real*300;
		    rad6=y3.imag*300;
		    rad7=y4.real*300;
		    rad8=y4.imag*300;
		    rad9=y5.real*300;
		    rad10=y5.imag*300;


		Color(red:0.999.rand,green:0.999.rand,blue:0.999.rand).set;

	    Pen.addOval(Rect.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad2,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y,1,1));

		Pen.addOval(Rect.new(Polar.new(rad4,y1.theta).asPoint.x,Polar.new(rad5,y3.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad5,y1.theta).asPoint.x,Polar.new(rad6,y3.theta).asPoint.y,1,1));

		Pen.addOval(Rect.new(Polar.new(rad7,y1.theta).asPoint.x,Polar.new(rad8,y4.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad9,y1.theta).asPoint.x,Polar.new(rad10,y4.theta).asPoint.y,1,1));




		//Pen.line(Point.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y));
		//Pen.line(Point.new(Polar.new(rad3,y3.theta).asPoint.x,Polar.new(rad4,y4.theta).asPoint.y));
		//Pen.line(Point.new(Polar.new(rad5,y5.theta).asPoint.x,Polar.new(rad6,y6.theta).asPoint.y));
		//Pen.line(Point.new(Polar.new(rad7,y7.theta).asPoint.x,Polar.new(rad8,y8.theta).asPoint.y));

		Pen.rotate((3/2)*pi);
		Pen.stroke;~v.refresh;




			};

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/1000).wait } }.fork(AppClock);
)