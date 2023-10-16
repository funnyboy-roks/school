// A custom MD5 checksum, uses the OpenSSL library to achieve this
#ifndef CHECKSUM_H
#define CHECKSUM_H

// if you do not have this library you can use:
// sudo apt-get install libssl-dev
#include <openssl/evp.h>

// custom file checksum function
char* fileChecksum(const char *filePath);

#endif // CHECKSUM_H
