function pkgup {
  sudo pkg_add -uu
}

function pkgin {
  sudo pkg_add $@
}

function pkgrm {
  sudo pkg_delete $@
}
