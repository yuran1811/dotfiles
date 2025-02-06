# zmodload zsh/zprof

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   \. "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UPDATE_PROMPT=true
zstyle ':omz:update' mode disabled

fe() {
  emulate -L zsh
  local -A urls

  urls=(
    gh      'https://github.com/search?q='
    bundle  'https://bundlephobia.com/result?p='
    sof     'https://stackoverflow.com/search?q='
    mdn     'https://developer.mozilla.org/search?q='
    ciu     'https://caniuse.com/?search='
    lodash  'https://devdocs.io/lodash/index#'
    npm     'https://www.npmjs.com/search?q='
    node    'nodejs.org/en/docs/'
    tsc     'www.typescriptlang.org/docs'
    vue     'vuejs.org'
    react   'https://react.dev'
  )
  url="${urls[$1]}$(omz_urlencode -P ${@[2,-1]})"

  echo "Opening `$url` ..."
  open_command "$url"
}

web() {
  emulate -L zsh
  typeset -A urls

  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    baidu      "https://www.baidu.com/s?wd="
    duck       "https://www.duckduckgo.com/?q="
    gg         "https://www.google.com/search?q="
    goodreads  "https://www.goodreads.com/search?q="
    startpage  "https://www.startpage.com/do/search?q="
    wfa        "https://www.wolframalpha.com/input/?i="
  )

  if [[ $# -gt 1 ]]; then
    url="${urls[$1]}$(omz_urlencode ${@[2,-1]})"
  else
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}

cronlog() {
  echo "===> Cron Task Log <==="
  grep CRON /var/log/syslog | tail -$1
}

gmail() { open_command "https://mail.google.com/mail/u/${1}/#inbox" }
yuranyt() { open_command "https://www.youtube.com/playlist?list=PL6f36ViIxP_HsqR-HbKF2LBt2ZYGr8Rbi" }

mkcd() { mkdir -p "$1" && cd "$1" }
rm-merged() { git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d }

CODEFORCES_BUILD_FLAGS="-Wall -Wextra -Wshadow -Wconversion -Wfloat-equal -Wduplicated-cond -Wlogical-op"
cfcpp() { g++ $CODEFORCES_BUILD_FLAGS $1.cpp -o $1 && ./$1 && rm ./$1.exe }
cc() { g++ $1.cc -o $1 && ./$1 && rm ./$1.exe }
cpp() { g++ $1.cpp -o $1 && ./$1 && rm ./$1.exe }
asmwin() { nasm -f win64 $1.asm && gcc $1.obj && ./a.exe }
asmlinux() { nasm -f elf64 $1.asm && ld $1.o && ./a.out }
javc() { $JDK_HOME/javac $1.java && $JDK_HOME/java $1 }

alias gg="web gg"
alias ggs="web gg"
alias sgg="web gg"
alias ddgo="web duck"
alias fgh="fe gh"
alias fbundle="fe bundle"
alias fsof="fe sof"
alias fmdn="fe mdn"
alias fciu="fe ciu"
alias flodash="fe lodash"
alias fnpm="fe npm"
alias fnode="fe node"
alias ftsc="fe tsc"
alias fvue="fe vue"
alias freact="fe react"

alias ga="git add"
alias gaa="git add ."
alias gcm="git cz"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gi="git init"
alias glo="git log --oneline --graph --decorate"
alias gp="git push"
alias gpl="git pull"
alias gst="git status"
alias gclsm="git clone --recurse-submodules -j8"
alias gsm="git submodule"
alias gsmpl="gsm foreach git pull origin main"

alias pn="pnpm"
alias pns="pnpm start"
alias pnt="pnpm test"
alias pnd="pnpm dev"
alias pnr="pnpm run"

alias ns="npm start"
alias nt="npm test"
alias nd="npm run dev"
alias nr="npm run"

alias ys="yarn start"
alias yt="yarn test"
alias yd="yarn dev"
alias yr="yarn run"
alias yup="yarn upgrade-interactive"

alias cls="clear"
alias lla="ls -ABhlpX"
alias grep="grep -P -i --color=auto"
alias port="netstat -tpn | grep"
alias timecheck="time && zsh -i -c exit"
alias vitenew="npx create-vite@latest"

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

export ZSH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load oh-my-zsh
\. "$ZSH/oh-my-zsh.sh"

# Load Starship
eval "$(starship init zsh)"

# [[ ! -f ~/.p10k.zsh ]] || \. ~/.p10k.zsh

# zprof
