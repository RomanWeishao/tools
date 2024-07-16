#!/bin/bash

# 提示用户输入域名
read -p "Enter your domain name: " DOMAIN

# 生成私钥
echo "Generating RSA private key for $DOMAIN..."
openssl genrsa -out "$DOMAIN.key" 2048

# 生成CSR
echo "Generating Certificate Signing Request (CSR) for $DOMAIN..."
openssl req -new -key "$DOMAIN.key" -out "$DOMAIN.csr"

# 生成自签名证书
echo "Generating Self-Signed Certificate for $DOMAIN..."
openssl x509 -req -days 365 -in "$DOMAIN.csr" -signkey "$DOMAIN.key" -out "$DOMAIN.crt"

echo "Certificate Generation Complete for $DOMAIN."
echo "Files generated: $DOMAIN.key, $DOMAIN.csr, $DOMAIN.crt"