# Make the compilers look for headers in the conda include directory
# I added this so that nvcc finds crypt.h, which is now installed separatedly from python
# xref: https://github.com/conda-forge/linux-sysroot-feedstock/issues/52
export CPATH=$PREFIX/include:$CPATH

if [[ "$cuda_compiler_version" == "None" ]]; then
  export THESEUS_FORCE_CUDA=0
else
  export TORCH_CUDA_ARCH_LIST="${CF_TORCH_CUDA_ARCH_LIST}"
  export THESEUS_FORCE_CUDA=1
fi

${PYTHON} -m pip install . -vv
