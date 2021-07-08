(
var w, run = true, yellow, x, y, z;
w = Window("panel black", Rect(128, 64, 800, 800));
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;
black = Color.yellow;
x=MouseX.kr();
y=MouseY.kr();
w.drawFunc = {
    Pen.use {
		Pen.translate(400,400);
        Pen.width = 1;
		Pen.color = yellow;
       1.do {
            Pen.beginPath;
			Pen.moveTo(Point(100,400+6.rand));
			Pen.lineTo(Point(700,400+6.rand ));
			Pen.lineTo(Point(400,100+6.rand ));
			Pen.lineTo(Point(400,700+6.rand ));
			Pen.lineTo(Point(100,400+20.rand ));
            Pen.stroke;
        };
    };
};

{ while { run } { w.refresh; 0.01.wait } }.fork(AppClock)

)


