#include <8051.h>
#include <stdbool.h>

#define SIZE 128

// Instructions
#define INS_IDLE               0x00
#define INS_DISPLAY_CYCLES     0x01
#define INS_DISPLAY_RESULT     0x02
#define INS_ACK                0x0F

#define INS_MUL1_WRITE_MODULUS 0x10
#define INS_MUL1_WRITE_BOTH    0x11
#define INS_MUL1_WRITE_SINGLE  0x12
#define INS_MUL1_WRITE_REG     0x13
#define INS_MUL1_READ_RESULT   0x14
#define INS_MUL1_WRITE_RESULT  0x15
#define INS_MUL1_MONTGOMERY    0x16

#define INS_MUL2_WRITE_MODULUS 0x20
#define INS_MUL2_WRITE_BOTH    0x21
#define INS_MUL2_WRITE_SINGLE  0x22
#define INS_MUL2_WRITE_REG     0x23
#define INS_MUL2_READ_RESULT   0x24
#define INS_MUL2_WRITE_RESULT  0x25
#define INS_MUL2_MONTGOMERY    0x26

#define INS_ADDER_WRITE_BOTH   0x30
#define INS_ADDER_WRITE_SINGLE 0x31
#define INS_ADDER_READ_RESULT  0x32
#define INS_ADDER_ADD          0x33
#define INS_ADDER_SUBTRACT     0x34

// Hardware Address Map
volatile __xdata __at (0x2000) unsigned char sA[SIZE];
volatile __xdata __at (0x2080) unsigned char sB[SIZE];
volatile __xdata __at (0x2100) unsigned char sM[SIZE];

volatile __xdata __at (0x3000) unsigned char sR[SIZE];

// Parameters
volatile __xdata __at (0x4000) unsigned char rmodm[SIZE] = {0x95, 0x0C, 0x9E, 0x79, 0xEC, 0xD3, 0x0A, 0xE4, 0x35, 0x6B, 0x60, 0xED, 0x25, 0x25, 0x33, 0xD9, 0x26, 0x8C, 0xD1, 0x99, 0xEE, 0x9C, 0x11, 0x8D, 0xBC, 0xBF, 0x68, 0xAA, 0xB3, 0xF9, 0xDF, 0xDC, 0x80, 0xB8, 0x28, 0x60, 0x2B, 0x21, 0x03, 0x89, 0xEF, 0x2C, 0xE6, 0x93, 0x6F, 0xBB, 0xA7, 0x56, 0x28, 0xB5, 0x99, 0xD7, 0x69, 0xDB, 0x6B, 0x09, 0xF7, 0x0B, 0x84, 0xE5, 0xB2, 0xF8, 0x79, 0xC4, 0xD5, 0x7B, 0x06, 0x45, 0xB5, 0x22, 0xC2, 0x28, 0xF8, 0x7A, 0x39, 0x98, 0xE7, 0xA4, 0x54, 0x45, 0xA2, 0x0D, 0xCA, 0xB1, 0x3B, 0x9E, 0x59, 0xF9, 0xFB, 0xAA, 0x30, 0x97, 0x6D, 0x9B, 0x24, 0x6F, 0x74, 0x30, 0xA7, 0xAF, 0xFF, 0x84, 0x2C, 0x49, 0x1B, 0x30, 0x9F, 0xB5, 0x96, 0x3D, 0x8F, 0xC2, 0xF0, 0x3B, 0xFC, 0xD4, 0xB2, 0x78, 0x05, 0xD3, 0xCB, 0x80, 0x88, 0x85, 0x95, 0x7A, 0xB7, 0x64};
volatile __xdata __at (0x4100) unsigned char r2modm[SIZE] = {0xE4, 0xC4, 0x31, 0x31, 0x08, 0x64, 0x1B, 0xC5, 0x40, 0x21, 0xD5, 0x3F, 0x82, 0x98, 0xB5, 0x8B, 0x0C, 0xDA, 0xDE, 0x0A, 0x73, 0xD6, 0x75, 0x80, 0x81, 0x7B, 0xAF, 0x90, 0x51, 0xA2, 0x22, 0xDF, 0x60, 0xAD, 0x1A, 0x5A, 0x69, 0x4E, 0x87, 0xF5, 0x82, 0x19, 0xC7, 0xDD, 0xAF, 0xEB, 0x7A, 0x3E, 0xF3, 0xDA, 0xB1, 0xE1, 0xED, 0xD2, 0x2E, 0x26, 0x7D, 0xD5, 0xB7, 0xC3, 0x13, 0x09, 0xD5, 0x11, 0xDE, 0x9E, 0x12, 0x6A, 0x51, 0xF5, 0x83, 0x1B, 0xDE, 0xAB, 0x6D, 0xD7, 0xAD, 0x32, 0x07, 0x6C, 0x95, 0x2A, 0x56, 0xFF, 0xD7, 0xE7, 0x00, 0x85, 0xBE, 0xB4, 0x3E, 0xEF, 0x73, 0x88, 0x75, 0xD9, 0x5C, 0x6A, 0xB1, 0x58, 0x4A, 0xBC, 0x80, 0x53, 0x63, 0x48, 0xFD, 0xA0, 0xFC, 0xAD, 0xD9, 0x34, 0xFB, 0xD3, 0xA9, 0xE8, 0x18, 0x32, 0x33, 0x78, 0xB0, 0x08, 0xE4, 0x7B, 0x59, 0xF2, 0x45, 0x8A};

volatile __xdata __at (0x4200) unsigned char modulus[SIZE] = {0x6B, 0xF3, 0x61, 0x86, 0x13, 0x2C, 0xF5, 0x1B, 0xCA, 0x94, 0x9F, 0x12, 0xDA, 0xDA, 0xCC, 0x26, 0xD9, 0x73, 0x2E, 0x66, 0x11, 0x63, 0xEE, 0x72, 0x43, 0x40, 0x97, 0x55, 0x4C, 0x06, 0x20, 0x23, 0x7F, 0x47, 0xD7, 0x9F, 0xD4, 0xDE, 0xFC, 0x76, 0x10, 0xD3, 0x19, 0x6C, 0x90, 0x44, 0x58, 0xA9, 0xD7, 0x4A, 0x66, 0x28, 0x96, 0x24, 0x94, 0xF6, 0x08, 0xF4, 0x7B, 0x1A, 0x4D, 0x07, 0x86, 0x3B, 0x2A, 0x84, 0xF9, 0xBA, 0x4A, 0xDD, 0x3D, 0xD7, 0x07, 0x85, 0xC6, 0x67, 0x18, 0x5B, 0xAB, 0xBA, 0x5D, 0xF2, 0x35, 0x4E, 0xC4, 0x61, 0xA6, 0x06, 0x04, 0x55, 0xCF, 0x68, 0x92, 0x64, 0xDB, 0x90, 0x8B, 0xCF, 0x58, 0x50, 0x00, 0x7B, 0xD3, 0xB6, 0xE4, 0xCF, 0x60, 0x4A, 0x69, 0xC2, 0x70, 0x3D, 0x0F, 0xC4, 0x03, 0x2B, 0x4D, 0x87, 0xFA, 0x2C, 0x34, 0x7F, 0x77, 0x7A, 0x6A, 0x85, 0x48, 0x9B};
volatile __xdata __at (0x4300) unsigned char p[SIZE] = {0x6B, 0xFE, 0xC7, 0x5A, 0x4E, 0xFA, 0xE5, 0x44, 0x6B, 0xFF, 0xB0, 0x12, 0x7B, 0xB0, 0x4D, 0x08, 0x94, 0x76, 0x9A, 0xEB, 0x53, 0xBC, 0xF2, 0x6D, 0x8C, 0x63, 0xA2, 0x79, 0x40, 0x4D, 0xCB, 0xA0, 0x1C, 0xC5, 0x23, 0x90, 0xF1, 0x61, 0xF6, 0x3B, 0x81, 0xF2, 0xD9, 0x03, 0x99, 0x3E, 0xA6, 0xA5, 0x33, 0x40, 0x08, 0x26, 0xED, 0x9E, 0xD8, 0xAB, 0xC1, 0xAF, 0x15, 0x8F, 0x01, 0xDF, 0xB7, 0xCA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
volatile __xdata __at (0x4400) unsigned char q[SIZE] = {0x01, 0x1F, 0x21, 0x78, 0x77, 0x7A, 0x26, 0x6B, 0xC5, 0x9A, 0xFE, 0x71, 0x68, 0xEB, 0x9D, 0xCD, 0xFE, 0xAD, 0x8D, 0xF7, 0x33, 0x2E, 0x69, 0x23, 0x4F, 0xC5, 0x20, 0x61, 0x46, 0x37, 0x47, 0xA7, 0xC8, 0x7D, 0xD2, 0x75, 0xB4, 0x3A, 0xE0, 0x34, 0x5F, 0x40, 0xE2, 0xD2, 0xD8, 0x39, 0x81, 0x9C, 0xB5, 0x30, 0x94, 0xBC, 0x26, 0x22, 0xCA, 0xAF, 0xF2, 0xA5, 0xFC, 0xFE, 0x3A, 0xEF, 0x18, 0xC4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
volatile __xdata __at (0x4500) unsigned char message[SIZE] = {0xE0, 0xFA, 0x7D, 0xF4, 0x9E, 0xFF, 0x31, 0x8A, 0x4A, 0x17, 0x7A, 0xE9, 0x37, 0x86, 0x15, 0x27, 0x2B, 0x29, 0x06, 0x53, 0xE1, 0x08, 0xD2, 0x11, 0xC6, 0xEF, 0x43, 0xB6, 0xC8, 0x93, 0x4F, 0x27, 0xD1, 0x62, 0xCF, 0x12, 0xC3, 0xE6, 0xA4, 0x32, 0x85, 0xA6, 0x4F, 0x26, 0x12, 0x66, 0x87, 0x5A, 0x8F, 0xAE, 0x57, 0xE2, 0x7C, 0x8E, 0xFB, 0xA6, 0xE3, 0x6A, 0x84, 0xF7, 0x92, 0x5D, 0x66, 0x09, 0x17, 0xFC, 0x4A, 0x98, 0x1E, 0xDA, 0xB7, 0xA1, 0x94, 0xE8, 0x59, 0xAE, 0x3A, 0xA3, 0x80, 0x13, 0x13, 0x81, 0x0A, 0x1C, 0x6F, 0x0C, 0x16, 0x67, 0x48, 0x2A, 0x1F, 0x40, 0x8F, 0x97, 0xBB, 0x55, 0x52, 0x35, 0x88, 0x65, 0xD8, 0x01, 0x8F, 0x77, 0x86, 0xA5, 0x55, 0x66, 0x53, 0x02, 0xF3, 0x41, 0xF4, 0x26, 0xCC, 0xD7, 0x0A, 0xEA, 0xE4, 0x3C, 0xA1, 0x65, 0xBA, 0x8D, 0x71, 0x08, 0xEE, 0x98};
volatile __xdata __at (0x4600) unsigned char publicKey[SIZE] = {0x01, 0x01};
volatile __xdata __at (0x4700) unsigned char privateKey[SIZE] = {0x01, 0x23, 0xC5, 0xD2, 0x6A, 0xE6, 0x8B, 0x2B, 0xE7, 0x41, 0x5A, 0x8E, 0xBA, 0x08, 0x1A, 0x66, 0x97, 0xC4, 0xB7, 0x6E, 0x54, 0x5D, 0xC4, 0x99, 0x40, 0x63, 0x65, 0xED, 0x77, 0xCA, 0xCF, 0xEB, 0x75, 0xCF, 0x29, 0x3C, 0xE5, 0x27, 0x0B, 0x54, 0xD0, 0x11, 0x7E, 0xB2, 0x0B, 0x12, 0x9F, 0xBD, 0xBF, 0x2F, 0x51, 0x4C, 0x51, 0x6D, 0x2F, 0xF8, 0x2D, 0x62, 0xB4, 0x1E, 0xA5, 0xEC, 0xE9, 0xDE, 0x0B, 0xE9, 0x7A, 0x72, 0xAE, 0xA4, 0x56, 0xAF, 0xE3, 0xAF, 0x72, 0x54, 0x05, 0xBE, 0x14, 0xA1, 0x01, 0x4D, 0x0D, 0x8D, 0x02, 0x7F, 0xCA, 0xEF, 0xEC, 0x83, 0xE2, 0xA0, 0x75, 0x0A, 0xEF, 0x0C, 0x2C, 0x61, 0xC2, 0x5C, 0xDC, 0x95, 0xC3, 0x36, 0x63, 0x69, 0x6A, 0x76, 0x64, 0xD2, 0x57, 0x56, 0x7F, 0xE3, 0xC9, 0xCA, 0x11, 0x1F, 0xFD, 0xFC, 0x1A, 0x54, 0xA0, 0x70, 0x42, 0x97, 0xF7, 0x6D};
volatile __xdata __at (0x4800) unsigned char privateKey_P[SIZE] = {0x2C, 0x67, 0x47, 0x48, 0x1D, 0xC5, 0xD9, 0x0C, 0x53, 0x27, 0xDE, 0xEC, 0xA5, 0xE8, 0xE3, 0x91, 0x6D, 0x1B, 0xAB, 0x01, 0x64, 0xCF, 0x45, 0x82, 0xA8, 0xC7, 0x1D, 0x2A, 0xC3, 0xA4, 0x02, 0x74, 0x44, 0xD3, 0x4F, 0x30, 0xD7, 0x27, 0x34, 0xAB, 0x70, 0x6F, 0x60, 0x15, 0x64, 0xD9, 0x82, 0x50, 0x16, 0x98, 0xD1, 0x59, 0xB6, 0x12, 0x8C, 0xD8, 0x27, 0xC0, 0xBB, 0xD1, 0x94, 0xC6, 0x6B, 0xB5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
volatile __xdata __at (0x4900) unsigned char privateKey_Q[SIZE] = {0x30, 0xF3, 0xDF, 0x20, 0xFD, 0xBE, 0x6E, 0x65, 0xC8, 0x9B, 0x9A, 0xE2, 0xE2, 0x5E, 0xEB, 0xF2, 0x4D, 0x4C, 0x25, 0x1D, 0x18, 0x2D, 0xBF, 0xCC, 0x41, 0x66, 0x1A, 0x69, 0x57, 0x4C, 0xA0, 0xD7, 0x40, 0x2A, 0xF5, 0x51, 0x5D, 0xBB, 0x78, 0xAC, 0xF1, 0xD1, 0x4C, 0x27, 0x46, 0x65, 0x3B, 0xC4, 0xA7, 0x61, 0x27, 0x34, 0x47, 0x42, 0xA4, 0x14, 0xAD, 0x84, 0x0A, 0x00, 0x68, 0xE3, 0x3F, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
volatile __xdata __at (0x4A00) unsigned char garnerConstant[SIZE] = {0x6C, 0x33, 0xE4, 0x85, 0x8E, 0x9C, 0x7D, 0x8B, 0xE4, 0x3A, 0x69, 0x9A, 0x4B, 0x1B, 0xB7, 0x75, 0x8D, 0xBB, 0x68, 0x42, 0x31, 0x91, 0xC6, 0xB9, 0x8B, 0x78, 0x3A, 0x14, 0x92, 0x2B, 0x69, 0x0A, 0xE4, 0x2A, 0x55, 0x9C, 0x44, 0x11, 0x47, 0x2B, 0xE6, 0x94, 0xB2, 0xCB, 0xEF, 0x85, 0xDC, 0x15, 0x42, 0x75, 0x04, 0x68, 0x75, 0xE3, 0x83, 0xAF, 0x1E, 0x36, 0x9A, 0x2C, 0x3F, 0xD6, 0xBC, 0x2B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

volatile __xdata __at (0x5000) unsigned char encryptedMessage[SIZE];
volatile __xdata __at (0x5100) unsigned char decryptedMessage[SIZE];

// Public Function API
void mpAdd_Single(unsigned char *r, unsigned char *a, bool readResult);
void mpSubtract_Single(unsigned char *r, unsigned char *a, bool readResult);

void montMultiply_Both(unsigned char *r, unsigned char *a, unsigned char *b, bool readResult);
void montMultiply_Single(unsigned char *r, unsigned char *a, bool readResult);
void montMultiply_Result(unsigned char *r, bool readResult);
void montModExp(unsigned char *x, unsigned char *e, unsigned char *m);

void crtModExp(unsigned char *x, unsigned char *eP, unsigned char *eQ);

// Private Function API
unsigned short _findFirstOne(unsigned char *e);

void _displayCycles();
void _displayResult();

void _mul1_writeModulus();
void _mul1_writeBoth();
void _mul1_writeSingle();
void _mul1_writeReg();
void _mul1_readResult();
void _mul1_writeResult();
void _mul1_montgomery();

void _adder_writeBoth();
void _adder_writeSingle();
void _adder_readResult();
void _adder_add();
void _adder_subtract();

void _terminate();

// Public Functions
int main() {
    unsigned char i;

    montModExp(message, publicKey, modulus);
    for (i = 0; i < SIZE; i++)
        encryptedMessage[i] = sR[i];
    _displayResult();

    /*
    montModExp(encryptedMessage, privateKey, modulus);
    _mul1_readResult();
    for (i = 0; i < SIZE; i++)
        decryptedMessage[i] = sR[i];
    _displayResult();
    */

    _terminate();
    return 0;
}

void mpAdd_Single(unsigned char *r, unsigned char *a, bool readResult) {
    unsigned char i;

    for (i = 0; i < SIZE; i++)
        sA[i] = a[i];

    _adder_writeSingle();
    _adder_add();

    if (readResult) {
        _mul1_readResult();
        if (r != sR) {
            for (i = 0; i < SIZE; i++)
                r[i] = sR[i];
        }
    }
}

void mpSubtract_Single(unsigned char *r, unsigned char *a, bool readResult) {
    unsigned char i;

    for (i = 0; i < SIZE; i++)
        sA[i] = a[i];

    _adder_writeSingle();
    _adder_subtract();

    if (readResult) {
        _mul1_readResult();
        if (r != sR) {
            for (i = 0; i < SIZE; i++)
                r[i] = sR[i];
        }
    }
}

void montMultiply_Both(unsigned char *r, unsigned char *a, unsigned char *b, bool readResult) {
    unsigned char i;

    for (i = 0; i < SIZE; i++)
        sA[i] = a[i];
    for (i = 0; i < SIZE; i++)
        sB[i] = b[i];

    _mul1_writeBoth();
    _mul1_montgomery();

    if (readResult) {
        _mul1_readResult();
        if (r != sR) {
            for (i = 0; i < SIZE; i++)
                r[i] = sR[i];
        }
    }
}

void montMultiply_Single(unsigned char *r, unsigned char *a, bool readResult) {
    unsigned char i;

    for (i = 0; i < SIZE; i++)
        sA[i] = a[i];

    _mul1_writeSingle();
    _mul1_montgomery();

    if (readResult) {
        _mul1_readResult();
        if (r != sR) {
            for (i = 0; i < SIZE; i++)
                r[i] = sR[i];
        }
    }
}

void montMultiply_Result(unsigned char *r, bool readResult) {
    unsigned char i;

    _mul1_writeReg();
    _mul1_montgomery();

    if (readResult) {
        _mul1_readResult();
        if (r != sR) {
            for (i = 0; i < SIZE; i++)
                r[i] = sR[i];
        }
    }
}

void montModExp(unsigned char *x, unsigned char *e, unsigned char *m) {
    __xdata __at (0x1000) unsigned char one[SIZE];
    __xdata __at (0x1100) unsigned char xTilde[SIZE];

    unsigned char i;
    unsigned char j;
    unsigned short k;
    unsigned short t;

    *one = 0x01;

    for (i = 0; i < SIZE; i++)
        sM[i] = m[i];
    _mul1_writeModulus();

    // montMultiply_Both(xTilde, x, r2modm, true);
    for (i = 0; i < SIZE; i++)
        sA[i] = x[i];
    for (i = 0; i < SIZE; i++)
        sB[i] = r2modm[i];

    _mul1_writeBoth();
    _mul1_montgomery();
    _mul1_readResult();
    for (i = 0; i < SIZE; i++)
        xTilde[i] = sR[i];

    for (i = 0; i < SIZE; i++)
        sR[i] = rmodm[i];
    _mul1_writeResult();

    t = _findFirstOne(e);
    for (k = 0; k <= t; k++) {
        if (k != 0)
            montMultiply_Result(sR, ((e[(t-k)/8] >> (t-k)%8)) & 1);

        if (((e[(t-k)/8] >> (t-k)%8)) & 1) {
            // montMultiply_Single(sR, xTilde, false);
            for (i = 0; i < SIZE; i++)
                sA[i] = xTilde[i];

            _mul1_writeSingle();
            _mul1_montgomery();
        }
    }

    // montMultiply_Single(sR, one, false);
    for (i = 0; i < SIZE; i++)
        sA[i] = one[i];

    _mul1_writeSingle();
    _mul1_montgomery();
    _mul1_readResult();
}

void crtModExp(unsigned char *x, unsigned char *eP, unsigned char *eQ) {
    __xdata __at (0x1000) unsigned char resultOne[SIZE];
    __xdata __at (0x1100) unsigned char resultTwo[SIZE];
    __xdata __at (0x1200) unsigned char resultDifference[SIZE];
    __xdata __at (0x1300) unsigned char u[SIZE];

    unsigned char i;

    // Exponentiations
    montModExp(x, eP, p);
    for (i = 0; i < SIZE; i++)
        resultOne[i] = sR[i];
    _displayResult();
    montModExp(x, eQ, q);
    for (i = 0; i < SIZE; i++)
        resultTwo[i] = sR[i];
    _displayResult();

    // resultDifference
    mpSubtract_Single(resultDifference, resultOne, true);

    // Combine Results
    // Note: q should still be in sM
    montMultiply_Both(u, resultTwo, garnerConstant, false);
    montMultiply_Single(u, r2modm, true);

    for (i = 0; i < SIZE; i++)
        sM[i] = modulus[i];
    _mul1_writeModulus();

    montMultiply_Both(u, u, p, true);
    montMultiply_Single(u, r2modm, true);
    mpAdd_Single(sR, resultOne, true);
}

// Private Functions
unsigned short _findFirstOne(unsigned char *e) {
    unsigned char i;
    unsigned char j;

    for (i = 0; i < SIZE; i++) {
        if (e[(SIZE-1)-i] != 0) {
            for (j = 0; j < 8; j++) {
                if (e[(SIZE-1)-i] >> (7-j) & 1)
                    return 8*((SIZE-1)-i) + (7-j);
            }
        }
    }

    return 0;
}

void _displayCycles() {
    P0 = INS_DISPLAY_CYCLES;
    P0 = INS_IDLE;
}

void _displayResult() {
    P0 = INS_DISPLAY_RESULT;
    P0 = INS_IDLE;
}

void _mul1_writeModulus() {
    P1 = 0;

    P0 = INS_MUL1_WRITE_MODULUS;
    P0 = INS_IDLE;

    while (P1 == 0) {}
    P0 = INS_ACK;
}

void _mul1_writeBoth() {
    P1 = 0;

    P0 = INS_MUL1_WRITE_BOTH;
    P0 = INS_IDLE;

    while (P1 == 0) {}
    P0 = INS_ACK;
}

void _mul1_writeSingle() {
    P1 = 0;

    P0 = INS_MUL1_WRITE_SINGLE;
    P0 = INS_IDLE;

    while (P1 == 0) {}
    P0 = INS_ACK;
}

void _mul1_writeReg() {
    P0 = INS_MUL1_WRITE_REG;
    P0 = INS_IDLE;
}

void _mul1_readResult() {
    P1 = 0;

    P0 = INS_MUL1_READ_RESULT;
    while (P1 == 0) {}
    P0 = INS_ACK;

    P0 = INS_IDLE;
}

void _mul1_writeResult() {
    P1 = 0;

    P0 = INS_MUL1_WRITE_RESULT;
    P0 = INS_IDLE;

    while (P1 == 0) {}
    P0 = INS_ACK;
}

void _mul1_montgomery() {
    P0 = INS_MUL1_MONTGOMERY;
    P0 = INS_IDLE;
}

void _adder_writeBoth() {
    P1 = 0;

    P0 = INS_ADDER_WRITE_BOTH;
    P0 = INS_IDLE;

    while (P1 == 0) {}
    P0 = INS_ACK;
}

void _adder_writeSingle() {
    P1 = 0;

    P0 = INS_MUL1_WRITE_SINGLE;
    P0 = INS_IDLE;

    while (P1 == 0) {}
    P0 = INS_ACK;
}

void _adder_readResult() {
    P1 = 0;

    P0 = INS_MUL1_READ_RESULT;
    while (P1 == 0) {}
    P0 = INS_ACK;

    P0 = INS_IDLE;
}

void _adder_add() {
    P0 = INS_ADDER_ADD;
    P0 = INS_IDLE;
}

void _adder_subtract() {
    P0 = INS_ADDER_SUBTRACT;
    P0 = INS_IDLE;
}

void _terminate() {
    P3 = 0x55;
}
