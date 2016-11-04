function pkgup {
  sudo pkg_add -uu
}

function pkgin {
  sudo pkg_add "$@"
}
