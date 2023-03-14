
////////////audio and buffer settings

s.options.numOutputBusChannels=2;
TempoClock.default.tempo_(120/30);
s.options.memSize = 8192*16;

~e.play
~e.numFrames;
e.numChannels;
e.duration;
numSamples = numFrames * numChannels
~e.numFrames * e.numChannels
e.sampleRate
s.sampleRate
e.query

////////////buffer from recording from granulator file
~e = Buffer.read(s,"/Users/petrostatsiopoulos/Dokuments/PROJECT  FILES/composition/#3/sc/Lamdoma noise LR.wav")

///////task that sequences the tones in series and in loop in random intervals

(
Tdef.new(\h,{loop({
Synth.new(\wind0);0.999.rand.wait;
Synth.new(\wind2);0.999.rand.wait;
Synth.new(\wind1);0.999.rand.wait;
Synth.new(\wind3);0.999.rand.wait;
}
)})
)

Tdef(\h).stop;
Tdef(\h).play;
Tdef(\h).clear;

/////////////////////intividual Synth definition tone triggers

Synth.new(\wind0);
Synth.new(\wind1);
Synth.new(\wind2);
Synth.new(\wind3);




/////////////////////////////3d visualizer


(
var y,y1,y2,y3,y4,y5;
var	p1_c;
var run = true,x=0,theta;
var ray=137.5, angle=ray.wrap(0,360);
var rad1=1,rad2=1,rad3=1,rad4=1,rad5=1,rad6=1;
var w;
(

/////////////1st Lamdoma "octave" a=1 from y=(x+a)x where y is the interface tone (final audio)

(SynthDef.new(\wind0, { arg pitch,x,a,gate,gain; var sig,pass,fund;var env,aud;
	gate=1;gain=1000;x=1;a=1;fund=440;pass=0.001;pitch=(x+a)/x;env=EnvGen.ar(Env.perc(0.02,4,pitch.reciprocal),gate:gate,doneAction:2);	sig=BBandPass.ar(PlayBuf.ar(2,0,BufRateScale.kr(0),startPos:~e.numFrames.rand,loop:inf),fund*pitch,pass,mul:env);
~a = Amplitude.ar(sig*env, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/a', ~a);Out.ar(0,sig*env*gain);}).add;);
(SynthDef.new(\wind1, { arg pitch,x,a,gate,gain; var sig,pass,fund;var env,aud;
	gate=1;gain=1000;x=2;a=1;fund=440;pass=0.001;pitch=(x+a)/x;env=EnvGen.ar(Env.perc(0.02,4,pitch.reciprocal),gate:gate,doneAction:2);
    sig=BBandPass.ar(PlayBuf.ar(2,0,BufRateScale.kr(0),startPos:~e.numFrames.rand,loop:inf),fund*pitch,pass,mul:env);
~a = Amplitude.ar(sig*env, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/a', ~a);Out.ar(0,sig*env*gain);}).add;);
(SynthDef.new(\wind2, { arg pitch,x,a,gate,gain; var sig,pass,fund;var env,aud;
	gate=1;gain=1000;x=3;a=1;fund=440;pass=0.001;pitch=(x+a)/x;env=EnvGen.ar(Env.perc(0.02,4,pitch.reciprocal),gate:gate,doneAction:2);
    sig=BBandPass.ar(PlayBuf.ar(2,0,BufRateScale.kr(0),startPos:~e.numFrames.rand,loop:inf),fund*pitch,pass,mul:env);
~a = Amplitude.ar(sig*env, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/a', ~a);Out.ar(0,sig*env*gain);}).add;);
(SynthDef.new(\wind3, { arg pitch,x,a,gate,gain; var sig,pass,fund;var env,aud;
	gate=1;gain=1000;x=4;a=1;fund=440;pass=0.001;pitch=(x+a)/x;env=EnvGen.ar(Env.perc(0.02,4,pitch.reciprocal),gate:gate,doneAction:2);
    sig=BBandPass.ar(PlayBuf.ar(2,0,BufRateScale.kr(0),startPos:~e.numFrames.rand,loop:inf),fund*pitch,pass,mul:env);
~a = Amplitude.ar(sig*env, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/a', ~a);Out.ar(0,sig*env*gain);}).add;);


			);


OSCdef(\amp1, { |msg|
	~a = msg[3];
	defer { ~v.refresh };
}, '/a', s.addr);

OSCdef(\amp2, { |msg|
	~b = msg[3];
	defer { ~v.refresh };
}, '/b', s.addr);

OSCdef(\amp3, { |msg|
	~c = msg[3];
	defer { ~v.refresh };
}, '/c', s.addr);

OSCdef(\amp4, { |msg|
	~d = msg[3];
	defer { ~v.refresh };
}, '/d', s.addr);



///////0//////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("S",Rect(400,100,800,800),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 1;  w.view.background = Color.black;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////waves_radius
~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
~v.animate;
~v.drawFunc ={
	Pen.translate(400,400);
	~a=~a*100;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
496.do{

			x=x+0.001;
		p1_c= (x+1)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y=exp(Complex(0,1)*(angle).degrad);
		y1=exp(Complex(0,1)*(angle).degrad);
		y2=exp(Complex(0,1)*(angle+p1_c).degrad);
		y3=exp(Complex(0,1)*(angle+p1_c).degrad);
		//y4=exp(Complex(0,1)*(angle).degrad);
		//y5=exp(Complex(0,1)*(angle).degrad);

			Pen.width=1;
			rad1=y.real*200;
		    rad2=y1.imag*200;
		    rad3=y2.real*200;
		    rad4=y3.imag*200;
		   // rad5=y2.real*300;
		   // rad6=y3.imag*300;

		Color(red:1,green:1,blue:1).set;
		//Pen.addOval(Rect.fromPoints(Polar.new(rad1,y.theta).asPoint,Polar.new(rad2,y1.theta).asPoint));
		//Pen.addOval(Rect.fromPoints(Polar.new(rad3,y1.theta).asPoint,Polar.new(rad3,y2.theta).asPoint));
	//Pen.addOval(Rect.fromPoints(Polar.new(rad4,y2.theta).asPoint,Polar.new(rad4,y3.theta).asPoint));
		Pen.addOval(Rect.new(Polar.new(rad1,y.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,1,1));
		//Pen.addOval(Rect.new(Polar.new(rad3,y1.theta).asPoint.x,Polar.new(rad3,y2.theta).asPoint.y,1,1));
		//Pen.addOval(Rect.new(Polar.new(rad4,y2.theta).asPoint.x,Polar.new(rad4,y3.theta).asPoint.y,1,1));
		//Pen.addOval(Rect.new(Polar.new(rad4,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y,1,1));
		//Pen.line(Polar.new(rad1,y.theta).asPoint,Polar.new(rad2,y1.theta).asPoint);
		//Pen.line(Polar.new(rad2,y1.theta).asPoint,Polar.new(rad3,y2.theta).asPoint);
		//Pen.line(Polar.new(rad3,y2.theta).asPoint,Polar.new(rad4,y3.theta).asPoint);
		//Pen.line(Polar.new(rad4,y3.theta).asPoint,Polar.new(rad5,y4.theta).asPoint);
		//Pen.line(Polar.new(rad5,y4.theta).asPoint,Polar.new(rad6,y5.theta).asPoint);
	//	//Pen.line(Polar.new(rad6,y5.theta).asPoint,Polar.new(rad1,y.theta).asPoint);
	Pen.rotate(pi/1);
		Pen.stroke;


			};

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/10).wait } }.fork(AppClock);
)