# Build / Verification Status

This file records only checks actually performed in the current engineering environment.

## Target

- Minecraft: 1.21.1
- NeoForge: 21.1.92
- Java: 21
- ModDevGradle: 2.0.141
- Mod id: `worldender`
- Artifact base name: `worldender`

## VERIFIED in the current environment

- Project contains 27 Java source files.
- Project contains 120 JSON resource files.
- Python asset/data generators pass `py_compile`.
- All 120 JSON resources parse successfully.
- Legacy public identifiers are absent from source/resources/build configuration.
- Resource generators are present and executable.
- `settings.gradle` does not use the optional Foojay toolchain resolver; the build explicitly targets Java 21 and the launcher selects Java 21 before invoking Gradle.

## NOT VERIFIED here

- A real Gradle/NeoForge build in this isolated environment.
- Minecraft client runtime launch.
- Minecraft dedicated-server runtime launch.
- In-game integration tests.
- Long-run/stress testing inside Minecraft.
- Final runtime JAR generation.

## Current environment blocker

The current engineering container does not have a usable Gradle/NeoForge dependency cache and cannot be relied upon for the user's Windows build environment. Therefore this document does not claim that a runtime JAR was produced here.

The Windows build script is designed to:

1. locate Java 21;
2. force Gradle to use that Java runtime;
3. obtain Gradle 8.10.2 if necessary;
4. run `clean build`;
5. verify that a non-sources JAR exists in `build/libs`;
6. print its SHA-256 hash.

A successful local build must still be verified by its actual Gradle output and final artifact.
