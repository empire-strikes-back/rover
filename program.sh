#!/bin/bash

repl(){
  clj \
    -J-Dclojure.core.async.pool-size=1 \
    -X:repl ripley.core/process \
    :main-ns rovers.main
}

main(){
  clojure \
    -J-Dclojure.core.async.pool-size=1 \
    -M -m rovers.main
}

uberjar(){

  clojure \
    -X:identicon zazu.core/process \
    :word '"rovers"' \
    :filename '"out/identicon/icon.png"' \
    :size 256

  clojure \
    -X:uberjar genie.core/process \
    :main-ns rovers.main \
    :filename '"out/rovers.jar"' \
    :paths '["src" "out/identicon"]'
}

release(){
  uberjar
}

"$@"