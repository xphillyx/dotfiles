export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${PATH}:/opt/sublime_text_3"
export PATH="${PATH}:${HOME}/.local/nodebin" # nodejs modules do not override
alias subl="subl3 --add"

# android shtuff
export PATH="${PATH}:/opt/android/tools"
export PATH="${PATH}:/opt/android/tools/bin"
export PATH="${PATH}:/opt/android/platform=tools"
export ANDROID_HOME=/opt/android
export ANDROID_SDK_HOME=/opt/android
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# nvm
linknode_exists() {
    echo "exists ${1}"
    if [ ! -e "${1}" ]; then
        echo "ERROR: ${1} does not exist"
        return 1
    fi
    return 0
}

linknode_rm_if_exists() {
    if [ -L "${1}" ]; then
        echo "rm ${1}"
        rm "${1}"
    fi

    if [ -e "${1}" ]; then
        echo "rm ${1}"
        rm "${1}"
    fi
}

linknode() {
    NODE_DIR="${HOME}/src/${1}"
    LOCAL_BIN="${HOME}/.local/bin"

    # local path
    LOCAL_NODEBIN="${HOME}/.local/nodebin"
    LOCAL_NPM_EXE="${LOCAL_BIN}/npm"
    LOCAL_NODE_EXE="${LOCAL_BIN}/node"

    # target path
    TARGET_NPM_EXE="${NODE_DIR}/deps/npm/bin/npm-cli.js"
    TARGET_NODE_EXE="${NODE_DIR}/out/Release/node"
    TARGET_NODEBIN="${NODE_DIR}/out/bin"

    # check target paths exist
    if [ $(linknode_exists "${TARGET_NODE_EXE}") -eq 1 ]; then
        return 1
    fi

    if [ $(linknode_exists "${TARGET_NPM_EXE}") -eq 1 ]; then
        return 1
    fi

    # remove if path not found
    linknode_rm_if_exists "${LOCAL_NODE_EXE}"
    linknode_rm_if_exists "${LOCAL_NPM_EXE}"
    linknode_rm_if_exists "${LOCAL_NODEBIN}"

    # link target to common paths
    echo "ln -s ${TARGET_NODE_EXE} ${LOCAL_NODE_EXE}"
    ln -s "${TARGET_NODE_EXE}" "${LOCAL_NODE_EXE}"

    echo "ln -s ${TARGET_NPM_EXE} ${LOCAL_NPM_EXE}"
    ln -s "${TARGET_NPM_EXE}" "${LOCAL_NPM_EXE}" 

    if [ -d "${TARGET_NODEBIN}" ]; then
        ln -s "${TARGET_NODEBIN}" "${LOCAL_NODEBIN}"
    else
        echo "WARNING: ${TARGET_NODEBIN} global modules bin not found"
    fi
}

ibwatch() {
    # run tests when c++ code changes
    WORK=( $(find . -type f -regex '.*\(cc\|h\)$' -a -not -path './.git/*' -a -not -path './node_modules/*') )
    while inotifywait -e close_write "${WORK[@]}"; do
      ib --test_all test --cfg test;
    done
}
