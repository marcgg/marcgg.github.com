---
layout: post
title: "Vim Configuration From Scratch in 2016"
description: "Complete example to configure Vim. We'll use pathogen and git to manage plugins, add a theme... but also choose from a long list of curated plugins such as fuzzy search, auto complete, smart indentation, multi-cursors support (like Sublime) and much more!"
blog: true
category: blog
tag: Dev
---

I started using Vim [a while ago][1] with the great distribution [Janus][2]. Since then I made a a lot of changes to my config, but it never felt entirely like my own setup. There always were a few plugins I wouldn't use and some features I couldn't get to work because I didn't understand the internals of my distribution.

Because of this I decided to entirely drop the setup I've been working with for the past years and started from scratch, adding only what I needed. If you want to see the result, my `.vim` [is available on Github][3].

Overall I found the experience to be way more easy and fun than expected, so I decided to share! In this article I'll explain how to quickly setup and customize Vim without having to use a pre-made distribution, just Git and a Terminal.

## Basic Setup

First of all you need to [install vim][4], or, if you don't like to run your text editor in your console and use a mac, you can install [MacVim][5].

Out of the box, Vim is quite worthless compared to other editors like Sublime or Atom. However, it's more evolutive and customizable, so the first thing to do is to start setting it up to fit your prefered way of coding. I recommend versionning your configuration to share accross machines while keeping track of any changes you made.

To do this, create a `.vim` repository with a `vimrc` file that will contain most of your configuration:

	$ cd ~
	$ mkdir .vim
	$ cd .vim
	$ touch vimrc
	$ git init .

Now you need to go back to your home directory and [symlink][6] the `vimrc` file. This way you get to use your `.vimrc` file normally while still get all the advantages of versionning with Git. 

	$ ln -s ~/.vim/vimrc ~/.vimrc

## Getting Vim To Look Nice

### Picking a Theme

There are a LOT of themes available for Vim. I've used [Solarized][7] for quite a while, but recently I switched to the [Tomorrow Night theme][8] and I like it a lot.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/theme-example.jpg" alt="Vim Theme Installation" style="padding: 20px; width: 600px;"/></div>

If you don't like this one, don't worry: there are tons out there. Just Google "Vim Themes" and browse arround.

Once you found you favorite one, add it to your project by first creating a folder to store it:

	$ mkdir ~/.vim/colors

Add the theme's `.vim` file to this folder. Once this is done, edit your `.vimrc` file and add these lines to let Vim know that you want syntax highlighting based on file names:

	filetype on
	syntax on
	colorscheme Tomorrow-Night

### Setting Fonts

Once you have your main theme, time to pick a font! I like my fonts readable, simple and big. So I went with Menlo Regular 18pts.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/menlo.png" alt="Menlo Font" style="padding: 20px; width: 200px;"/></div>

To use this, [download][9] and install the font and then add this line to your `.vimrc`

	set guifont=Menlo\ Regular:h18

### Other Details

To get Vim to open with a given size, add this to your `.vimrc`:

	set lines=35 columns=150

Add a colored column at 90 to avoid going to far to the right:

	set colorcolumn=90

I'm not quite sure why this isn't by default, but here's how to add line numbering:

	set number

## More Customization

Now that your Vim starts to look better, let's start to improve how it actually functions. The great thing with Vim is that we can get it to do whatever we want... it might be overwhelming at first, but it's really not that hard.

### Leader Key

Before doing anything else, we need to set a [Leader key][10].

The Leader key is Vim's way to reduce conflicts in configuration. The Vim user can set this key to be anything and then every command are going to be preceded by this key. By default it's set to be backslash, but I like to change it to `,`.

	let mapleader=","

_Note that mapping it to `,` removes a feature from Vim that can be useful and that some people prefer remapping it to `Space` instead._

### Reload Vim Config Without Having To Restart Editor

Every time you edit your `.vimrc` file, if you want to see the changes you have to close & open it again or [source][11] the `.vimrc` file manually. It's a pain, so let's map some keys to do it automatically:

	map <leader>s :source ~/.vimrc<CR>

It's the first time we see this syntax and it might look a bit weird. Basically it declares "please map (`Leader key + s`) to the following command: `:source ~/.vimrc` and then press `Enter`" which effectively reload the Vim configuration. Once I add this to my configuration, pressing `,` followed by `s` will run the command.

_Note that it only works for `.vimrc` changes and not for adding or removing plugins._

### Smart Defaults

Vim is pretty old and made to run on machines with low processing power. Because of this, when you install Vim a lot of interesting features are deactivated by default. Here's what most people would want their 2016 text editor to have.

Do not try to be compatible with very old versions of Vim:

	set nocompatible

Keep more info in memory to speed things up:

	set hidden
	set history=100

Have some logic when indenting:

	filetype indent on
	set nowrap
	set tabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
	set autoindent

_ Note that this particular config is made for myself and I mostly use Ruby which uses 2 spaces as tabs._

### Dealing With Whitespaces

Here's a handy command to remove whitespaces on save.

	autocmd BufWritePre *.* :%s/\s\+$//e

### Better Search

When running a search, get Vim to highlight found words:

	set hlsearch

Ability to cancel a search with `Escape`:

	nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

### Use Arrows

People are divided on this, but I have made my mind and I prefer using arrow keys instead of the default Vim mapping. If you want to do the same:

	map <D-A-RIGHT> <C-w>l
	map <D-A-LEFT> <C-w>h
	map <D-A-DOWN> <C-w><C-w>
	map <D-A-UP> <C-w>W

### Re-Open Previously Opened File

I find myself using this literally all the time. It's basically `cd -` for your current window and allows you to quickly move back and forth between two files by pressing the Leader key twice.

	nnoremap <Leader><Leader> :e#<CR>

_Note that there's already a way of doing it by pressiong `Ctrl + ^`, but I like \<Leader\>\<Leader\> a lot more._

## Plugins

Plugins are what make Vim great. There is a plugin for everything you might need, so being able to add and remove them easily is important.

### Loading Plugins With Pathogen

[Pathogen][12] is, in my opinion, the best way to manage plugins currently available. It's very simple, non obstrusive and really "just works".

To install it, you can simply use the one liner below. If you don't feel like copy and pasting `curl` commands, just look up their [very clear documentation][13].

	mkdir -p /.vim/autoload /.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Now open your `.vimrc` and add this line at the top:

	execute pathogen#infect()

From now on, you can add plugins in `~.vim/bundle/` and they will get loaded automatically!

### Managing Plugins With Git

All the Vim plugins I'm going to mention here have a Git repository somewhere. This is great, because updating to the latest version can become as easy as pulling master.

To do this we're going to use [git submodules][14] to reference another repository from our main repository. It's actually pretty straightforward and will look like this on Github:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-submodules-example.jpg" alt="Git submodules as seen on Github" style="padding: 20px; width: 360px;"/></div>

For every plugin, you need to run:

	$ cd ~/.vim
	$ git submodule add git@source/pluginname.git bundle/pluginname

For instance if you want to add `vim-ruby` located at [https://github.com/vim-ruby/vim-ruby][15], you'll do:

	$ git submodule add git@github.com:vim-ruby/vim-ruby.git bundle/vim-ruby

Later on when you use your config on another machine or want to update your plugins, you'll be able to use other commands like `git submodule init` or `git submodule update`.

### List Of Must Have Vim Plugins

Here is a list of all the plugins I decided to include and why. I also added the advanced configuration I used and some examples when needed. This list is, of course, very subjective and will depend on what you expect your editor to do for you, but I feel like it's a good starting point.

#### Command-T

Very fast fuzzy search to open files quickly without many keystrokes. [Get it here][16].

To ignore some files, you can use `wildignore`:

	set wildignore+=*.log,*.sql,*.cache

When you create a new file, it's not indexed by default. Here a way to reindex everything by simply pressing `<Leader>+r`:

	noremap <Leader>r :CommandTFlush<CR>

#### MRU

Get the most recently opened or edited files. [Get it here][17].

See the file list with `<Leader> + m`:

	nnoremap <silent> <Leader>m :MRU<CR>

#### NerdCommenter

Comment / Uncomment large blocks of code easily. [Get it here][18].

#### NerdTree

A simple yet very useful tree explorer. [Get it here][19].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/nerdtree.jpg" alt="Tree navigation with Vims" style="padding: 20px; width: 300px;"/></div>

Hit the right arrow to open a node:

	let NERDTreeMapActivateNode='<right>'

Display hidden files:

	let NERDTreeShowHidden=1

Toggle display of the tree with `<Leader> + n`:

	nmap <leader>n :NERDTreeToggle<CR>

Locate the focused file in the tree with `<Leader> + j`:

	nmap <leader>j :NERDTreeFind<CR>

Always open the tree when booting Vim, but don't focus it:

	autocmd VimEnter * NERDTree
	autocmd VimEnter * wincmd p

Do not display some useless files in the tree:

	let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

#### Supertab

Autocomplete when using `tab`. [Get it here][20].

#### Airline

Cool looking status bar that integrates well with other plugins. [Get it here][21].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/airline.jpg" alt="Status bar for Vim" style="padding: 20px; width: 600px;"/></div>

#### Fugitive

Git wrapper that I mostly use for its useful `:Gblame` feature, allowing you to blame any line directly from Vim. [Get it here][22].

#### Git Gutter

Displays the diff in the gutter and allows you to do actions on it. I mostly use it to see what I've just modified, but I also used some of its more advanced functions. For instance you can preview a change with `<Leader> + hp` and revert any change on a line with `<Leader> + hr`. It's great! [Get it here][23].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-gutter-example.jpg" alt="Git gutter for Vim" style="padding: 20px; width: 600px;"/></div>

I don't like my editor changing size while I'm using it, so I chose to always display the gutter - even when there are no changes.

	let g:gitgutter_sign_column_always=1

#### Vim Multiple Cursors

The only feature in [Sublime][24] I was jealous of was its great multi cursor support. With this plugin I don't have to feel this way anymore! [Get it here][25].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/vim-multi-cursors.gif" alt="Sublime style multi cursors in Vim" style="padding: 20px; width: 320px;"/></div>

### Ruby Specific Plugins

I mostly use Ruby and Ruby on Rails for my projects, so I also added some plugins to help me with that.

#### Bundler.vim

I mostly use it to get better highlighting in the `Gemfile`, but it also allows you to `bundle open` quickly. [Get it here][26].

#### Endwise

Adds an `end` keyword when needed. [Get it here][27].

#### Vim-Rails

Must have plugin for anyone using Rails. It just does so much it would be a shame. I particullary like how it allows you to jump from file to file with ease. You can really go from a controller to its spec, to its views and so on. [Get it here][28].

#### Vim-Ruby

Main plugin for dealing with Ruby. [Get it here][29].

### Missed One?

If you have plugins you feel belong here, feel free to share them in the comments or on [twitter][30]!

[1]:	/blog/2012/09/04/one-reason-to-switch-to-vim-editor
[2]:	https://github.com/carlhuda/janus
[3]:	https://github.com/marcgg/.vim
[4]:	http://www.vim.org/download.php
[5]:	https://github.com/b4winckler/macvim
[6]:	https://en.wikipedia.org/wiki/Symbolic_link
[7]:	http://ethanschoonover.com/solarized
[8]:	https://github.com/chriskempson/tomorrow-theme
[9]:	http://www.cufonfonts.com/en/font/13494/menlo
[10]:	http://stackoverflow.com/a/1764336
[11]:	http://ss64.com/bash/source.html
[12]:	https://github.com/tpope/vim-pathogen
[13]:	https://github.com/tpope/vim-pathogen#installation
[14]:	https://git-scm.com/docs/git-submodule
[15]:	https://github.com/vim-ruby/vim-ruby
[16]:	https://github.com/wincent/command-t/
[17]:	https://github.com/yegappan/mru
[18]:	https://github.com/scrooloose/nerdcommenter
[19]:	https://github.com/scrooloose/nerdtree
[20]:	https://github.com/ervandew/supertab
[21]:	https://github.com/vim-airline/vim-airline
[22]:	https://github.com/tpope/vim-fugitive
[23]:	https://github.com/airblade/vim-gitgutter
[24]:	https://www.sublimetext.com/
[25]:	https://github.com/terryma/vim-multiple-cursors/
[26]:	https://github.com/tpope/vim-bundler
[27]:	https://github.com/tpope/vim-endwise
[28]:	https://github.com/tpope/vim-rails/
[29]:	https://github.com/vim-ruby
[30]:	https://twitter.com/marcgg