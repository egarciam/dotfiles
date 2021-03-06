# Flare's dotfiles
Based on a lot of discoveries from [GitHub Does dotfiles](https://dotfiles.github.io/), this is my repo for my dotfiles.
I've also included a setup script, mostly for personal use, that will bring a brand new Mac from stock to stylish with
minimal messing around.

```
bash -c "$(curl -sSL https://raw.githubusercontent.com/Flare576/dotfiles/master/scripts/setupMac.sh)"
```

Or a new Mint Linux

```
bash -c "$(curl -sSL https://raw.githubusercontent.com/Flare576/dotfiles/master/scripts/setupMint.sh)"
```

Or a new Ubuntu Linux

```
bash -c "$(curl -sSL https://raw.githubusercontent.com/Flare576/dotfiles/master/scripts/setupUbuntu.sh)"
```
If not setting up a new machine I `git clone` directly into `~` and run the script for the thing(s) I want to setup:

```
sh dotfiles/scripts/setupRepo.sh # You should absoultey run this file to help prevent leaking secrets
sh dotfiles/scripts/setupLinks.sh # Symlinks files to ~
sh dotfiles/scripts/setupScripts.sh # pull scripts and sets up paths
sh dotfiles/scripts/setupVim.sh # Yes, this sets up vim
sh dotfiles/scripts/setupOmz.sh # Oh My Zshell goes deliciously with Zsh
sh dotfiles/scripts/setupLocations.sh # `wdate` and `wweather` use location information
```

> Note: `setupScripts.sh` also brings in [Flare576/scripts](https://github.com/Flare576/scripts); you should check there
for details on what all comes with it!

If I also want to install all the apps I use frequently, I'll run
```
sh dotfiles/scripts/setupHomebrew.sh # Check the script for details
sh dotfiles/scripts/setupPython.sh # Check the script for details
sh dotfiles/scripts/setupCasks.sh # Check the script for details
```

# Sure man, but what do they DO?!

You can read each of the scripts for details of how/what _they_ do, but as far as what YOU can do, here's a breakdown:
- [Hotkey Mentality](#Hotkey-Mentality)
- [vimrc](#vim-config-galore)
  - [Lots of custom config](#hand-picked-values)
  - [Plugins](#pathogen-driven-plugins)
  - [Hotkeys](#daily-hot-keys)
  - [Vim + Jira Hotkeys](#editing-with-style-in-jira)
  - [Quick-edit Hotkeys](#dot-file-hot-keys)
- [tmux](#tmux-config-galore)
- Jira Awesomeness
  - [Jira Setup](#i-want-that-jira-cli-awesomeness)
  - [Jira Commands](#jira)
- [Zshell Hotkey commands](#zshell-hotkey-style-commands)
  - [Kubernetes shortcuts](#kubernetes)
- [Tooling Updates](#tools)
- [Some fun autocompletes](#setup-keyboard-replacements)

## What do I get?

### Hotkey Mentality

There's a lot going on here, I know. Looking at all these lists is enough to make most folks close the browser tab, but bear with me for a moment.

The most important part of program/tool is, in my opinion, getting around. For my configs, I've settled on a "vim-style" approach to this, which means using H, J, K, and L to move Left, Down, Up, and Right. Combining these movements with different modifiers makes up the bulk of getting around!

|  Modifier  | App |         Notes            |
|------------|------|-------------------------|
| Ctrl       | Vim  | Moves between *Buffers*
| Shift      | Vim  | Moves between *Tabs*
| Alt        | tmux | Moves between *panes*
| Shift+Ctrl | tmux | Moves between *Windows*

As a bonus: `_` and `|` plus the above modifiers also splits/creates the thing it navigates horizontally or vertically!

### vim config galore!

#### pathogen-driven plugins
- Badwolf - Beauty!
- vim-json - Make JSON better!
- typescript-vim - Make Typescript... less awful
- ag.vim - Silver Searcher... IN VIM
- ctrlp.vim - Fuzzy file finder!
- z.vim - The power of Z-script in Vim... not sure I like it yet
- gundo - Makes traversing the undo tree not suck
- vim-surround - easily change '' to "" to ` `, with `cs` then the thing that's there, and the thing you want
  - (e.g. 'hello world' to `hello world`, do cs'\`)

#### Hand-picked values!
See https://dougblack.io/words/a-good-vimrc.html for info, or the `.vimrc` file for line-by-line comments

#### Daily hot keys!
| Mode | Keys | Actions |
|------|------|---------|
| Visual | ,y | yank selected to mac clipboard |
| Visual |,uq | Removes quotes from selected text
| Normal | ,d | Diff current buffer against on-disk file (changes since last save)
| Normal | ,D | Diffs visible windows against each other
| Normal | ,<space> | turns off search highlighting
| Normal | ,/ | Shows the count of your last search
| Normal/Visual | j & k | move "visually" up and down, makes soft-wraps easier
| Insert | jk | shortcut to Escape
| Normal | B & E | shortcuts for `^` and `$`
| Normal | ctrl + j, k, h, l | change focus between windows
| Normal | ctrl + _ | split window horizontally
| Normal | ctrl + \| | split window vertically
| Normal | H & L | Move between tabs
| Normal | >, <, +, - | resize current window
| Normal | gV | highlight last inserted text
| Normal | ,u | Brings up "Super Undo"
| Normal | ,h | set Vim PWD to current directory (set home)
| Normal | ,a | fuzzy search (Silver Searcher) for files under `pwd`
| Normal | ctrl+p | brings up file search under `pwd`
| Normal | @y | converts "Describe Table" and converts to YAML (beta)
| Visual | <count>,<Tab> | works on range, starts a # comment at column <count>

##### Editing with _style_ in Jira

| Mode | Keys | Actions |
|------|------|---------|
| Insert | 'jg | Starts a Green section
| Insert | 'jr | Starts a Red section
| Insert | 'jo | Starts an Orange section

#### Dot file hot keys!
| Mode | Keys | Actions |
|------|------|---------|
| Normal | ev | Edit .vimrc in new window
| Normal | ez | Edit .zshrc in new window
| Normal | ee | Edit .zshenv in new window
| Normal | sv | Source .vimrc in open vim instance
| Normal | ej | Edit .jira.d/config.yml in new window
| Normal | ed | Edit dotfiles root folder in new window

### tmux hotkeys galore
|  Mode   |    Keys   | Actions |
|---------|-----------|---------|
| Default | Ma h, j, k, l  | Resize pane 2 units in given direction
| Default | M + h, j, k, l | Switch to pane given direction
| Default | M + \, -       | New horizontal, vertical split
| Default | M +⇧ + \|, _   | New window
| Default | M +⇧ + K       | Switch to the "last" window
| Default | M +⇧ + H, L    | Switch to window to the left/right
| Default | M +⇧ + :       | tmux command prompt
| Default | C-k            | clear buffer
| Default | M-Enter        | Maximize/Restore current pane

## I want that Jira CLI Awesomeness
This script will get you all setup (assuming you cloned this project to ~/dotfiles)

```
~/dotfiles/scripts/jiraSetup
```

You should have on-hand:
- Emaill address in Jira
- Jira base URL
- Jira API token (see https://id.atlassian.com/manage/api-tokens)
- Main project name
- your "Shortname" (the name you use when you type [~first.last]) or otherwise tag yourself in Jira

The script will ask you for your information and write it to `~/dotfiles/.doNotCommit.jira`, then linking
to it from your normal `.doNotCommit` file.

Now comes the fun part. If everything is setup correctly, you can run `jira -h`

You'll see the list of default commands (`help` through `session`), and then the ones I added.

My day generally goes like this (assuming I'm on Project **ABC** with various ticket numbers)
```
jira mine # See what I've been assigned
jira s -w # s[print], Otherwise, I'll see what we have in the sprint I can snag
jira v ABC-1234 # v(iew), Look at a ticket
jira w ABC-1234 # w[orkon], Set the global issue, depends on ~/.jira.d existing
jira g # g(rab) If it wasn't mine already, grab it
jira v # v(iew), Look at it again, notice no more typing ABC-1234!
jira c -m 'This is an awesome ticket' # c(omment), Drop a comment on it
jira ts # (TransitionS), After I'm done, check where it can go next

# if I don't have  a shortcut like `d(one)` or `p(R Review)`, I use the longer syntax
jira t -s "Whatever State" -m "I've done what I can!"```

# In case I need to drop a link to a poor, non-CLI coworker - this will put it on the Mac clipboard
jira link
```

The `r(eviewed)` command is a good example of combining several actions together if you want to add your own!

The last thing I want to mention is that all of the views you see are 100% configurable; see the `.jira.d/templates` folder.

#### Jira
| Command | Params | Result |
|---------|--------|--------|
| jira w[orkon] | TicketID (e.g., PROJECT-123) | Set global story/ticket for `jira` commands |
| jira git | Branch Name | Create a new branch with JIRA_PREFIX/JIRA_ISSUE-BRANCH |
| jira s[print] | None | see the current sprint for your PROJECT |
| jira mine | None | see a list of unresolved tickets in PROJECT with you as ASSIGNEE |
| jira chrome | TicketID\* | Open ticket in Chrome |
| jira link | None | copies the link to the global ticket to the Mac clipboard |
| jira i | None | Inspect current global story/ticket for `jira` commands |
| jira v | TicketID\* | View ticket details in `bat` if available, or `cat` otherwise |
| jira e | TicketID\* | Edit(vi) |
| jira c | TicketID\*, -m | Comment(vi) on ticket, follows `-m` pattern for predefined comment |
| jira t | State, TicketID\* | Transition ticket to new state (see `jira transitions`) |
| jira d | TicketID\* | Done: Transition ticket to "Ready for QA" (feel free to modify this to be your "Dev Done" state) |
| jira g | TicketID\* | Grab: Transition ticket to "In Progress" and assigns to you (feel free to modify this to your "In Progress" state) |
| jira qa | TicketID\* | QA: Transition ticket to "Testing" and sets you as the Reviewer (feel free to modify this to your "QA" state) |
| jira r | [State], TicketID\* | Review ticket by Comment(vi) on ticket, Transition to provided state or "Signoff" by default (feel free to modify this to your preferred Post-QA stateand with your preferred review template) |
> \*NOTE: If you don't provide a TicketID, the global story/ticket set by `jira w[orkon]` is used

### Zshell hotkey-style commands

#### General
| Command | Result |
|---------|--------|
| vz | Edit(vi) .zshrc and .zshenv |
| sz | Source .zshrc and .zshenv |
| vd | edit(vi) `dotfiles` root dir |

#### Kubernetes
| Command | Params    | Result                                                        |
|---------|-----------|---------------------------------------------------------------|
| k       | see docs  | alias to `kubectl`, so whatever you pass to kubectl           |
| k9s     | see docs  | UI for K8s. You're welcome                                    |
| klog    | none      | call kubelogin to authenticate in browser for current context |
| kcon    | context   | alias to `kubectl config use-context`                         |
| kcons   | none      | alias to `kubectl config get-context`                         |
| kn      | namespace | alias to `kubectl config set-context --current --namespace`   |

### Tools

Sometimes you just don't want to dig through a bunch of scripts and want to know what a person suggests. Here's what
makes my life easier:

1) Homebrew / Cask (https://brew.sh/)
1) `bat` [replaces `cat`] (https://github.com/sharkdp/bat) †
1) `git` + `hub` [gitHub actions in your CLI] (https://hub.github.com/) †
1) `pipenv` [w/ python 3.7.2] (https://pipenv-fork.readthedocs.io/en/latest/) †
1) `nvm` [99 problems, but node versions ain't one] (https://github.com/nvm-sh/nvm) †
1) `the_silver_searcher` [Bettah than awk] (https://github.com/ggreer/the_silver_searcher) †
1) ZSH [Bettah than bash] (https://www.zsh.org/) †
1) `shellcheck` [static analysis on scripts] (https://www.shellcheck.net/) †
1) `git-secrets` [enabled on this project] (https://github.com/awslabs/git-secrets) †
1) `mas` [cli app store tool] (https://github.com/mas-cli/mas) †
1) `vim` [grab the most recent version] (https://www.vim.org/) †
1) `tmux` [panel/window manager in terminal] (https://github.com/tmux/tmux/wiki) †
1) `cheat` [CLI Cheat sheets] (https://github.com/cheat/cheat) †
1) `watch` [re-run commands on timer] (https://linux.die.net/man/1/watch) †
1) `jq` [process JSON output] (https://stedolan.github.io/jq/) †
1) `k9s` [CLI UI for K8s] (https://github.com/derailed/k9s) †
1) `lazydocker` [CLI UI for Docker] (https://github.com/jesseduffield/lazydocker) †
1) All my Vim config; sorry, you're gonna have to read it for details.
> † Installable with Homebrew
> †† Installable with Homebrew Cask

# Setup keyboard replacements
```
kirbydance -> <(^.^<)  (>^.^)>  <(^.^)>
shruggy -> ¯\_(ツ)_/¯
fliptable -> (╯°□°）╯︵ ┻━┻
fixtable -> ┬─┬ノ( º _ ºノ)
middlefinger -> 凸 (｀0´)凸
```
