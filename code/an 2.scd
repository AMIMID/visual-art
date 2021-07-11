(
var w,v,hexa_points,radius;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var  p1,p2,p3,p4,p5,p6;
var run = true, kapa, y, z,x=0,theta;
var ray=100;
var angle1=1,angle2=0;
var a=2;
///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(600,100,1000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
	~p1=Polar.new(~az,pi).asPoint;
	~p1=Polar.new(~az,pi).asPoint;
100.do{
			x=x+1;
		y=((x**a)+a)/x;
		~k = Complex(x,y).angle;
			Pen.width=0.1;
			angle1=angle1+(~k**a);
			Color(red:1,green:1,blue:1,alpha:1).set;
		Pen.rotate(pi/1);Pen.stroke;v.refresh;
			};
	Pen.width=1;
	Color(red:0,green:1,blue:1,alpha:1).set;
	Pen.line(0@60,0@(-60));Pen.stroke;v.refresh;
	Pen.line(-60@30,-60@(-30));Pen.stroke;v.refresh;
	Pen.line(60@30,60@(-30));Pen.stroke;v.refresh;
	///////////////////////////////////////////guidelines
	Pen.width=0.5;
	Color(red:0.2,green:1,blue:0.1,alpha:0.2).set;
	Pen.addRect(Rect(-200,-100,200,200));Pen.stroke;
	Pen.addRect(Rect(0,-100,400,200));Pen.stroke;
};
{ while { run } {v.background_(Color.black); v.refresh; (1/10).wait } }.fork(AppClock);
)

~pot1 = MIDIFunc.cc( { arg vel,nn,chan,src; [vel,nn,chan,src].postln;  ~az = vel.linlin(4,86,100,500)}, 71, 0);

MIDIClient.init;
MIDIIn.connectAll;
