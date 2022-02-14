#!/bin/bash
#
# tjx@20181122
#

realpath=$(realpath $0)
cd $(dirname $(dirname $realpath))
tar czvf /tmp/vim-vide.tgz $(basename $(dirname $realpath))
qshell rput -w bvcstatic vim-vide-20200513.tgz /tmp/vim-vide.tgz

#
# git-hooks
# Automatic version numbers of your git repository using git hooks
# https://gist.github.com/sg-s/2ddd0fe91f6037ffb1bce28be0e74d4e
#
test -e .git && test ! -e .git/hooks/pre-commit && {
    wget -O .git/hooks/pre-commit 'http://bvcstatic.acgvideo.com/pre-commit-autoversion' && \
        chmod +x .git/hooks/pre-commit
}

" 方向键乱码解决
inoremap OA <UP>
inoremap OB <DOWN>
inoremap OC <RIGHT>
inoremap OD <LEFT>

" 功能键乱码问题解决
inoremap [6~ <pagedown>
inoremap [5~ <pageup>
inoremap OH <home>
inoremap OF <end>
inoremap [3~ <del>
inoremap [2~ <ins>

" 鼠标设置
set mouse=nvc




















