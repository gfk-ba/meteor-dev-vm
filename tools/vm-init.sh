#!/bin/sh

set -e

[ $# -lt 1 ] && echo 'Error: expecting two arguments: <APP_DIR> <REPO_DIR>' && exit 1

APP_DIR=$1
REPO_DIR=$2


function init_meteor_dir {
    local METEOR_DIR=$1

    mkdir -p $METEOR_DIR
    pushd $METEOR_DIR

    ls -d app 2>/dev/null || ln -s $REPO_DIR/app

    mkdir -p .meteor
    cp $REPO_DIR/meteor/packages .meteor/
    cp $REPO_DIR/meteor/release .meteor/
    cp $REPO_DIR/meteor/smart.json . 2>/dev/null || true
    cp $REPO_DIR/meteor/smart.lock . 2>/dev/null || true
    mrt install

    popd
}


init_meteor_dir ${APP_DIR}

