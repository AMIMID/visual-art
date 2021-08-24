TempoClock.default.tempo_(120/480);
s.options.numOutputBusChannels=8;
TempoClock.default.tempo_(120/12);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;
s.options.memSize = 2097152
~b=Buffer.alloc(s,2048);
(
SynthDef.new(\id, {
	arg dur=1;
	var x=1,y=1,t,phi;
	var k=0; var sig,sig1,env,s;
//~sig = Signal.sineFill(1024,[1,1/2,2/3,3/4],[1,2,3/2,4/3]);
	//~sig.plot("signal");
	//~wt =~sig.asWavetable;
	//~b.loadCollection(~wt);

	x=dur.cos; y=dur.sin;
	k=Complex(x,y).abs;
	t=Complex(x,y).angle;

	env=EnvGen.ar(Env.perc(t,dur,k/x,[-4,-2]),doneAction:2);
//sig1=Osc.ar(~b,y*440,mul:env,phase:y*pi);
//	sig=Osc.ar(~b,x*440,mul:env,phase:x*pi);
	sig=FSinOsc.ar(x*440,mul:env,iphase:x*pi);
	sig1=FSinOsc.ar(y*440,mul:env,iphase:y*pi);

	//Out.ar(0,PanAz.ar(2,sig*env,t,width:k));
	Out.ar(0,Rotate2.ar(sig*env,sig1*env,t));
	//Out.ar(0,Rotate2.ar(PanAz.ar(2,sig*env,t,width:2),PanAz.ar(2,sig1*env,t,width:k),t));
 // Out.ar(4,Rotate2.ar(PanAz.ar(4,sig*env,t,width:k),PanAz.ar(4,sig1*env,LFSaw.ar(t),width:k),t));

}).add;
)


(
( Pdef(\1, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(2,3,9/8,inf),
			)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(3,4,0.125,inf),
			)).play(quant:1))
)
///////////////////////////////////////////////////////


