#include <8051.h>
#define SIZE 128

enum {ins_idle, ins_write_data, ins_montgomery, ins_read_r, ins_ack};

volatile __xdata __at (0x0000) unsigned char rmodm[SIZE]   = {0xA3,0x10,0x6B,0x83,0x7C,0x40,0xBF,0xB2,0x54,0x28,0x20,0x4D,0xB2,0xD4,0xF8,0xA6,0xE5,0xB7,0x51,0xBA,0xE8,0xD1,0x95,0x9A,0xFE,0xAB,0x0A,0x48,0x23,0xA2,0x70,0xB3,0xCC,0x7B,0x8F,0x44,0xF4,0x5B,0x53,0x78,0x7D,0xE2,0xF2,0xAF,0xD2,0xBA,0x06,0x0F,0xEE,0xA4,0x37,0x06,0xE7,0x04,0x2C,0x90,0x3C,0x8B,0xFD,0x54,0xCD,0xB9,0x94,0xAD,0x64,0x8E,0x26,0xDE,0x8C,0xC5,0x33,0x92,0x24,0xEF,0x76,0x34,0xC4,0xB8,0xEC,0xF1,0x9A,0x79,0x61,0x80,0xC1,0xBC,0x6D,0x03,0x49,0x95,0x94,0xC8,0x6F,0x14,0xB0,0x16,0x14,0x63,0xD0,0x94,0xD9,0x10,0x4B,0x44,0x03,0xC2,0xCC,0x04,0x68,0x98,0x6C,0xD9,0x69,0xC7,0x1A,0x0F,0xC5,0x39,0x5C,0x6A,0x5A,0x67,0x0B,0x47,0xF4,0x77,0x1E,0x2B};
volatile __xdata __at (0x0080) unsigned char r2modm[SIZE]  = {0x77,0xEA,0xCF,0xBE,0xC1,0x80,0x10,0xEA,0x1B,0xA6,0xCD,0x50,0x4D,0x92,0x9E,0xEA,0x53,0xAC,0x79,0x45,0x34,0x3D,0x31,0xDF,0x24,0xA4,0x19,0x11,0x2A,0xFD,0x73,0x15,0x2A,0x8F,0xF3,0x43,0xAF,0x42,0x3D,0x85,0xF8,0x09,0x44,0xC3,0xFF,0xC7,0xF9,0xDB,0x8F,0x6A,0x1E,0x8D,0xA4,0x23,0x29,0x31,0xD2,0xE9,0x6E,0xBA,0x41,0x51,0xF7,0x83,0x9B,0x27,0x0E,0x5F,0x4D,0x6C,0x7D,0xD2,0x0A,0x1F,0x3A,0x7C,0x4C,0xE4,0x4D,0xFD,0xFC,0xF7,0x61,0xFE,0xE9,0xA4,0xB6,0x56,0xB2,0x7D,0x39,0xD1,0xEA,0x77,0xA3,0x22,0xD0,0xC6,0x4E,0xA4,0x45,0xB3,0xD5,0x63,0x7B,0x1D,0x52,0x4F,0x4C,0x0A,0x28,0xB8,0x3F,0xDB,0x90,0x04,0x5C,0xBE,0x0B,0xAC,0xD2,0x3A,0x71,0x9A,0x76,0x20,0x31,0x46};
volatile __xdata __at (0x0100) unsigned char modulus[SIZE] = {0x5D,0xEF,0x94,0x7C,0x83,0xBF,0x40,0x4D,0xAB,0xD7,0xDF,0xB2,0x4D,0x2B,0x07,0x59,0x1A,0x48,0xAE,0x45,0x17,0x2E,0x6A,0x65,0x01,0x54,0xF5,0xB7,0xDC,0x5D,0x8F,0x4C,0x33,0x84,0x70,0xBB,0x0B,0xA4,0xAC,0x87,0x82,0x1D,0x0D,0x50,0x2D,0x45,0xF9,0xF0,0x11,0x5B,0xC8,0xF9,0x18,0xFB,0xD3,0x6F,0xC3,0x74,0x02,0xAB,0x32,0x46,0x6B,0x52,0x9B,0x71,0xD9,0x21,0x73,0x3A,0xCC,0x6D,0xDB,0x10,0x89,0xCB,0x3B,0x47,0x13,0x0E,0x65,0x86,0x9E,0x7F,0x3E,0x43,0x92,0xFC,0xB6,0x6A,0x6B,0x37,0x90,0xEB,0x4F,0xE9,0xEB,0x9C,0x2F,0x6B,0x26,0xEF,0xB4,0xBB,0xFC,0x3D,0x33,0xFB,0x97,0x67,0x93,0x26,0x96,0x38,0xE5,0xF0,0x3A,0xC6,0xA3,0x95,0xA5,0x98,0xF4,0xB8,0x0B,0x88,0xE1,0xD4};
volatile __xdata __at (0x0180) unsigned char message[SIZE] = {0x89,0x15,0x30,0x41,0x3E,0x7F,0xEF,0x15,0xE4,0x59,0x32,0xAF,0xB2,0x6D,0x61,0x15,0xAC,0x53,0x86,0xBA,0xCB,0xC2,0xCE,0x20,0xDB,0x5B,0xE6,0xEE,0xD5,0x02,0x8C,0xEA,0xD5,0x70,0x0C,0xBC,0x50,0xBD,0xC2,0x7A,0x07,0xF6,0xBB,0x3C,0x00,0x38,0x06,0x24,0x70,0x95,0xE1,0x72,0x5B,0xDC,0xD6,0xCE,0x2D,0x16,0x91,0x45,0xBE,0xAE,0x08,0x7C,0x64,0xD8,0xF1,0xA0,0xB2,0x93,0x82,0x2D,0xF5,0xE0,0xC5,0x83,0xB3,0x1B,0xB2,0x02,0x03,0x08,0x9E,0x01,0x16,0x5B,0x49,0xA9,0x4D,0x82,0xC6,0x2E,0x15,0x88,0x5C,0xDD,0x2F,0x39,0xB1,0x5B,0xBA,0x4C,0x2A,0x9C,0x84,0xE2,0xAD,0xB0,0xB3,0xF5,0xD7,0x47,0xC0,0x24,0x6F,0xFB,0xA3,0x41,0xF4,0x53,0x2D,0xC5,0x8E,0x65,0x89,0xDF,0xCE,0xB9};
volatile __xdata __at (0x0200) unsigned char enc_exp[SIZE] = {0x1,0x01};
volatile __xdata __at (0x0280) unsigned char dec_exp[SIZE] = {0xA1,0x80,0x48,0x28,0xC3,0xFE,0x04,0xB3,0xF2,0xEF,0xAF,0x3E,0x55,0x46,0x4E,0xC8,0x47,0x7A,0x1C,0x83,0x74,0xD7,0x11,0xD1,0xFB,0x16,0x44,0x72,0x8C,0x4B,0xD5,0xFD,0xB9,0xFA,0x04,0xE1,0x3E,0x3A,0x16,0x04,0x55,0x41,0xD0,0x8A,0x92,0x38,0xF4,0xD4,0xAE,0x7A,0x60,0xE2,0x69,0xAA,0xA6,0x63,0xA1,0xEB,0x05,0x71,0x99,0x71,0xE3,0x67,0x2A,0x57,0xF7,0x6B,0x82,0xB3,0xF0,0x82,0x58,0x54,0xAF,0xC3,0xD1,0xEF,0x68,0x7E,0x88,0xBD,0x39,0x2B,0x2A,0x7C,0x14,0xF8,0xC7,0xD0,0xF9,0x64,0x9A,0xBA,0x6F,0x45,0x28,0x5D,0xD7,0xE2,0xC4,0x8E,0x9F,0x6F,0xA8,0x88,0xAD,0xFD,0x28,0x92,0x4F,0x63,0x41,0x70,0x22,0xAD,0xAB,0x4E,0x1D,0x63,0x89,0xCC,0x09,0x42,0xFE,0xBC,0xCF,0x3A};
volatile __xdata __at (0x0300) unsigned char one[SIZE] = {0x01};

volatile __xdata __at (0x3000) unsigned char mont_message[SIZE+1];
volatile __xdata __at (0x3100) unsigned char a[SIZE+1];

volatile __xdata __at (0x4000) unsigned char shared_a[SIZE];
volatile __xdata __at (0x4080) unsigned char shared_b[SIZE];
volatile __xdata __at (0x4100) unsigned char shared_m[SIZE];

volatile __xdata __at (0x5000) unsigned char r[SIZE+1];

unsigned short i;
unsigned short j;

void write_montgomery(unsigned char *a, unsigned char *b, unsigned char *m) {
    P1 = 0;
    
    for (i = 0; i < SIZE; i++) {
        shared_a[i] = a[SIZE-1-i];
    }

	for (i = 0; i < SIZE; i++) {
        shared_b[i] = b[SIZE-1-i];
    }

	for (i = 0; i < SIZE; i++) {
        shared_m[i] = m[SIZE-1-i];
    }

    P0 = ins_write_data;
    P0 = ins_idle;

    while (P1 == 0) {}
	P0 = ins_ack;
}

void read_r() {
    P0 = ins_read_r;
    while (P1 == 0) {}
	P0 = ins_ack;

    P0 = ins_idle;
}

void montgomery() {
    P0 = ins_montgomery;
    P0 = ins_idle;
}

void terminate() {
    P3 = 0x55;
}

int get_bit_value(int n, int position) {
   return ((n >> position) & 1);
}

int main() {
    write_montgomery(message, r2modm, modulus);
    montgomery();
    read_r();

    for (i = 0; i < SIZE; i++) {
        mont_message[i] = r[i];
    }

    for (i = 0; i < SIZE; i++) {
        a[i] = rmodm[i];
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 8; j++) {
            write_montgomery(a, a, modulus);
            montgomery();
            read_r();

            for (i = 0; i < SIZE; i++) {
                a[i] = r[i];
            }

            if (get_bit_value(enc_exp[i], 7-j) == 1) {
                write_montgomery(a, mont_message, modulus);
                montgomery();
                read_r();

                for (i = 0; i < SIZE; i++) {
                    a[i] = r[i];
                }
            }      
        }    
    }

    write_montgomery(a, one, modulus);
    montgomery();
    read_r();

    for (i = 0; i < SIZE; i++) {
        a[i] = r[i];
    }

    terminate();
    return 0;
}