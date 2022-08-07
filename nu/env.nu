# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern: #let-env PATH = ($env.PATH | split row (char esep) | prepend '')
let-env ALACRITTY_LOG = '/var/folders/kh/nxdwbbgn60lgvmzdr5y9lphh0000gq/T/Alacritty-90558.log'
let-env ALACRITTY_SOCKET = '/var/folders/kh/nxdwbbgn60lgvmzdr5y9lphh0000gq/T/Alacritty-90558.sock'
let-env ANDROID_HOME = '/Users/udasitharani/Library/Android/sdk'
let-env CMD_DURATION_MS = '0823'
let-env COLORTERM = 'truecolor'
let-env COMMAND_MODE = 'unix2003'
let-env DISPLAY = '/private/tmp/com.apple.launchd.LuEqazJzlp/org.xquartz:0'
let-env ENV_CONVERSIONS = ''
let-env GEM_HOME = '/Users/udasitharani/.rvm/gems/ruby-2.7.2'
let-env GEM_PATH = '/Users/udasitharani/.rvm/gems/ruby-2.7.2:/Users/udasitharani/.rvm/gems/ruby-2.7.2@global'
let-env HOME = '/Users/udasitharani'
let-env IRBRC = '/Users/udasitharani/.rvm/rubies/ruby-2.7.2/.irbrc'
let-env JAVA_HOME = '/Users/udasitharani/.sdkman/candidates/java/current'
let-env LAST_EXIT_CODE = '0'
let-env LC_CTYPE = 'UTF-8'
let-env LOGNAME = 'udasitharani'
let-env MY_RUBY_HOME = '/Users/udasitharani/.rvm/rubies/ruby-2.7.2'
let-env NU_LIB_DIRS = ''
let-env NU_PLUGIN_DIRS = ''
let-env NVM_BIN = '/Users/udasitharani/.nvm/versions/node/v14.17.4/bin'
let-env NVM_CD_FLAGS = '-q'
let-env NVM_DIR = '/Users/udasitharani/.nvm'
let-env NVM_INC = '/Users/udasitharani/.nvm/versions/node/v14.17.4/include/node'
let-env OLDPWR = '/Users/udasitharani/'
let-env PATH = '/Users/udasitharani/.rvm/gems/ruby-2.7.2/bin:/Users/udasitharani/.rvm/rubies/ruby-2.7.2/lib/ruby/gems/2.7.0/bin:/Users/udasitharani/.rvm/rubies/ruby-2.7.2/bin:/Users/udasitharani/.sdkman/candidates/java/11.0.14-zulu/zulu-11.jdk/Contents/Home/bin:/Users/udasitharani/.nvm/versions/node/v14.17.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/opt/X11/bin:/Library/Apple/usr/bin:/Users/udasitharani/.cargo/bin:/Users/udasitharani/Library/Android/sdk/emulator:/Users/udasitharani/Library/Android/sdk/tools:/Users/udasitharani/Library/Android/sdk/tools/bin:/Users/udasitharani/Library/Android/sdk/platform-tools:/Users/udasitharani/flutter/bin:/Library/PostgreSQL/14/bin:/Users/udasitharani/.rvm/bin'
let-env PIP_REQUIRE_VIRTUALENV = 'false'
let-env PROMPT_COMMAND = ''
let-env PROMPT_COMMAND_RIGHT = ''
let-env PROMPT_INDICATOR = ''
let-env PROMPT_INDICATOR_VI_INSERT = ''
let-env PROMPT_INDICATOR_VI_NORMAL = ''
let-env PROMPT_MULTILINE_INDICATOR = '∙ '
let-env RUBY_VERSION = 'ruby-2.7.2'
let-env SDKMAN_CANDIDATES_API = 'https://api.sdkman.io/2'
let-env SDKMAN_CANDIDATES_DIR = '/Users/udasitharani/.sdkman/candidates'
let-env SDKMAN_DIR = '/Users/udasitharani/.sdkman'
let-env SDKMAN_PLATFORM = 'darwinx64'
let-env SDKMAN_VERSION = '5.15.0'
let-env SHELL = '/bin/zsh'
let-env SHLVL = '1'
let-env SSH_AUTH_SOCK = '/private/tmp/com.apple.launchd.lCOl8JyfNe/Listeners'
let-env STARSHIP_SESSION_KEY = 'clGaH0NhCgh3X1Kz'
let-env STARSHIP_SHELL = 'nu'
let-env TERM = 'xterm-256color'
let-env TMPDIR = '/var/folders/kh/nxdwbbgn60lgvmzdr5y9lphh0000gq/T/'
let-env USER = 'udasitharani'
let-env XPC_FLAGS = '0x0'
let-env XPC_SERVICE_NAME = '0'
let-env _ = '/usr/local/bin/nu'
let-env __CFBundleIdentifier = 'io.alacritty'
let-env __CF_USER_TEXT_ENCODING = '0x1F7:0x0:0x0'
let-env rvm_bin_path = '/Users/udasitharani/.rvm/bin'
let-env rvm_path = '/Users/udasitharani/.rvm'
let-env rvm_prefix = '/Users/udasitharani'
let-env rvm_version = '1.29.12 (latest)'
let-env FOCUS_TASKS_PATH = '/Users/udasitharani/dev/temp.txt'
alias ctags = `brew --prefix`/bin/ctags
alias z = cd (fd -t d . '~/dev/' | fzf -e)
alias txls = tmux ls
alias nv = nvim
alias n = nvim .
