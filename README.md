# codicons.nvim

A small library containing the [codicons](https://microsoft.github.io/vscode-codicons/dist/codicon.html)
from VS Code and some functions to simplify the usage of them.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#Installation)
- [Usage](#usage)
    - [Configuration](#configuration)
    - [API](#api)
    - [Extensions](#extensions)
- [How to patch fonts](#how-to-patch-fonts)
- [Inspiration](#Inspiration)
- [Todo](#todo)
- [License](#license)

## Requirements

A font patched with codicons.

Note:
[Nerd Fonts](https://www.nerdfonts.com) do not normally have these patched.
See [how to patch fonts](#how-to-patch-fonts) for more information.

## Installation

Install this plugin using your preferred package/plugin manager.

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'mortepau/codicons.nvim'
```

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'mortepau/codicons.nvim'
```

## Usage

### Configuration

If there is differences between the patched font and the default values in the
library it is possible to fix that by calling `setup`.

```lua
local codicons = require('codicons')

codicons.setup({
  -- Override by mapping name to icon
  ['account'] = '',
  -- Or by name to hexadecimal/decimal value
  ['comment'] = 0xEA6B, -- hexadecimal
  ['archive'] = 60056, -- decimal
  -- Or by hexadecimal/decimal value to name
  [60056] = 'archive',
  [0xEA6B] = 'comment',
})
```

### API

The library provide two primary functions for retrieving a single, or multiple
codicons.

The first function is `get(identifier, retval)`.
This functions finds a single `codicon` by a unique `identifier` which can be
name, hexadecimal value, or decimal value.
The second parameter to `get` `retval` is used to decide what should be returned.

```lua
local codicons = require('codicons')

-- Index by name, hexadecimal value, or decimal value
local icon = codicons.get('comment') -- ''
icon = codicons.get(60011) -- ''
icon = codicons.get(0xEA6B) -- ''

-- The second parameter `retval` defaults to 'icon'
icon = codicons.get('comment', 'icon') -- ''

-- Get the unicode value instead
local unicode = codicons.get('comment', 'id') -- 60011

-- The name is returned instead if indexing using a numerical value
local name = codicons.get(60011, 'id') -- 'comment'
name = codicons.get(0xEA6B, 'id') -- 'comment'

-- 'full' returns the full codicon configuration
local comment = codicons.get('comment', 'full') -- { icon = '', unicode = 60011 }

-- Invalid identifiers simply return nil
local invalid = codicons.get('invalid') -- nil
```

The second function is `query(pattern_range, retval)`, which returns all
`codicons` matching the first parameter.

The first parameter `pattern_range` can either be a `pattern` or a `range`.

`pattern` : `vim-regex` like `string`

`range` : `table` on the form `{number, number}`

While the second parameter `retval` is similar as for `get`.

```lua
local codicons = require('codicons')

-- Regex matching all codicons with comment in it
codicons.query('comment')
--[[
{
  ['comment'] = '',
  ['comment-discussion'] = ''
}
--]]

-- Same, but return the full codicon configuration table for each match
codicons.query('comment', 'full')
--[[
{
  ['comment'] = { icon = '', unicode = 60011 },
  ['comment-discussion'] = { icon = '', unicode = 60103 }
}
--]]

-- Use a range and return all matches inside range
-- The bounds are inclusive
codicons.query({0xEA6E, 0xEA70}, 'full')
codicons.query({60014, 60016}, 'full')
--[[
{
  [60014] = { icon = '', name = 'sign-out' },
  [60015] = { icon = '', name = 'sign-in' },
  [60016] = { icon = '', name = 'eye' }
}
--]]

-- An invalid query returns an empty table
codicons.query('invalid') -- {}
```

For both of these methods, the `retval` parameter has to be one of

- `icon` - Codicon icon (`string`)
- `id` - Codicon unique identifier (`number` or `string`)
- `full` - Full codicon configuration (`table`)

### Extensions

Currently a few built-in extensions exist, mainly focused around the VS Code
editor.

- CompletionItemKind
- VSCodeProductIcons

## How to patch fonts

To check if your font has patched codicons copy/paste this snippet into your
terminal, or where you intend to use the codicons, and ensure that they are displayed
correctly.

`     `

The snippet should be displayed as

![Codicon snippet](./media/codicons_snippet.png)

If the snippet is displayed differently on your screen, you either haven't
patched your font with the codicons or they are in the wrong range (`0xEA60 -
0xEBC3`).

If the codicons are in the wrong range it is possible to override them as shown
in [Configuration](#configuration).

This explanation uses the `font-patcher` from
[ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts), so clone the
repository or download the necessary files and do as explained
[here](https://github.com/ryanoasis/nerd-fonts#font-patcher).



1. Download `font-patcher` from
   [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
2. Download `devicons.ttf` and `original-source.otf` from
   [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
3. (Optional) Download some of the other fonts located in `src/glyphs`
4. Download `codicons.ttf` from
   [microsoft/vscode-codicons](https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.ttf)
5. Copy/move `codicons.ttf` to `src/glyphs`

Repository structure

```
nerd-fonts
├── font-patcher
└── src
    └── glyphs
        ├── codicons.ttf
        ├── devicons.ttf
        ├── original-source.otf
        └── Other font files
```

6. Execute `./font-patcher <your-font> --custom codicons.ttf` or `fontforge
   -script font-patcher <your-font> --custom codicons.ttf`
7. The patched font will now be located in the current directory

## Inspiration

[kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

[onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim)

## Todo

- [ ] Document built-in extensions
- [ ] Add tests
- [x] Add documentation for vim, `doc/codicons.txt`
- [x] Use `codicons.table` instead of hardcoded values in
    `codicons.completion_item_kind`
- [x] Add Code of Conduct
- [x] Add License

## Contributing

All contributions are welcome.
If you notice any bugs or possible improvements please leave an issue describing
the bug/feature.

For pull requests, please read [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[MIT](./LICENSE)
