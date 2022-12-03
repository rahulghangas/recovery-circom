pragma circom 2.1.2;

include "../node_modules/circomlib/circuits/pedersen.circom";
include "../node_modules/circomlib/circuits/pointbits.circom";

template RecoveryHash() {
    signal input in[256];
    signal output out[256];
    
    component pedersen = Pedersen(256);

    var i;
    for (i = 0; i < 256; i++) {
        pedersen.in[i] <== in[i];
    }

    component pointbits = Point2Bits_Strict();
    pointbits.in[0] <== pedersen.out[0];
    pointbits.in[1] <== pedersen.out[1];

    for(i = 0; i < 256; i++) {
        out[i] <== pointbits.out[i];
    }
}