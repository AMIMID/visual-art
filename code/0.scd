(
var w, run = true, kapa, y, z,v,x=0,a=1,theta;

 Window.closeAll;
w = Window("panel black", Rect(128, 64, 820, 820));
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;

v = UserView.new(w,Rect(10,10,800,800)).background_(Color.black);
v.drawFunc ={
    Pen.use {
		Pen.translate(400,400);
		Pen.color = Color.white;
		Pen.width=0.1;

1000.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs;
			theta=Complex(y,kapa).angle;
			Pen.line((200)@(200),Polar.new(r+400.rand,theta+200.rand).asPoint);
			Pen.line((200)@(-200),Polar.new(r+400.rand,theta+200.rand).asPoint);
			Pen.line((-200)@(200),Polar.new(r+400.rand,theta+200.rand).asPoint);
			Pen.line((-200)@(-200),Polar.new(r+400.rand,theta+200.rand).asPoint);

				Pen.line((0)@(-400),Polar.new(r+400.rand,theta+400.rand).asPoint);
			    Pen.line((0)@(400),Polar.new(r+400.rand,theta+400.rand).asPoint);
			    Pen.line((-400)@(0),Polar.new(r+400.rand,theta+400.rand).asPoint);
			    Pen.line((400)@(0),Polar.new(r+400.rand,theta+400.rand).asPoint);
			   Pen.line((0)@(0),Polar.new(r+400.rand,theta+400.rand).asPoint);

			Pen.stroke;
		};
		Pen.stroke;

    };
};

{ while { run } { v.refresh; 0.001.wait } }.fork(AppClock)

)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////16
/////////////////////////////////////////////////////////////
(
var w, run = true, kapa, y, z,v,x=0,a=1,theta;

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

220.do{
			x=x+1;
			y=(x+a)/x;
			kapa = Complex(y,y).abs;
			z= (kapa+a)/kapa;
			r=Complex(y,kapa).abs;
			theta=Complex(y,kapa).angle;

			Pen.color = Color.gray(1.rand);Pen.line((300)@(300),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((300)@(-300),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((-300)@(300),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((-300)@(-300),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			///////////////////////////////////////////////////////////
			Pen.color = Color.gray(1.rand);Pen.line((0)@(-400),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((0)@(400),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);	Pen.line((-400)@(0),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((400)@(0),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			//////////////////////////////////////////////////////////
			Pen.color = Color.gray(1.rand);Pen.line((150)@(375),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((-150)@(-375),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((-375)@(-150),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);Pen.line((375)@(150),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			///////////////////////////////////////////////////////////
			Pen.color = Color.gray(1.rand);Pen.line((150)@(-375),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);	Pen.line((-150)@(375),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);	Pen.line((-375)@(150),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			Pen.color = Color.gray(1.rand);	Pen.line((375)@(-150),Polar.new(r+400.rand,theta+400.rand).asPoint);Pen.stroke;v.refresh;
			/////////////////////////////////////////////////////////
			Pen.color = Color.gray(1.rand);	Pen.line((0)@(0),Polar.new(r+400.rand,theta+400.rand).asPoint);
			Pen.stroke;
		};
		Pen.stroke;

    };
};

{ while { run } {v.background_(Color.rand); v.refresh; 0.1.wait } }.fork(AppClock)

)





