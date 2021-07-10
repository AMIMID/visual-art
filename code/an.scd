(
var w,v,hexa_points,radius;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var  p1,p2,p3,p4,p5,p6;
var run = true, kapa, y, z,x=0,theta;
var ray2=100,ray1=100;
var angle1=1,angle2=0;
var a=100;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(600,100,1000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
~slider1 = Slider(w, Rect(200,900,600,10)).action_({ arg obj;~brightness = obj.value.linlin(0,1,0.01,1);v.refresh;});
v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
	~p1=Polar.new(300,2pi).asPoint;
	~p2=Polar.new(300,pi/2).asPoint;
2.do{
			x=x+1;
		y=((x**a)+a)/x;
		~k = Complex(x,y).angle;
		a.do{
			Pen.width=0.2;
			angle1=angle1+(~k**a);
			Color(red:1,green:1,blue:1,alpha:~brightness).set;
			Pen.line(~p1,Polar.new((ray1),angle1).asPoint);Pen.stroke;v.refresh;
			Pen.rotate(pi/a);
			};

};
};
{ while { run } {v.background_(Color.black); v.refresh; (1/40).wait } }.fork(AppClock);
)