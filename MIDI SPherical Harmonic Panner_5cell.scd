(
Server.default = s = Server.local;
////server setup
(
s.options.numWireBufs = 1024*2;
s.options.numOutputBusChannels=8;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(1);
s.options.memSize = 8192*4*2;
s.options.blockSize = 64*2;
s.options.maxNodes = 1024 * 4;
s.options.sampleRate= 44100;
);

s.waitForBoot{

Buffer.freeAll;
	//~c1 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/SC_250513_203417.wav",channels:0 );//flu

////////////////////////////////////speaker setup///other

	//~a = VBAPSpeakerArray.new(3, [[0, 45], [180, 45], [90, 45.neg], [90.neg, 45.neg]]);
		~a =VBAPSpeakerArray.new(3, [[0, 45], [90, 45], [180, 45], [90.neg, 45],[0, 45.neg], [90, 45.neg], [180, 45.neg], [90.neg, 45.neg]]);
	 ~b = Buffer.loadCollection(s, ~a.getSetsAndMatrices);



	////no0
	(
{
var  sph1,sph2,sph3,sph4,sph5,m_x=2,m_y=2,m_z=2;
var az1=0,el1=0,az2=0,el2=0,az3=0,el3=0,mag,mag_x,mag_y,mag_z;
var az4=0,el4=0,az5=0,el5=0,pl1=0,pl2=0,pl3=0,pl4=0,pl5=0;
var angle=0,ang=0;
var azimuth,elevation,magnitudex,magnitudey,magnitudez;
var durx,dury,durz;
var sphx,sphy,sphz,azx,elx,azy,ely,azz,elz,plx=0,ply=0,plz=0;
var num=1.neg;
var ellipsis=[1,1,1];
var spread=1;
			~az=[];~el=[];~magx=[];~magy=[];~magz=[];

		360.do{


azimuth=(12).collect{

			az1 = (angle+(360*2.pow(pl1/12))).wrap(180.neg,180);  // Increment azimuth
				el1 = (angle+(180*2.pow(pl1/12))).wrap(90.neg,90);
		pl1=(pl1+1).mod(12);

		sph1=(Spherical(1,(az1.degrad),(el1.degrad))/Cartesian(ellipsis.normalizeSum.sqrt.[0],ellipsis.normalizeSum.sqrt.[1],ellipsis.normalizeSum.sqrt.[2])).theta.round(0.00001);

	};

elevation=(12).collect{

				az2 = (angle+(360*2.pow(pl2/12))).wrap(180.neg,180);  // Increment azimuth
			el2 = (angle+(180*2.pow(pl2/12))).wrap(90.neg,90);
		pl2=(pl2+1).mod(12);

		sph2=(Spherical(1,(az2.degrad),(el2.degrad))/Cartesian(ellipsis.normalizeSum.sqrt.[0],ellipsis.normalizeSum.sqrt.[1],ellipsis.normalizeSum.sqrt.[2])).phi.round(0.00001);

	};


};angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);~az=~az++azimuth;~el=~el++elevation;


}.value;
);


/////synth////
		(
SynthDef.new(\ospace, {
	arg gain=1, lfo_amp=1, azimuth, elevation, ripple=1,cell=1;
	var sph,osc1,spread=1,sig,m=3,mq=2;
	var magx,magy,magz,mag_x,mag_y,mag_z,magqx,magqy,mag_qx,mag_qy;
	var ampx,ampy,ampz,mod_angle,mod_angle1;
	var ellipsis=[1,1,1],mag,magxx;
	var waveSpeed = 1, waveFreq = 4, theta,phi,wave,t,amp=5,amount=5;

waveFreq=amount.lag(0.01);
t=SinOsc.kr(ripple.lag(0.01)).range(1, 100);
mod_angle=SinOsc.ar(lfo_amp.lag(0.01),0.degrad,mul:1).range(90.neg.degrad,90.degrad);
mod_angle1=SinOsc.ar(lfo_amp.lag(0.01),90.degrad,mul:1).range(90.neg.degrad,90.degrad);

		sph=Spherical(1,azimuth.lag(0.01),elevation.lag(0.01));


(
magx=((Complex(cos(((sph.theta+mod_angle).round(0.00001)*m).wrap(pi.neg,pi)),
	cos((((sph.theta+mod_angle).round(0.00001)*m)).wrap(pi.neg,pi))).rho/(2.sqrt)).pow(spread)*
	(Complex(cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),
	cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2)))).rho/(2.sqrt)).pow(spread);
				);

magy=((Complex(sin(((sph.theta+mod_angle1).round(0.00001)*m).wrap(pi.neg,pi)),
	sin(((sph.theta+mod_angle1).round(0.00001)*m).wrap(pi.neg,pi))).rho/(2.sqrt)).pow(spread)*
		(Complex(cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),
	cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2)))).rho/(2.sqrt)).pow(spread);
				);

magz=((Complex(cos(((sph.phi+mod_angle).round(0.00001)*m).wrap((pi/2).neg,(pi/2))),
	cos(((sph.phi+mod_angle1).round(0.00001)*m).wrap((pi/2).neg,(pi/2)))).rho/(2.sqrt)).pow(spread));

magqx=((((Complex(cos(((sph.theta.round(0.00001)+mod_angle)*mq).wrap(pi.neg,pi)),
cos(((sph.theta.round(0.00001)+mod_angle)*mq).wrap(pi.neg,pi))))*
(Complex(sin((sph.phi.round(0.00001)*(mq-1)).wrap((pi/2).neg,(pi/2))),
sin((sph.phi.round(0.00001)*(mq-1)).wrap((pi/2).neg,(pi/2)))))*
(Complex(cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),
cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))))))).rho/(2.sqrt)).pow(spread);

 magqy=((((Complex(sin(((sph.theta.round(0.00001)+mod_angle1)*mq).wrap(pi.neg,pi)),
sin(((sph.theta.round(0.00001)+mod_angle1)*mq).wrap(pi.neg,pi))))*
(Complex(sin((sph.phi.round(0.00001)*(mq-1)).wrap((pi/2).neg,(pi/2))),
sin((sph.phi.round(0.00001)*(mq-1)).wrap((pi/2).neg,(pi/2)))))*
(Complex(cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))),
cos((sph.phi.round(0.00001)).wrap((pi/2).neg,(pi/2))))))).rho/(2.sqrt)).pow(spread);

 theta = azimuth.lag(0.01).degrad;
  phi = elevation.lag(0.01).degrad;
	 wave = amp*sin(waveFreq * theta + waveFreq * phi - waveSpeed * t);
  magxx=  magx * wave;

				mag_x=magxx.value;mag_y=magy.value;mag_z=magz.value;mag_qx=magqx.value;mag_qy=magqy.value
				);

		mag=(Cartesian(mag_x,mag_y,mag_z).rho/(2.sqrt))+(Cartesian(mag_qx,mag_qy,mag_z).rho/(2.sqrt));

			//sig=PlayBuf.ar(1, ~c1.bufnum, BufRateScale.kr(~c1), loop:1,doneAction:2);
			//sig=SoundIn.ar(0)

			sig=SinOsc.ar(50,mul:0.1);
				osc1=VBAP.ar(8,sig*mag,~b.bufnum,sph.theta.raddeg,
				SinOsc.ar(cell,sph.phi).range(90.neg,90));

					Out.ar(0,LeakDC.ar(osc1,mul:gain));

}).add;
);



(
MIDIClient.init;
MIDIIn.connectAll;

		(
~a=MIDIdef.cc(\midi1,{ |val, num, chan, src|
		var gain;
	//[val, num, chan, src].postln;
	gain=val.linlin(0,127,0,1);
		gain.postln;
		if(~synth.isPlaying,{~synth.set(\gain,gain)});
},20);
	);

		(
~b=MIDIdef.cc(\midi2,{ |val, num, chan, src|
		var lfo_amp;
	//[val, num, chan, src].postln;
	lfo_amp=val.linlin(0,127,0.01,20).round(1/32);
		lfo_amp.postln;
		if(~synth.isPlaying,{~synth.set(\lfo_amp,lfo_amp)});
},21);
	);
	(
~c=MIDIdef.cc(\midi3,{ |val, num, chan, src|
		var cell;
	//[val, num, chan, src].postln;
	cell=val.linlin(0,127,0.001,1).round(1/32);
		cell.postln;
		if(~synth.isPlaying,{~synth.set(\cell,cell)});
},22);
	);
		(
~d=MIDIdef.cc(\midi4,{ |val, num, chan, src|
		var ripple;
	//[val, num, chan, src].postln;
	ripple=val.linlin(0,127,0.0001,1);
		ripple.postln;
		if(~synth.isPlaying,{~synth.set(\ripple,ripple)});
},23);
	);
	(
~e=MIDIdef.cc(\midi5,{ |val, num, chan, src|
		var azimuth;
	//[val, num, chan, src].postln;
	azimuth=val.linlin(0,127,180.neg.degrad,180.degrad);
		azimuth.postln;
		if(~synth.isPlaying,{~synth.set(\azimuth,azimuth)});
},25);
	);
		(
~f=MIDIdef.cc(\midi6,{ |val, num, chan, src|
		var elevation;
	//[val, num, chan, src].postln;
	elevation=val.linlin(0,127,90.neg.degrad,90.degrad);
		elevation.postln;
		if(~synth.isPlaying,{~synth.set(\elevation,elevation)});
},24);
	);

);
	//~synth=Synth.new(\ospace);
	~synth=Synth.new(\ospace,[
\gain,~a.value,\lfo_amp,~b.value,\cell,~c.value,\ripple,~d.value,
\azimuth,~e.value,\elevation,~f.value]).register;
};
s.meter;
)

