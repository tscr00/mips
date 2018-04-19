# Description

This repository contains an experimental single-cycle (non-pipelined) implementation of original MIPS ISA. Currently it makes some unrealistic assumptions about memory (like it's accesible on the same cycle etc) and has separate modules for CPU/data memory.

# Synthesizing

You need software and a constraints file. Top module is initialized in `top.sv`. Currently there are no ways to debug outside simulation.