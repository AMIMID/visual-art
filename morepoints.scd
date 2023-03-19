


(
var y,y1,y2,y3,y4,y5;
var	p1_c;
var run = true,x=0,theta;
var ray=137.5, angle=ray.wrap(0,360);
var rad1=1,rad2=1,rad3=1,rad4=1,rad5=1,rad6=1;
var mikos=400,ipsos=400;

///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(400,100,800,800),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
v.animate;
v.drawFunc ={
Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
1000.do{

			x=x+0.0001;
		p1_c= (x)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y=exp(Complex(0,1)*(angle).degrad);
		y1=exp(Complex(0,1)*(angle).degrad);
		y2=exp(Complex(0,1)*(angle+p1_c).degrad);
		y3=exp(Complex(0,1)*(angle+p1_c).degrad);
		//y4=exp(Complex(0,1)*(angle).degrad);
		//y5=exp(Complex(0,1)*(angle).degrad);

			Pen.width=0.1;
			rad1=y.real*300;
		    rad2=y1.imag*300;
		    rad3=y2.real*300;
		    rad4=y3.imag*300;
		   // rad5=y2.real*300;
		   // rad6=y3.imag*300;

		Color(red:1,green:1,blue:1).set;
		//Pen.addOval(Rect.fromPoints(Polar.new(rad1,y.theta).asPoint,Polar.new(rad2,y1.theta).asPoint));
		//Pen.addOval(Rect.fromPoints(Polar.new(rad3,y1.theta).asPoint,Polar.new(rad3,y2.theta).asPoint));
	//Pen.addOval(Rect.fromPoints(Polar.new(rad4,y2.theta).asPoint,Polar.new(rad4,y3.theta).asPoint));

	Pen.addOval(Rect.new(Polar.new(rad1,y.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad4,y2.theta).asPoint.x,Polar.new(rad4,y3.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad4,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y,1,1));

	//Pen.line(Point.new(Polar.new(rad5,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y),
    // Point.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y));


	Pen.rotate(pi/6);
		Pen.stroke;v.refresh;


			};
//Pen.translate(500,500);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
1000.do{

			x=x+0.0001;
		p1_c= (x)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y=exp(Complex(0,1)*(angle).degrad);
		y1=exp(Complex(0,1)*(angle).degrad);
		y2=exp(Complex(0,1)*(angle+p1_c).degrad);
		y3=exp(Complex(0,1)*(angle+p1_c).degrad);
		//y4=exp(Complex(0,1)*(angle).degrad);
		//y5=exp(Complex(0,1)*(angle).degrad);

			Pen.width=0.1;
			rad1=y.real*300;
		    rad2=y1.imag*300;
		    rad3=y2.real*300;
		    rad4=y3.imag*300;
		   // rad5=y2.real*300;
		   // rad6=y3.imag*300;

		Color(red:1,green:1,blue:1).set;
		//Pen.addOval(Rect.fromPoints(Polar.new(rad1,y.theta).asPoint,Polar.new(rad2,y1.theta).asPoint));
		//Pen.addOval(Rect.fromPoints(Polar.new(rad3,y1.theta).asPoint,Polar.new(rad3,y2.theta).asPoint));
	//Pen.addOval(Rect.fromPoints(Polar.new(rad4,y2.theta).asPoint,Polar.new(rad4,y3.theta).asPoint));

		Pen.addOval(Rect.new(Polar.new(rad1,y.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad4,y2.theta).asPoint.x,Polar.new(rad4,y3.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad4,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y,1,1));

	//Pen.line(Point.new(Polar.new(rad5,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y),
    // Point.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y));


	Pen.rotate(pi/28);
		Pen.stroke;v.refresh;


			};
	1000.do{

			x=x+0.0001;
		p1_c= (x)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y=exp(Complex(0,1)*(angle).degrad);
		y1=exp(Complex(0,1)*(angle).degrad);
		y2=exp(Complex(0,1)*(angle+p1_c).degrad);
		y3=exp(Complex(0,1)*(angle+p1_c).degrad);
		//y4=exp(Complex(0,1)*(angle).degrad);
		//y5=exp(Complex(0,1)*(angle).degrad);

			Pen.width=0.1;
			rad1=y.real*300;
		    rad2=y1.imag*300;
		    rad3=y2.real*300;
		    rad4=y3.imag*300;
		   // rad5=y2.real*300;
		   // rad6=y3.imag*300;

		Color(red:1,green:1,blue:1).set;
		//Pen.addOval(Rect.fromPoints(Polar.new(rad1,y.theta).asPoint,Polar.new(rad2,y1.theta).asPoint));
		//Pen.addOval(Rect.fromPoints(Polar.new(rad3,y1.theta).asPoint,Polar.new(rad3,y2.theta).asPoint));
	//Pen.addOval(Rect.fromPoints(Polar.new(rad4,y2.theta).asPoint,Polar.new(rad4,y3.theta).asPoint));

		Pen.addOval(Rect.new(Polar.new(rad1,y.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad4,y2.theta).asPoint.x,Polar.new(rad4,y3.theta).asPoint.y,1,1));
		Pen.addOval(Rect.new(Polar.new(rad4,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y,1,1));

	//Pen.line(Point.new(Polar.new(rad5,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y),
    // Point.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y));


	Pen.rotate(pi/496);

		Pen.stroke;v.refresh;


			}
};
{ while { run } {v.background_(Color.black); v.refresh; (1/10).wait } }.fork(AppClock);
)