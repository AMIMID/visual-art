(
s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=6;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(1);
s.options.memSize = 8192*32*2;
s.options.blockSize = 64*4;
s.options.maxNodes = 1024 * 16;
s.options.sampleRate= 44100;
s.boot;
)


Buffer.freeAll

// OSCdef(\amp1, { |msg|
// 	~a = msg[3];
// 	defer { ~v.refresh };
// }, '/a', s.addr);
//
// OSCdef(\freq1, { |msg|
// 	~b = msg[3];
// 	defer { ~v.refresh };
// }, '/b', s.addr);
//
// OSCdef(\amp2, { |msg|
// 	~c = msg[3];
// 	defer { ~v.refresh };
// }, '/a', s.addr);
//
// OSCdef(\freq2, { |msg|
// 	~d = msg[3];
// 	defer { ~v.refresh };
// }, '/b', s.addr);




(
Buffer.freeAll;

~controlBus_m = Bus.control(s, 1);
~controlBus_a = Bus.control(s, 1);
~controlBus_a1 = Bus.control(s, 1);
~controlBus_spread = Bus.control(s, 1);


SynthDef.new(\player,{
	arg tempo;
	var env;
	var sig1, sig2, sig3, sig4,control,sig;

	sig=SinOsc.kr(0.01).range(1,4);

	Out.kr(~controlBus_m.index, sig);
	//Out.kr(~controlBus_m.index, sig);
	Out.kr(~controlBus_a.index, SinOsc.kr(0.1,0.degrad,mul:1).range(90.neg.degrad,90.degrad));
	Out.kr(~controlBus_a1.index, SinOsc.kr(0.1,90.degrad,mul:1).range(90.neg.degrad,90.degrad));

//Out.ar(0,sig*1);
//Out.ar(1,sig*1);

}).add;
)



Server.freeAll


//////////////////////////////////////////////////////////////////////animation

(
var data;
var az=0,el=0;
var sph,pl=0,magg,r;
var run = true;
var ot=0.degrad,dota,pla=0;
var  sph1,sph2,sph3,sph4,sph5,m_x=1.5,m_y=2,m_z=1.5;
var az1=0,el1=0,az2=0,el2=0,az3=0,el3=0,mag,mag_x,mag_y,mag_z;
var az4=0,el4=0,az5=0,el5=0,pl1=0,pl2=0,pl3=0,pl4=0,pl5=0;
var angle=0,ang=0;
var azimuth,elevation,magnitudex,magnitudey,magnitudez;
var durx,dury,durz;
var sphx,sphy,sphz,azx,elx,azy,ely,azz,elz,plx=0,ply=0,plz=0;
var num=1.neg,amplitude,amplitude1,amplitude2,a,mod_angle,mod_angle1,mod_angle0;
Synth.new(\player);
data = [];

w = Window.new("3D Scatterplot", Rect(40,40, 800, 800)).front;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
a = ScatterView3d(~v, Rect(0,0, 800,800), data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1.5;
a.symbolColor = Color.white;
a.background = Color.black;

  r= Routine({loop{

	data=[];
	//m_x=~controlBus_mx.getSynchronous;
	//m_y=~controlBus_my.getSynchronous;
	//m_z=~controlBus_mz.getSynchronous;
		//m=~controlBus_m.getSynchronous;
	m=2;
	mod_angle=~controlBus_a.getSynchronous;
	mod_angle1=~controlBus_a1.getSynchronous;
	//mod_angle0=~controlBus_a0.getSynchronous;
	//	a.symbolColor = Color.new(amplitude,1,amplitude);

	(
{
			~az=[];~el=[];~magx=[];~magy=[];~magz=[];~dur=[];

		360.do{
azimuth=(12).collect{

			az1 = (angle+(360*2.pow(pl1/12))).wrap(180.neg,180);  // Increment azimuth
				el1 = (angle+(180*2.pow(pl1/12))).wrap(90.neg,90);
		pl1=(pl1+1).mod(12);

		sph1=Spherical(1,(az1.degrad),(el1.degrad)).theta.round(0.00001);

	};

elevation=(12).collect{

				az2 = (angle+(360*2.pow(pl2/12))).wrap(180.neg,180);  // Increment azimuth
			el2 = (angle+(180*2.pow(pl2/12))).wrap(90.neg,90);
		pl2=(pl2+1).mod(12);

		sph2=Spherical(1,(az2.degrad),(el2.degrad)).phi.round(0.00001);

	};

magnitudex=(12).collect{

			 					az3 = (angle+(360*2.pow(pl3/12))).wrap(180.neg,180);  // Increment azimuth
			 					el3 = (angle+ (180*2.pow(pl3/12))).wrap(90.neg,90);
			 					pl3=(pl3+1).mod(12);

			 					sph3=Spherical(1,(az3.degrad),(el3.degrad));
			 					mag_x=(Complex(cos(((sph3.theta+mod_angle).round(0.00001)*m).wrap(pi.neg,pi)),cos(((sph3.theta+mod_angle).round(0.00001)*m).wrap(pi.neg,pi))).rho*Complex(cos((sph3.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),cos((sph3.phi.round(0.00001)).wrap((pi/2).neg,(pi/2)))).rho)*sph3.rho;

			 					/*		mag_x=(Complex(cos((sph3.theta.round(0.00001)*m_x).wrap(pi.neg,pi)),
			 					cos((sph3.theta.round(0.00001)*m_x).wrap(pi.neg,pi))).rho*
			 					Complex(sin((sph3.phi.round(0.00001)*(m_x-1)).wrap((pi/2).neg,(pi/2))),sin((sph3.phi.round(0.00001)*(m_x-1)).wrap((pi/
			 					2).neg,(pi/2)))).rho*
			 					Complex(cos((sph3.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),cos((sph3.phi.round(0.00001)).wrap((pi/2).neg,(pi/2)))).rho)*sph3.rho;*/

			 				};

magnitudey=(12).collect{

			 					az4 = (angle+(360*2.pow(pl4/12))).wrap(180.neg,180);  // Increment azimuth
			 					el4 = (angle+(180*2.pow(pl4/12))).wrap(90.neg,90);
			 					pl4=(pl4+1).mod(12);

			 					sph4=Spherical(1,(az4.degrad),(el4.degrad));

			 					mag_y=(Complex(sin(((sph4.theta+mod_angle1).round(0.00001)*m).wrap(pi.neg,pi)),
			 						sin(((sph4.theta+mod_angle1).round(0.00001)*m).wrap(pi.neg,pi))).rho*
			 						Complex(cos((sph4.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),cos((sph4.phi.round(0.00001)).wrap((pi/2).neg,(pi/
			 					2)))).rho)*sph4.rho;
			 					//		mag_y=(Complex(sin((sph4.theta.round(0.00001)*m_y).wrap(pi.neg,pi)),sin((sph4.theta.round(0.00001)*m_y).wrap(pi.neg,pi))).rho*
			 					//Complex(sin((sph4.phi.round(0.00001)*(m_y-1)).wrap((pi/2).neg,(pi/2))),sin((sph4.phi.round(0.00001)*(m_y-1)).wrap((pi/2).neg,(pi/2)))).rho*
			 					//Complex(cos((sph4.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),cos((sph4.phi.round(0.00001)).wrap((pi/2).neg,(pi/2)))).rho)*sph4.rho;
			 				};

magnitudez=(12).collect{

			 					az5 = (angle+(360*2.pow(pl5/12))).wrap(180.neg,180);  // Increment azimuth
			 					el5 = (angle+(180*2.pow(pl5/12))).wrap(90.neg,90);
			 					pl5=(pl5+1).mod(12);

			 					sph5=Spherical(1,(az5.degrad),(el5.degrad));
					mag_z=Complex(cos(((sph5.phi+mod_angle).round(0.00001)*m).wrap((pi/2).neg,(pi/2))),cos(((sph5.phi).round(0.00001)*m).wrap((pi/2).neg,(pi/2)))).rho*sph5.rho



			 				};angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);~az=~az++azimuth;~el=~el++elevation;~magx=~magx++magnitudex;~magy=~magy++magnitudey;~magz=~magz++magnitudez;

				};
}.value;
(
~magx=~magx/(2.sqrt);
~magy=~magy/(2.sqrt);
~magz=~magz/(2.sqrt);
 );
);
	dota=(360).collect{

	az=~az.[pla];
	el=~el.[pla];

	magg=Cartesian(0,0,~magz.[pla]).rho/(2.sqrt);
	pla=pla+1;

		sph=Spherical((magg)*600,az,el).asCartesian.asArray;



};
	pla=0;

	data =data++dota;
	//data.postln;
 	a.data = data;            // Update ScatterView3d
0.065.wait
}});
r.play;


~v.animate;
~v.drawFunc ={
Pen.translate(400,400);

		a.rot(ot,ot,ot);
    ~v.refresh;

		ot=ot+0.1.degrad;

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (0.001).wait } }.fork(AppClock);
);




/////