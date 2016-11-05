function cdr {
  cd /etc/rc.d/$1
}

function cdsh {
  cd $HOME/Shell
}

function cdg {
  cd $HOME/GitHub/$1
}

function cdgm {
  cdg "mine/$1"
}

function cdsc {
  cdgm "scripts/$1"
}
