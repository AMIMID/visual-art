(
var w,v,hexa_points,radius;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var  p1,p2,p3,p4,p5,p6;
var run = true, kapa, y, z,x=0,a=1,theta,angle=0;
var factor=6;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(600,100,1000,1000),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
~slider1 = Slider(w, Rect(200,900,600,10)).action_({ arg obj;~brightness = obj.value.linlin(0,1,0,1);v.refresh;});
v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
	Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
	~p1=Polar.new(200,pi).asPoint;~p2=Polar.new(400,pi).asPoint;
30.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs*400;
			theta=Complex(y,kapa).angle;

		20.do{
			Pen.width=z;
			angle=angle+(z*10);
			Color(red:1,green:1,blue:1,alpha:0.1).set;
			Pen.line(~p1,Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			//Pen.line(~p2,Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.rotate(pi/factor);
			};


			Pen.stroke;

};
};
{ while { run } {v.background_(Color.black); v.refresh; 0.01.wait } }.fork(AppClock)
)