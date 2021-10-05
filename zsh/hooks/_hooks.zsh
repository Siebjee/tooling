chpwd()
  case $PWD in
  ( "${HOME}/projects/personal/configuration"  ||  "${HOME}/projects/personal/configuration/"* )
    source ${TOOLING_ZSH_DIR}/hooks/demo.zsh
  ;;
  * )
    source ${TOOLING_ZSH_DIR}/hooks/default.zsh
  ;;
  esac
