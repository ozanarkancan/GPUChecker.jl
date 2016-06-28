# GPUChecker

###Installation

In julia repl,
Pkg.clone("https://github.com/ozanarkancan/ParticleSwarmOptimization.jl.git")

###Usage
```julia
gpu_usages()
```

returns an array of tuples where each tuple shows gpu usage and gpu capacity, respectively.

```julia
first_min_used_gpu()
```

returns the index of the gpu that has most available space.

Note that: This script just parses the output of nvidia-smi, hence it works for only nvidia gpus.
