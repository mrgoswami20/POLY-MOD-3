pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal x;
   signal y;
   signal output q;
   component ag = AND();
   component og = OR();
   component ng = NOT();
   ag.a <== a;
   ag.b <== b;
   x <== ag.out;
   ng.in <== b;
   y <== ng.out;
   og.a <== x;
   og.b <== y;
   q <== og.out;
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();