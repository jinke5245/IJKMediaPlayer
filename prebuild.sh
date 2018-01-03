#!/bin/sh

#  prebuild.sh
#  IJKMediaPlayer
#
#  Created by jinke on 2018/1/2.
#  Copyright © 2018年 jinke. All rights reserved.

set -e

# --------------------

project_path=$(cd `dirname $0`; pwd)/ijkplayer

# --------------------

if [[ ! -d $project_path/ios/build ]]; then
    cd $project_path
    sh "init-ios.sh"

    cd $project_path/ios
    sh "compile-ffmpeg.sh" clean
    sh "compile-ffmpeg.sh" all
fi

# --------------------

cd $project_path/ijkmedia/ijkplayer
sh "version.sh" "." "ijkversion.h"