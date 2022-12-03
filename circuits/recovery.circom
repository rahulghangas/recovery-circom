pragma circom 2.1.2;

include "../node_modules/circomlib/circuits/sha256/sha256.circom";

template RecoveryHash() {
    signal input in[256];
    signal output out[256];
    
    component sha256 = Sha256(256);

    for (var i = 0; i < 256; i++) {
        sha256.in[i] <== in[i];
    }
    for (var i = 0; i < 256; i++) {
        out[i] <== sha256.out[i];
    }
}