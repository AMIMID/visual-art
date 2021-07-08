////////////////////////////16
(
var w, run = true, kapa, y, z,v,x=0,a=1,theta,angle=0;

 Window.closeAll;
w = Window("panel black", Rect(128, 64, 1000, 1000));
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;

v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
    Pen.use {
		Pen.translate(400,400);
		Pen.width=0.1;

30.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs*100;
			theta=Complex(y,kapa).angle;

		20.do{
				angle=angle+1;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((300)@(300),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((300)@(-300),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-300)@(300),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-300)@(-300),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			};
			///////////////////////////////////////////////////////////
				20.do{
				angle=angle+1;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(-400),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(400),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));	Pen.line((-400)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((400)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			};
			////////////////////////////////////////////////////////////
			20.do{
					angle=angle+1;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((150)@(375),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-150)@(-375),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		Pen.color = Color.gray(rrand(0.4,1));Pen.line((-375)@(-150),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((375)@(150),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			};
			////////////////////////////////////////////////////////////
	20.do{
					angle=angle+1;
	Pen.color = Color.gray(rrand(0.4,1));Pen.line((150)@(-375),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		Pen.color = Color.gray(rrand(0.4,1));	Pen.line((-150)@(375),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		Pen.color = Color.gray(rrand(0.4,1));	Pen.line((-375)@(150),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));	Pen.line((375)@(-150),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
				Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		};

			Pen.stroke;
			//Pen.scale(cos(pi/64.rand), sin(pi/64.rand) + 0.5 );
		//	Pen.rotate(rrand(1,10));
};};};

{ while { run } {v.background_(Color.black); v.refresh; 0.001.wait } }.fork(AppClock)

)

///////////////////////////////////////////////////////////////////////////////////////////////////////6


(
var w, run = true, kapa, y, z,v,x=0,a=1,theta,angle=0;

 Window.closeAll;
w = Window("panel black", Rect(128, 64, 1000, 1000));
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;


v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
    Pen.use {
		Pen.translate(400,400);
		Pen.width=0.1;

20.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs*1000;
			theta=Complex(y,kapa).angle;

		30.do{
				angle=angle+2;
				Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(324),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(-324),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-267)@(142),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((267)@(-160),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-267)@(-142),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((267)@(142),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
				//Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			};
			///////////////////////////////////////////////////////////

			Pen.stroke;
				//Pen.scale(cos(pi/12.rand), sin(pi/121.rand) + 0.5 );
			//Pen.rotate(rrand(1,10));
				v.refresh;
};};};

{ while { run } {v.background_(Color.black); v.refresh; 0.01.wait } }.fork(AppClock)

)

///////////////////////////////////////////////////////////////////////////////////////////////////////16

(
var w, run = true, kapa, y, z,v,x=0,a=1,theta,angle=0;

 Window.closeAll;
w = Window("panel black", Rect(128, 64, 1000, 1000));
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;

v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
    Pen.use {
		Pen.translate(400,400);
		Pen.width=0.05;

20.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs*1000;
			theta=Complex(y,kapa).angle;

		30.do{
				angle=angle+1;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(350),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((68)@(343),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-68 )@( 343),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-134)@(323),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		    Pen.color = Color.gray(rrand(0.4,1));Pen.line((134)@(323),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		    Pen.color = Color.gray(rrand(0.4,1));Pen.line(194@(291),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-194)@(291),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((247)@(247),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-247)@(247),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((291)@(194),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-291)@(194),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((323)@(134),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-323)@(134),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((343)@(68),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-343)@(68),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-350)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((350)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(-350),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((68)@(-343),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-68 )@(-343),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-134)@(-323),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		    Pen.color = Color.gray(rrand(0.4,1));Pen.line((134)@(-323),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
		    Pen.color = Color.gray(rrand(0.4,1));Pen.line(194@(-291),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-194)@(-291),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((247)@(-247),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-247)@(-247),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((291)@(-194),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-291)@(-194),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((323)@(-134),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-323)@(-134),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((343)@(-68),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-343)@(-68),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;

			};
			///////////////////////////////////////////////////////////

			Pen.stroke;
				Pen.scale(cos(pi/64.rand), sin(pi/64.rand) + 0.5 );
		Pen.rotate(pi/2);
				v.refresh;
};};};

{ while { run } {v.background_(Color.black); v.refresh; 0.001.wait } }.fork(AppClock)

)

/////////////////////////////////////////////////////////////////////////////////////////////////////////8
(
var w, run = true, kapa, y, z,v,x=0,a=1,theta,angle=0;

 Window.closeAll;
w = Window("panel black", Rect(128, 64, 1000, 1000));
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;


v = UserView.new(w,Rect(100,100,800,800)).background_(Color.black);
v.drawFunc ={
    Pen.use {
		Pen.translate(400,400);
		Pen.width=0.15;

20.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs*1000;
			theta=Complex(y,kapa).angle;

		30.do{
				angle=angle+4;
				Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(400),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((0)@(-400),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-400)@(0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((400)@(-0),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-283)@(-283),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((283)@(283),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((-283)@(283),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(rrand(0.4,1));Pen.line((283)@(-283),Polar.new(r,theta+angle).asPoint);Pen.stroke;v.refresh;
			};
			///////////////////////////////////////////////////////////

			Pen.stroke;
			//Pen.scale(cos(pi/100.rand));
			Pen.rotate(pi/2);
				v.refresh;
};};};

{ while { run } {v.background_(Color.black); v.refresh; 0.01.wait } }.fork(AppClock)

)



