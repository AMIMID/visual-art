(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=4;
s.options.numInputBusChannels=0;
s.options.maxNodes=1024;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*8;
s.waitForBoot
)

(
~e1 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/ms21 pattern machined.wav",channels:0);
~e2 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/ms21 pattern machined.wav",channels:1);
~e3 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/ms21 pattern machined.wav",channels:2);
~e4 = Buffer.readChannel(s,"/Users/petrostatsiopoulos/Music/SuperCollider Recordings/ms21 pattern machined.wav",channels:3);
)


(
var y1,y2,y3,y4,y5,y6,y7,y8;
var	p1,p2,p3,p4;
var run = true;
var x1=0,x2=0,x3=0,x4=0;
var ray=0, angle=ray.wrap(0,360);
var rad1=1,rad2=1,rad3=1,rad4=1,rad5=1,rad6=1,rad7=1,rad8=1;


(
SynthDef.new(\player,{
	arg tempo;
	var env;
	var sig1, sig2, sig3, sig4;

	env=EnvGen.ar(Env.sine(360,tempo.reciprocal), doneAction: 2);

	sig1=PlayBuf.ar(1,0,BufRateScale.kr(0),startPos:0,loop:inf,rate:tempo)*env;
	sig2=PlayBuf.ar(1,1,BufRateScale.kr(1),startPos:0,loop:inf,rate:tempo)*env;
	sig3=PlayBuf.ar(1,2,BufRateScale.kr(2),startPos:0,loop:inf,rate:tempo)*env;
	sig4=PlayBuf.ar(1,3,BufRateScale.kr(3),startPos:0,loop:inf,rate:tempo)*env;

	~a = Amplitude.ar(sig1, 0.01, 0.25).poll;SendReply.ar(Impulse.ar(100), '/a', ~a);
	~b = Amplitude.ar(sig2, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/b', ~b);
	~c = Amplitude.ar(sig3, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/c', ~c);
	~d = Amplitude.ar(sig4, 0.01, 0.25);SendReply.ar(Impulse.ar(100), '/d', ~d);

Out.ar(0,sig1);
Out.ar(1,sig2);
Out.ar(2,sig3);
Out.ar(3,sig4);
}).add;
);

(
Pdef(\1, Pbind(\instrument, \player,
	\dur,90,
	\tempo,Pxrand([1,3/4,2/3,3/4,1/2],inf);
)).play;
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

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
~v.animate;
~v.drawFunc ={
Pen.translate(400,400);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////points
1000.do{

		x1=x1+(~a/10);
		p1= (x1)/1;
		x2=x2+(~b/10);
		p2= (x2)/1;
		x3=x3+(~c/10);
		p3= (x3)/1;
		x4=x4+(~d/10);
		p4= (x4)/1;

		ray=ray+137.5;
		angle=ray.wrap(0,360);
		y1=exp(Complex(0,1)*(angle).degrad);
		y2=exp(Complex(0,1)*(angle+p1).degrad);
		y3=exp(Complex(0,1)*(angle).degrad);
		y4=exp(Complex(0,1)*(angle+p2).degrad);
		y5=exp(Complex(0,1)*(angle).degrad);
		y6=exp(Complex(0,1)*(angle+p3).degrad);
		y7=exp(Complex(0,1)*(angle).degrad);
		y8=exp(Complex(0,1)*(angle+p4).degrad);

			Pen.width=0.5;
			rad1=y1.real*300;
		    rad2=y1.imag*300;
		    rad3=y1.real*300;
		    rad4=y1.imag*300;
		    rad5=y1.real*300;
		    rad6=y1.imag*300;
		    rad7=y1.real*300;
		    rad8=y1.imag*300;

		Color(red:1,green:1,blue:1).set;

	    Pen.addOval(Rect.new(Polar.new(rad1,y1.theta).asPoint.x,Polar.new(rad2,y2.theta).asPoint.y,2,2));

		Pen.addOval(Rect.new(Polar.new(rad3,y3.theta).asPoint.x,Polar.new(rad4,y4.theta).asPoint.y,2,2));

		Pen.addOval(Rect.new(Polar.new(rad5,y5.theta).asPoint.x,Polar.new(rad6,y6.theta).asPoint.y,2,2));

		Pen.addOval(Rect.new(Polar.new(rad7,y7.theta).asPoint.x,Polar.new(rad8,y8.theta).asPoint.y,2,2));

	//Pen.line(Point.new(Polar.new(rad5,y3.theta).asPoint.x,Polar.new(rad1,y.theta).asPoint.y),

	Pen.rotate(pi);
		Pen.stroke;~v.refresh;


			};

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/100).wait } }.fork(AppClock);
)