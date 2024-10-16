(
var phase,angle=0,phase1,angle1=90;

~phase1=(360*64).collect{

	phase=exp(Complex(0,1)*angle.degrad).theta;
	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	phase.round((0.0001))
};
~phase2=(360*64).collect{

	phase1=exp(Complex(0,1)*angle1.degrad).theta;
	angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	phase1.round((0.0001)).neg
};

)
(
var phase,angle=0,mag,phase1,angle1=0,mag1,m=5;

~magL = (360*64).collect{

	phase=exp(Complex(0,1)*angle.degrad).theta;
	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	phase.round((0.0001));
	mag=Complex(cos(phase.round((0.0001))*m),cos(phase.round((0.0001))*m)).rho.round((0.0001))*Complex(cos(phase.round((0.0001))*m),cos(phase.round((0.0001))*m)).rho.round((0.0001));
	};

~magR = (360*64).collect{

	phase1=exp(Complex(0,1)*angle1.degrad).theta;
	angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	phase1.round(0.0001);
		mag1=Complex(sin(phase1.round(0.0001)*m),sin(phase1.round(0.0001)*m)).rho.round(0.0001)*Complex(cos(phase1.round(0.0001)*m),cos(phase1.round(0.0001)*m)).rho.round(0.0001);
	};
)
////////////////////////////////////////
(
var  sph1,sph2,sph3,sph4,sph5,m_x=3,m_y=3,m_z=4;
var az1=0,el1=0,az2=0,el2=0,az3=0,el3=0,mag,mag_x,mag_y,mag_z;
var az4=0,el4=0,az5=0,el5=0;

~az = (360*64).collect{

		az1=(az1+(1)).wrap(180.neg,180);

	el1=(el1+(360-(360/1.6180339887499))).wrap(90.neg,90);

	sph1=Spherical(1,az1.degrad,el1.degrad).theta.round(0.00001);

	};

~el = (360*64).collect{

		az2=(az2+(1)).wrap(180.neg,180);

	el2=(el2+(360-(360/1.6180339887499))).wrap(90.neg,90);

	sph2=Spherical(1,az2.degrad,el2.degrad).phi.round(0.00001);

	};
)

//////

(
var c,angle=0,c_real,c_imag,z;

~az = (360*64).collect{
 	c_real=exp(Complex(0,1)*angle.degrad).real;
	c_imag=exp(Complex(0,1)*angle.degrad).imag;
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
(
var data;
var az=0,el=0;
var m=600,sph,az1,el1,pl=89,daz,del,harm,mag,r;
var r1,harm1,r2,harm2,rad;

data = (360*32).collect{

	az=~az.[pl];
	el=~el.[pl];
	mag=Complex(~magL.[pl]/(2.sqrt),~magR.[pl]/(2.sqrt)).rho/(2.sqrt);
	pl=pl+1;

	sph=Spherical(mag*1000,az,el).asCartesian.asArray;


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

