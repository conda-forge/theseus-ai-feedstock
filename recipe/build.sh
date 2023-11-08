if [[ "$cuda_compiler_version" == "None" ]]; then
  export THESEUS_FORCE_CUDA=0
else
  if [[ ${cuda_compiler_version} == 11.2 ]]; then
    export TORCH_CUDA_ARCH_LIST="6.0;6.1;7.0;7.5;8.0;8.6+PTX"
  elif [[ ${cuda_compiler_version} == 11.8 ]]; then
    export TORCH_CUDA_ARCH_LIST="6.0;6.1;7.0;7.5;8.0;8.6;8.9+PTX"
  elif [[ ${cuda_compiler_version} == 12.0 ]]; then
    export TORCH_CUDA_ARCH_LIST="6.0;6.1;7.0;7.5;8.0;8.6;8.9;9.0+PTX"
  else
    echo "unsupported cuda version. edit build.sh"
    exit 1
  fi
  export THESEUS_FORCE_CUDA=1
fi

${PYTHON} -m pip install . -vv
