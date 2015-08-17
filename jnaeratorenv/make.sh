#!/bin/sh
gcc -shared -fPIC -o hello.so dylibhello.c
# LD_LIBRARY_PATH=. gcc -I ./ -L./ -o main main.c -lhello
# LD_LIBRARY_PATH=. ./main

# http://stackoverflow.com/questions/29530261/how-to-use-jnaerator-with-multiple-dynamic-libraries-under-one-header

JAVA_HOME=/usr/lib/jvm/java-8-oracle/ java \
    -jar /JNAerator/jnaerator/target/jnaerator-0.13-SNAPSHOT-shaded.jar \
    -arch linux_x64 hello.so \
    hello.h \
    -mode StandaloneJar \
    -jar hello.jar

JAVA_HOME=/usr/lib/jvm/java-8-oracle/ javac \
    -classpath .:./hello.jar:/JNAerator/jnaerator-runtime/target/jnaerator-runtime-0.13-SNAPSHOT-shaded.jar \
    Main.java

JAVA_HOME=/usr/lib/jvm/java-8-oracle/ java \
    -classpath .:./hello.jar:/JNAerator/jnaerator-runtime/target/jnaerator-runtime-0.13-SNAPSHOT-shaded.jar \
    Main
