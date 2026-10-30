function pathefier() {
  local newPath=$1

  case ":${PATH}:" in
    *:"${newPath}":*)
        echo "${PATH}"
        ;;
    *)
        # Prepending path in case a system-installed binary needs to be overridden
        echo "${newPath}:${PATH}"
        ;;
  esac
}
