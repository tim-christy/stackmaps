# Creating Neovim Plugins

This repo contains my learning process on creating neovim plugins. It's
probably not going to be all that helpful to others as I'm kinda messy here.
Will polish up what I learn and publish it at timchristy.io

Sources from which I learned what I know here:\
[TJ Devries and Bash Bunny Bash2Basics](https://www.youtube.com/watch?v=n4Lp4cV8YR0)

Some things I've learned:

- :help rtp

- Anything in a plugin/ folder gets sourced automatically at runtime

  - Functions don't seem to work here - like if you want to call them
    arbitrarily. A better place to put functions is in lua/name_of_plugin

- Put functions in the lua/ folder

- package.loaded is a table that contains everything that is loaded in your
  current neovim session

- Everything is cached once run. In order to reload your plugin, you'll have to
  set its value in package.loaded to nil

  - e.g. :lua package.loaded\["name_of_plugin"\] = nil

- To print out tables do\
  :lua =table

- Lua loops
  -- pairs
  \- iterates over EVERY key in a table. Order is not guaranteed.
  -- ipairs
  \- iterates over ONLY numeric keys in a table. Order IS guaranteed.

  - In lua the only things that are falsy are false and nil
  - To insert values into tables
    - table.insert(table_to_insert_to, value_to_insert)
