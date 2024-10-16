(
var c,angle=0,c_real,c_imag,z;



~c = 5.collect{
 	c_real=exp(Complex(0,1)*angle.degrad).real;
	c_imag=exp(Complex(0,1)*angle.degrad).imag;
 	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
 	c=Complex(c_real,c_imag);
 };
z=Complex(0,0);

~j = (360*64).collect{
	c=~c.[4];
	z=z.pow(2)+c;
	z.theta.round(0.000001);
}

)
(
var c,angle=0,c_real,c_imag,z;



~k = 5.collect{
 	c_real=exp(Complex(0,1)*angle.degrad).real;
	c_imag=exp(Complex(0,1)*angle.degrad).imag;
 	angle=(angle+45).wrap(0,360);
 	c=Complex(c_real,c_imag);
 };
z=Complex(0,0);

~h = (360*200).collect{
	c=~k.[4].round(0.00001);
	z=z.pow(2)+c;
	z.theta.round(0.000001);

}

)

(
var phase,angle=0,phase1,angle1=90,pl1=0,pl2=0;

~phase1=(360*64).collect{

	phase=exp(Complex(0,1)*(angle.degrad*~j.[pl1])).theta;
	pl1=pl1=1;
	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	phase.round((0.0001))
};
~phase2=(360*64).collect{

	phase1=exp(Complex(0,1)*(angle1.degrad*~j.[pl2])).theta;
	pl2=pl2;
	angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	phase1.round((0.0001)).neg
};

)
(
var phase,angle=0,mag,phase1,angle1=0,mag1,m=4,pl1=0,pl2=0;

~magL = (360*64).collect{

	phase=exp(Complex(0,1)*(angle.degrad*~j.[pl1])).theta;
	pl1=pl1=1;
	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	phase.round((0.0001));
	mag=Complex(cos(phase.round((0.0001))*m),cos(phase.round((0.0001))*m)).rho.round((0.0001))*Complex(cos(phase.round((0.0001))*m),cos(phase.round((0.0001))*m)).rho.round((0.0001));
	};

~magR = (360*64).collect{

	phase1=exp(Complex(0,1)*(angle1.degrad*~j.[pl2])).theta;
	pl2=pl2=1;
	angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	phase1.round(0.0001);
		mag1=Complex(sin(phase1.round(0.0001)*m),sin(phase1.round(0.0001)*m)).rho.round(0.0001)*Complex(cos(phase1.round(0.0001)*m),cos(phase1.round(0.0001)*m)).rho.round(0.0001);
	};
)

(
var c,angle=0,c_real,c_imag,z,pl=0;

~az = (360*64).collect{
 	c_real=exp(Complex(0,1)*(angle.degrad*~h.[pl])).real;
	c_imag=exp(Complex(0,1)*(angle.degrad*~h.[pl])).imag;
	pl=pl+1;
 	angle=(angle+1).wrap(0,360);
 	c=Complex(c_real,c_imag).theta;
 };

)

///////2d

(
var data;
var az=0,el=0;
var m=600,sph,az1,el1,pl=89,daz,del,harm,mag,r;
var r1,harm1,r2,harm2,rad,sph1;

data = (360*32).collect{

	az=~az.[pl];
	//el=~el.[pl];
	mag=Complex(~magL.[pl]/(2.sqrt),~magR.[pl]/(2.sqrt)).rho/(2.sqrt);
	pl=pl+1;

	sph=Polar(mag*800,az);
	sph1=Cartesian(sph.x,sph.y,0).asArray;


};

w = Window.new("3D Scatterplot", Rect(40,40, 1000, 800)).front;
a = ScatterView3d(w, Rect(0,0, 800,800), data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

// Y Slider
Slider(w, Rect(820, 10, 10, 450)).action_{|me|
    a.rotY = me.value * 2pi;
    w.refresh;
};
// X Slider
Slider(w, Rect(870, 10, 10, 450)).action_{|me|
    a.rotX = me.value * 2pi;
    w.refresh;
};
// Z Slider
Slider(w, Rect(920, 10, 10, 450)).action_{|me|
    a.rotZ = me.value * 2pi;
    w.refresh;
};
)
///3d

