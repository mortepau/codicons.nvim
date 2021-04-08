--[[
Reference for unicode value:
  https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.csv
  https://github.com/microsoft/vscode-codicons/blob/main/src/template/mapping.json
--]]

local codicons = {
  ['account']                                 = { icon = '', unicode = 0xEB99 },
  ['activate-breakpoints']                    = { icon = '', unicode = 0xEA97 },
  ['add']                                     = { icon = '', unicode = 0xEA60 },
  ['alert']                                   = { icon = '', unicode = 0xEA6C },
  ['archive']                                 = { icon = '', unicode = 0xEA98 },
  ['array']                                   = { icon = '', unicode = 0xEA8A },
  ['arrow-both']                              = { icon = '', unicode = 0xEA99 },
  ['arrow-down']                              = { icon = '', unicode = 0xEA9A },
  ['arrow-left']                              = { icon = '', unicode = 0xEA9B },
  ['arrow-right']                             = { icon = '', unicode = 0xEA9C },
  ['arrow-small-down']                        = { icon = '', unicode = 0xEA9D },
  ['arrow-small-left']                        = { icon = '', unicode = 0xEA9E },
  ['arrow-small-right']                       = { icon = '', unicode = 0xEA9F },
  ['arrow-small-up']                          = { icon = '', unicode = 0xEAA0 },
  ['arrow-up']                                = { icon = '', unicode = 0xEAA1 },
  ['beaker']                                  = { icon = '', unicode = 0xEA79 },
  ['bell']                                    = { icon = '', unicode = 0xEAA2 },
  ['bell-dot']                                = { icon = '', unicode = 0xEB9A },
  ['bold']                                    = { icon = '', unicode = 0xEAA3 },
  ['book']                                    = { icon = '', unicode = 0xEAA4 },
  ['bookmark']                                = { icon = '', unicode = 0xEAA5 },
  ['briefcase']                               = { icon = '', unicode = 0xEAAC },
  ['broadcast']                               = { icon = '', unicode = 0xEAAD },
  ['browser']                                 = { icon = '', unicode = 0xEAAE },
  ['bug']                                     = { icon = '', unicode = 0xEAAF },
  ['calendar']                                = { icon = '', unicode = 0xEAB0 },
  ['call-incoming']                           = { icon = '', unicode = 0xEB92 },
  ['call-outgoing']                           = { icon = '', unicode = 0xEB93 },
  ['case-sensitive']                          = { icon = '', unicode = 0xEAB1 },
  ['check']                                   = { icon = '', unicode = 0xEAB2 },
  ['check-all']                               = { icon = '', unicode = 0xEBB1 },
  ['checklist']                               = { icon = '', unicode = 0xEAB3 },
  ['chevron-down']                            = { icon = '', unicode = 0xEAB4 },
  ['chevron-left']                            = { icon = '', unicode = 0xEAB5 },
  ['chevron-right']                           = { icon = '', unicode = 0xEAB6 },
  ['chevron-up']                              = { icon = '', unicode = 0xEAB7 },
  ['chrome-close']                            = { icon = '', unicode = 0xEAB8 },
  ['chrome-maximize']                         = { icon = '', unicode = 0xEAB9 },
  ['chrome-minimize']                         = { icon = '', unicode = 0xEABA },
  ['chrome-restore']                          = { icon = '', unicode = 0xEABB },
  ['circle-filled']                           = { icon = '', unicode = 0xEA71 },
  ['circle-large-filled']                     = { icon = '', unicode = 0xEBB4 },
  ['circle-large-outline']                    = { icon = '', unicode = 0xEBB5 },
  ['circle-outline']                          = { icon = '', unicode = 0xEABC },
  ['circle-slash']                            = { icon = '', unicode = 0xEABD },
  ['circuit-board']                           = { icon = '', unicode = 0xEABE },
  ['clear-all']                               = { icon = '', unicode = 0xEABF },
  ['clippy']                                  = { icon = '', unicode = 0xEAC0 },
  ['clock']                                   = { icon = '', unicode = 0xEA82 },
  ['clone']                                   = { icon = '', unicode = 0xEA78 },
  ['close']                                   = { icon = '', unicode = 0xEA76 },
  ['close-all']                               = { icon = '', unicode = 0xEAC1 },
  ['close-dirty']                             = { icon = '', unicode = 0xEA71 },
  ['cloud']                                   = { icon = '', unicode = 0xEBAA },
  ['cloud-download']                          = { icon = '', unicode = 0xEAC2 },
  ['cloud-upload']                            = { icon = '', unicode = 0xEAC3 },
  ['code']                                    = { icon = '', unicode = 0xEAC4 },
  ['collapse-all']                            = { icon = '', unicode = 0xEAC5 },
  ['color-mode']                              = { icon = '', unicode = 0xEAC6 },
  ['combine']                                 = { icon = '', unicode = 0xEBB6 },
  ['comment']                                 = { icon = '', unicode = 0xEA6B },
  ['comment-add']                             = { icon = '', unicode = 0xEA6B },
  ['comment-discussion']                      = { icon = '', unicode = 0xEAC7 },
  ['compare-changes']                         = { icon = '', unicode = 0xEAFD },
  ['console']                                 = { icon = '', unicode = 0xEA85 },
  ['credit-card']                             = { icon = '', unicode = 0xEAC9 },
  ['dash']                                    = { icon = '', unicode = 0xEACC },
  ['dashboard']                               = { icon = '', unicode = 0xEACD },
  ['database']                                = { icon = '', unicode = 0xEACE },
  ['debug']                                   = { icon = '', unicode = 0xEAD8 },
  ['debug-alt']                               = { icon = '', unicode = 0xEB91 },
  ['debug-alt-small']                         = { icon = '', unicode = 0xEBA8 },
  ['debug-breakpoint']                        = { icon = '', unicode = 0xEA71 },
  ['debug-breakpoint-conditional']            = { icon = '', unicode = 0xEAA7 },
  ['debug-breakpoint-conditional-disabled']   = { icon = '', unicode = 0xEAA7 },
  ['debug-breakpoint-conditional-unverified'] = { icon = '', unicode = 0xEAA6 },
  ['debug-breakpoint-data']                   = { icon = '', unicode = 0xEAA9 },
  ['debug-breakpoint-data-disabled']          = { icon = '', unicode = 0xEAA9 },
  ['debug-breakpoint-data-unverified']        = { icon = '', unicode = 0xEAA8 },
  ['debug-breakpoint-disabled']               = { icon = '', unicode = 0xEA71 },
  ['debug-breakpoint-function']               = { icon = '', unicode = 0xEB88 },
  ['debug-breakpoint-function-disabled']      = { icon = '', unicode = 0xEB88 },
  ['debug-breakpoint-function-unverified']    = { icon = '', unicode = 0xEB87 },
  ['debug-breakpoint-log']                    = { icon = '', unicode = 0xEAAB },
  ['debug-breakpoint-log-disabled']           = { icon = '', unicode = 0xEAAB },
  ['debug-breakpoint-log-unverified']         = { icon = '', unicode = 0xEAAA },
  ['debug-breakpoint-unsupported']            = { icon = '', unicode = 0xEB8C },
  ['debug-breakpoint-unverified']             = { icon = '', unicode = 0xEABC },
  ['debug-console']                           = { icon = '', unicode = 0xEB9B },
  ['debug-continue']                          = { icon = '', unicode = 0xEACF },
  ['debug-disconnect']                        = { icon = '', unicode = 0xEAD0 },
  ['debug-hint']                              = { icon = '', unicode = 0xEA71 },
  ['debug-pause']                             = { icon = '', unicode = 0xEAD1 },
  ['debug-rerun']                             = { icon = '', unicode = 0xEBC0 },
  ['debug-restart']                           = { icon = '', unicode = 0xEAD2 },
  ['debug-restart-frame']                     = { icon = '', unicode = 0xEB90 },
  ['debug-reverse-continue']                  = { icon = '', unicode = 0xEB8E },
  ['debug-stackframe']                        = { icon = '', unicode = 0xEB8B },
  ['debug-stackframe-active']                 = { icon = '', unicode = 0xEB89 },
  ['debug-stackframe-dot']                    = { icon = '', unicode = 0xEB8A },
  ['debug-stackframe-focused']                = { icon = '', unicode = 0xEB8B },
  ['debug-start']                             = { icon = '', unicode = 0xEAD3 },
  ['debug-step-back']                         = { icon = '', unicode = 0xEB8F },
  ['debug-step-into']                         = { icon = '', unicode = 0xEAD4 },
  ['debug-step-out']                          = { icon = '', unicode = 0xEAD5 },
  ['debug-step-over']                         = { icon = '', unicode = 0xEAD6 },
  ['debug-stop']                              = { icon = '', unicode = 0xEAD7 },
  ['desktop-download']                        = { icon = '', unicode = 0xEA78 },
  ['device-camera']                           = { icon = '', unicode = 0xEADA },
  ['device-camera-video']                     = { icon = '', unicode = 0xEAD9 },
  ['device-desktop']                          = { icon = '', unicode = 0xEA7A },
  ['device-mobile']                           = { icon = '', unicode = 0xEADB },
  ['diff']                                    = { icon = '', unicode = 0xEAE1 },
  ['diff-added']                              = { icon = '', unicode = 0xEADC },
  ['diff-ignored']                            = { icon = '', unicode = 0xEADD },
  ['diff-modified']                           = { icon = '', unicode = 0xEADE },
  ['diff-removed']                            = { icon = '', unicode = 0xEADF },
  ['diff-renamed']                            = { icon = '', unicode = 0xEAE0 },
  ['discard']                                 = { icon = '', unicode = 0xEAE2 },
  -- drop-down-button
  ['edit']                                    = { icon = '', unicode = 0xEA73 },
  ['editor-layout']                           = { icon = '', unicode = 0xEAE3 },
  ['ellipsis']                                = { icon = '', unicode = 0xEA7C },
  ['empty-window']                            = { icon = '', unicode = 0xEAE4 },
  ['error']                                   = { icon = '', unicode = 0xEA87 },
  ['exclude']                                 = { icon = '', unicode = 0xEAE5 },
  ['expand-all']                              = { icon = '', unicode = 0xEB95 },
  ['export']                                  = { icon = '', unicode = 0xEBAC },
  ['extensions']                              = { icon = '', unicode = 0xEAE6 },
  ['eye']                                     = { icon = '', unicode = 0xEA70 },
  ['eye-closed']                              = { icon = '', unicode = 0xEAE7 },
  ['eye-unwatch']                             = { icon = '', unicode = 0xEA70 },
  ['eye-watch']                               = { icon = '', unicode = 0xEA70 },
  ['feedback']                                = { icon = '', unicode = 0xEB96 },
  ['file']                                    = { icon = '', unicode = 0xEA7B },
  ['file-add']                                = { icon = '', unicode = 0xEA7F },
  ['file-binary']                             = { icon = '', unicode = 0xEAE8 },
  ['file-code']                               = { icon = '', unicode = 0xEAE9 },
  ['file-directory']                          = { icon = '', unicode = 0xEA83 },
  ['file-directory-create']                   = { icon = '', unicode = 0xEA80 },
  ['file-media']                              = { icon = '', unicode = 0xEAEA },
  ['file-pdf']                                = { icon = '', unicode = 0xEAEB },
  ['file-submodule']                          = { icon = '', unicode = 0xEAEC },
  ['file-symlink-directory']                  = { icon = '', unicode = 0xEAED },
  ['file-symlink-file']                       = { icon = '', unicode = 0xEAEE },
  ['file-text']                               = { icon = '', unicode = 0xEA7B },
  ['file-zip']                                = { icon = '', unicode = 0xEAEF },
  ['files']                                   = { icon = '', unicode = 0xEAF0 },
  ['filter']                                  = { icon = '', unicode = 0xEAF1 },
  ['flame']                                   = { icon = '', unicode = 0xEAF2 },
  ['fold']                                    = { icon = '', unicode = 0xEAF5 },
  ['fold-down']                               = { icon = '', unicode = 0xEAF3 },
  ['fold-up']                                 = { icon = '', unicode = 0xEAF4 },
  ['folder']                                  = { icon = '', unicode = 0xEA83 },
  ['folder-active']                           = { icon = '', unicode = 0xEAF6 },
  ['folder-opened']                           = { icon = '', unicode = 0xEAF7 },
  ['gather']                                  = { icon = '', unicode = 0xEBB6 },
  ['gear']                                    = { icon = '', unicode = 0xEAF8 },
  ['gift']                                    = { icon = '', unicode = 0xEAF9 },
  ['gist']                                    = { icon = '', unicode = 0xEAFB },
  ['gist-fork']                               = { icon = '', unicode = 0xEA63 },
  ['gist-new']                                = { icon = '', unicode = 0xEA60 },
  ['gist-private']                            = { icon = '', unicode = 0xEA75 },
  ['gist-secret']                             = { icon = '', unicode = 0xEAFA },
  ['git-branch']                              = { icon = '', unicode = 0xEA68 },
  ['git-branch-create']                       = { icon = '', unicode = 0xEA68 },
  ['git-branch-delete']                       = { icon = '', unicode = 0xEA68 },
  ['git-commit']                              = { icon = '', unicode = 0xEAFC },
  ['git-compare']                             = { icon = '', unicode = 0xEAFD },
  ['git-fork-private']                        = { icon = '', unicode = 0xEA75 },
  ['git-merge']                               = { icon = '', unicode = 0xEAFE },
  ['git-pull-request']                        = { icon = '', unicode = 0xEA64 },
  ['git-pull-request-abandoned']              = { icon = '', unicode = 0xEA64 },
  ['git-pull-request-create']                 = { icon = '', unicode = 0xEBBC },
  ['github']                                  = { icon = '', unicode = 0xEA84 },
  ['github-action']                           = { icon = '', unicode = 0xEAFF },
  ['github-alt']                              = { icon = '', unicode = 0xEB00 },
  ['github-inverted']                         = { icon = '', unicode = 0xEBA1 },
  ['globe']                                   = { icon = '', unicode = 0xEB01 },
  ['go-to-file']                              = { icon = '', unicode = 0xEA94 },
  ['grabber']                                 = { icon = '', unicode = 0xEB02 },
  ['graph']                                   = { icon = '', unicode = 0xEB03 },
  ['graph-left']                              = { icon = '', unicode = 0xEBAD },
  ['gripper']                                 = { icon = '', unicode = 0xEB04 },
  ['group-by-ref-type']                       = { icon = '', unicode = 0xEB97 },
  ['heart']                                   = { icon = '', unicode = 0xEB05 },
  ['history']                                 = { icon = '', unicode = 0xEA82 },
  ['home']                                    = { icon = '', unicode = 0xEB06 },
  ['horizontal-rule']                         = { icon = '', unicode = 0xEB07 },
  ['hubot']                                   = { icon = '', unicode = 0xEB08 },
  ['inbox']                                   = { icon = '', unicode = 0xEB09 },
  ['info']                                    = { icon = '', unicode = 0xEA74 },
  ['issue-closed']                            = { icon = '', unicode = 0xEB0A },
  ['issue-opened']                            = { icon = '', unicode = 0xEA74 },
  ['issue-reopened']                          = { icon = '', unicode = 0xEB0B },
  ['issues']                                  = { icon = '', unicode = 0xEB0C },
  ['italic']                                  = { icon = '', unicode = 0xEB0D },
  ['jersey']                                  = { icon = '', unicode = 0xEB0E },
  ['json']                                    = { icon = '', unicode = 0xEB0F },
  ['kebab-horizontal']                        = { icon = '', unicode = 0xEA7C },
  ['kebab-vertical']                          = { icon = '', unicode = 0xEB10 },
  ['key']                                     = { icon = '', unicode = 0xEB11 },
  ['keyboard']                                = { icon = '', unicode = 0xEA65 },
  ['law']                                     = { icon = '', unicode = 0xEB12 },
  ['library']                                 = { icon = '', unicode = 0xEB9C },
  ['light-bulb']                              = { icon = '', unicode = 0xEA61 },
  ['lightbulb']                               = { icon = '', unicode = 0xEA61 },
  ['lightbulb-autofix']                       = { icon = '', unicode = 0xEB13 },
  ['link']                                    = { icon = '', unicode = 0xEB15 },
  ['link-external']                           = { icon = '', unicode = 0xEB14 },
  ['list-filter']                             = { icon = '', unicode = 0xEB83 },
  ['list-flat']                               = { icon = '', unicode = 0xEB84 },
  ['list-ordered']                            = { icon = '', unicode = 0xEB16 },
  ['list-selection']                          = { icon = '', unicode = 0xEB85 },
  ['list-tree']                               = { icon = '', unicode = 0xEB86 },
  ['list-unordered']                          = { icon = '', unicode = 0xEB17 },
  ['live-share']                              = { icon = '', unicode = 0xEB18 },
  ['loading']                                 = { icon = '', unicode = 0xEB19 },
  ['location']                                = { icon = '', unicode = 0xEB1A },
  ['lock']                                    = { icon = '', unicode = 0xEA75 },
  ['log-in']                                  = { icon = '', unicode = 0xEA6F },
  ['log-out']                                 = { icon = '', unicode = 0xEA6E },
  ['logo-github']                             = { icon = '', unicode = 0xEA84 },
  ['magnet']                                  = { icon = '', unicode = 0xEBAE },
  ['mail']                                    = { icon = '', unicode = 0xEB1C },
  ['mail-read']                               = { icon = '', unicode = 0xEB1B },
  ['mail-reply']                              = { icon = '', unicode = 0xEA7D },
  ['markdown']                                = { icon = '', unicode = 0xEB1D },
  ['megaphone']                               = { icon = '', unicode = 0xEB1E },
  ['mention']                                 = { icon = '', unicode = 0xEB1F },
  ['menu']                                    = { icon = '', unicode = 0xEB94 },
  ['merge']                                   = { icon = '', unicode = 0xEBAB },
  ['microscope']                              = { icon = '', unicode = 0xEA79 },
  ['milestone']                               = { icon = '', unicode = 0xEB20 },
  ['mirror']                                  = { icon = '', unicode = 0xEA69 },
  ['mirror-private']                          = { icon = '', unicode = 0xEA75 },
  ['mirror-public']                           = { icon = '', unicode = 0xEA69 },
  ['more']                                    = { icon = '', unicode = 0xEA7C },
  ['mortar-board']                            = { icon = '', unicode = 0xEB21 },
  ['move']                                    = { icon = '', unicode = 0xEB22 },
  ['multiple-windows']                        = { icon = '', unicode = 0xEB23 },
  ['mute']                                    = { icon = '', unicode = 0xEB24 },
  ['new-file']                                = { icon = '', unicode = 0xEA7F },
  ['new-folder']                              = { icon = '', unicode = 0xEA80 },
  ['no-newline']                              = { icon = '', unicode = 0xEB25 },
  ['note']                                    = { icon = '', unicode = 0xEB26 },
  ['notebook']                                = { icon = '', unicode = 0xEBAF },
  ['notebook-template']                       = { icon = '', unicode = 0xEBBF },
  ['octoface']                                = { icon = '', unicode = 0xEB27 },
  ['open-preview']                            = { icon = '', unicode = 0xEB28 },
  ['organization']                            = { icon = '', unicode = 0xEA7E },
  ['organization-filled']                     = { icon = '', unicode = 0xEA7E },
  ['organization-outline']                    = { icon = '', unicode = 0xEA7E },
  ['output']                                  = { icon = '', unicode = 0xEB9D },
  ['package']                                 = { icon = '', unicode = 0xEB29 },
  ['paintcan']                                = { icon = '', unicode = 0xEB2A },
  ['pass']                                    = { icon = '', unicode = 0xEBA4 },
  ['pass-filled']                             = { icon = '', unicode = 0xEBB3 },
  ['pencil']                                  = { icon = '', unicode = 0xEA73 },
  ['person']                                  = { icon = '', unicode = 0xEA67 },
  ['person-add']                              = { icon = '', unicode = 0xEA67 },
  ['person-filled']                           = { icon = '', unicode = 0xEA67 },
  ['person-follow']                           = { icon = '', unicode = 0xEA67 },
  ['person-outline']                          = { icon = '', unicode = 0xEA67 },
  ['pin']                                     = { icon = '', unicode = 0xEB2B },
  ['pinned']                                  = { icon = '', unicode = 0xEBA0 },
  ['pinned-dirty']                            = { icon = '', unicode = 0xEBB2 },
  ['play']                                    = { icon = '', unicode = 0xEB2C },
  ['play-circle']                             = { icon = '', unicode = 0xEBA6 },
  ['plug']                                    = { icon = '', unicode = 0xEB2D },
  ['plus']                                    = { icon = '', unicode = 0xEA60 },
  ['preserve-case']                           = { icon = '', unicode = 0xEB2E },
  ['preview']                                 = { icon = '', unicode = 0xEB2F },
  ['primitive-dot']                           = { icon = '', unicode = 0xEA71 },
  ['primitive-square']                        = { icon = '', unicode = 0xEA72 },
  ['project']                                 = { icon = '', unicode = 0xEB30 },
  ['pulse']                                   = { icon = '', unicode = 0xEB31 },
  ['question']                                = { icon = '', unicode = 0xEB32 },
  ['quote']                                   = { icon = '', unicode = 0xEB33 },
  ['radio-tower']                             = { icon = '', unicode = 0xEB34 },
  ['reactions']                               = { icon = '', unicode = 0xEB35 },
  ['record']                                  = { icon = '', unicode = 0xEBA7 },
  ['record-keys']                             = { icon = '', unicode = 0xEA65 },
  ['redo']                                    = { icon = '', unicode = 0xEBB0 },
  ['references']                              = { icon = '', unicode = 0xEB36 },
  ['refresh']                                 = { icon = '', unicode = 0xEB37 },
  ['regex']                                   = { icon = '', unicode = 0xEB38 },
  ['remote']                                  = { icon = '', unicode = 0xEB3A },
  ['remote-explorer']                         = { icon = '', unicode = 0xEB39 },
  ['remove']                                  = { icon = '', unicode = 0xEB3B },
  ['remove-close']                            = { icon = '', unicode = 0xEA76 },
  ['repl']                                    = { icon = '', unicode = 0xEA85 },
  ['replace']                                 = { icon = '', unicode = 0xEB3D },
  ['replace-all']                             = { icon = '', unicode = 0xEB3C },
  ['reply']                                   = { icon = '', unicode = 0xEA7D },
  ['repo']                                    = { icon = '', unicode = 0xEA62 },
  ['repo-clone']                              = { icon = '', unicode = 0xEB3E },
  ['repo-create']                             = { icon = '', unicode = 0xEA60 },
  ['repo-delete']                             = { icon = '', unicode = 0xEA62 },
  ['repo-force-push']                         = { icon = '', unicode = 0xEB3F },
  ['repo-forked']                             = { icon = '', unicode = 0xEA63 },
  ['repo-pull']                               = { icon = '', unicode = 0xEB40 },
  ['repo-push']                               = { icon = '', unicode = 0xEB41 },
  ['repo-sync']                               = { icon = '', unicode = 0xEA77 },
  ['report']                                  = { icon = '', unicode = 0xEB42 },
  ['request-changes']                         = { icon = '', unicode = 0xEB43 },
  ['rocket']                                  = { icon = '', unicode = 0xEB44 },
  ['root-folder']                             = { icon = '', unicode = 0xEB46 },
  ['root-folder-opened']                      = { icon = '', unicode = 0xEB45 },
  ['rss']                                     = { icon = '', unicode = 0xEB47 },
  ['ruby']                                    = { icon = '', unicode = 0xEB48 },
  ['run']                                     = { icon = '', unicode = 0xEB2C },
  ['run-all']                                 = { icon = '', unicode = 0xEB9E },
  ['run-above']                               = { icon = '', unicode = 0xEBBD },
  ['run-below']                               = { icon = '', unicode = 0xEBBE },
  ['save']                                    = { icon = '', unicode = 0xEB4B },
  ['save-all']                                = { icon = '', unicode = 0xEB49 },
  ['save-as']                                 = { icon = '', unicode = 0xEB4A },
  ['screen-full']                             = { icon = '', unicode = 0xEB4C },
  ['screen-normal']                           = { icon = '', unicode = 0xEB4D },
  ['search']                                  = { icon = '', unicode = 0xEA6D },
  ['search-save']                             = { icon = '', unicode = 0xEA6D },
  ['search-stop']                             = { icon = '', unicode = 0xEB4E },
  ['selection']                               = { icon = '', unicode = 0xEB85 },
  ['server']                                  = { icon = '', unicode = 0xEB50 },
  ['server-environment']                      = { icon = '', unicode = 0xEBA3 },
  ['server-process']                          = { icon = '', unicode = 0xEBA2 },
  ['settings']                                = { icon = '', unicode = 0xEB52 },
  ['settings-gear']                           = { icon = '', unicode = 0xEB51 },
  ['shield']                                  = { icon = '', unicode = 0xEB53 },
  ['sign-in']                                 = { icon = '', unicode = 0xEA6F },
  ['sign-out']                                = { icon = '', unicode = 0xEA6E },
  ['smiley']                                  = { icon = '', unicode = 0xEB54 },
  ['sort-precedence']                         = { icon = '', unicode = 0xEB55 },
  ['source-control']                          = { icon = '', unicode = 0xEA68 },
  ['split-horizontal']                        = { icon = '', unicode = 0xEB56 },
  ['split-vertical']                          = { icon = '', unicode = 0xEB57 },
  ['squirrel']                                = { icon = '', unicode = 0xEB58 },
  ['star']                                    = { icon = '', unicode = 0xEA6A },
  ['star-add']                                = { icon = '', unicode = 0xEA6A },
  ['star-delete']                             = { icon = '', unicode = 0xEA6A },
  ['star-empty']                              = { icon = '', unicode = 0xEA6A },
  ['star-full']                               = { icon = '', unicode = 0xEB59 },
  ['star-half']                               = { icon = '', unicode = 0xEB5A },
  ['stop']                                    = { icon = '', unicode = 0xEA87 },
  ['stop-circle']                             = { icon = '', unicode = 0xEBA5 },
  ['symbol-array']                            = { icon = '', unicode = 0xEA8A },
  ['symbol-boolean']                          = { icon = '', unicode = 0xEA8F },
  ['symbol-class']                            = { icon = '', unicode = 0xEB5B },
  ['symbol-color']                            = { icon = '', unicode = 0xEB5C },
  ['symbol-constant']                         = { icon = '', unicode = 0xEB5D },
  ['symbol-constructor']                      = { icon = '', unicode = 0xEA8C },
  ['symbol-enum']                             = { icon = '', unicode = 0xEA95 },
  ['symbol-enum-member']                      = { icon = '', unicode = 0xEB5E },
  ['symbol-event']                            = { icon = '', unicode = 0xEA86 },
  ['symbol-field']                            = { icon = '', unicode = 0xEB5F },
  ['symbol-file']                             = { icon = '', unicode = 0xEB60 },
  ['symbol-folder']                           = { icon = '', unicode = 0xEA83 },
  ['symbol-function']                         = { icon = '', unicode = 0xEA8C },
  ['symbol-interface']                        = { icon = '', unicode = 0xEB61 },
  ['symbol-key']                              = { icon = '', unicode = 0xEA93 },
  ['symbol-keyword']                          = { icon = '', unicode = 0xEB62 },
  ['symbol-method']                           = { icon = '', unicode = 0xEA8C },
  ['symbol-misc']                             = { icon = '', unicode = 0xEB63 },
  ['symbol-module']                           = { icon = '', unicode = 0xEA8B },
  ['symbol-namespace']                        = { icon = '', unicode = 0xEA8B },
  ['symbol-null']                             = { icon = '', unicode = 0xEA8F },
  ['symbol-number']                           = { icon = '', unicode = 0xEA90 },
  ['symbol-numeric']                          = { icon = '', unicode = 0xEA90 },
  ['symbol-object']                           = { icon = '', unicode = 0xEA8B },
  ['symbol-operator']                         = { icon = '', unicode = 0xEB64 },
  ['symbol-package']                          = { icon = '', unicode = 0xEA8B },
  ['symbol-parameter']                        = { icon = '', unicode = 0xEA92 },
  ['symbol-property']                         = { icon = '', unicode = 0xEB65 },
  ['symbol-reference']                        = { icon = '', unicode = 0xEA94 },
  ['symbol-ruler']                            = { icon = '', unicode = 0xEA96 },
  ['symbol-snippet']                          = { icon = '', unicode = 0xEB66 },
  ['symbol-string']                           = { icon = '', unicode = 0xEB8D },
  ['symbol-struct']                           = { icon = '', unicode = 0xEA91 },
  ['symbol-structure']                        = { icon = '', unicode = 0xEA91 },
  ['symbol-text']                             = { icon = '', unicode = 0xEA93 },
  ['symbol-type-parameter']                   = { icon = '', unicode = 0xEA92 },
  ['symbol-unit']                             = { icon = '', unicode = 0xEA96 },
  ['symbol-value']                            = { icon = '', unicode = 0xEA95 },
  ['symbol-variable']                         = { icon = '', unicode = 0xEA88 },
  ['sync']                                    = { icon = '', unicode = 0xEA77 },
  ['sync-ignored']                            = { icon = '', unicode = 0xEB9F },
  ['table']                                   = { icon = '', unicode = 0xEBB7 },
  ['tag']                                     = { icon = '', unicode = 0xEA66 },
  ['tag-add']                                 = { icon = '', unicode = 0xEA66 },
  ['tag-remove']                              = { icon = '', unicode = 0xEA66 },
  ['tasklist']                                = { icon = '', unicode = 0xEB67 },
  ['telescope']                               = { icon = '', unicode = 0xEB68 },
  ['terminal']                                = { icon = '', unicode = 0xEA85 },
  ['terminal-cmd']                            = { icon = '', unicode = 0xEBC4 },
  ['terminal-debia']                          = { icon = '', unicode = 0xEBC5 },
  ['terminal-linux']                          = { icon = '', unicode = 0xEBC6 },
  ['terminal-powershell']                     = { icon = '', unicode = 0xEBC7 },
  ['terminal-tmux']                           = { icon = '', unicode = 0xEBC8 },
  ['text-size']                               = { icon = '', unicode = 0xEB69 },
  ['three-bars']                              = { icon = '', unicode = 0xEB6A },
  ['thumbsdown']                              = { icon = '', unicode = 0xEB6B },
  ['thumbsup']                                = { icon = '', unicode = 0xEB6C },
  ['tools']                                   = { icon = '', unicode = 0xEB6D },
  ['trash']                                   = { icon = '', unicode = 0xEA81 },
  ['trashcan']                                = { icon = '', unicode = 0xEA81 },
  ['triangle-down']                           = { icon = '', unicode = 0xEB6E },
  ['triangle-left']                           = { icon = '', unicode = 0xEB6F },
  ['triangle-right']                          = { icon = '', unicode = 0xEB70 },
  ['triangle-up']                             = { icon = '', unicode = 0xEB71 },
  ['twitter']                                 = { icon = '', unicode = 0xEB72 },
  ['type-hierarchy']                          = { icon = '', unicode = 0xEBB9 },
  ['type-hierarchy-sub']                      = { icon = '', unicode = 0xEBBA },
  ['type-hierarchy-super']                    = { icon = '', unicode = 0xEBBB },
  ['unfold']                                  = { icon = '', unicode = 0xEB73 },
  ['ungroup-by-ref-type']                     = { icon = '', unicode = 0xEB98 },
  ['unlock']                                  = { icon = '', unicode = 0xEB74 },
  ['unmute']                                  = { icon = '', unicode = 0xEB75 },
  ['unverified']                              = { icon = '', unicode = 0xEB76 },
  ['variable']                                = { icon = '', unicode = 0xEA88 },
  ['variable-group']                          = { icon = '', unicode = 0xEBB8 },
  ['verified']                                = { icon = '', unicode = 0xEB77 },
  ['versions']                                = { icon = '', unicode = 0xEB78 },
  ['vm']                                      = { icon = '', unicode = 0xEA7A },
  ['vm-active']                               = { icon = '', unicode = 0xEB79 },
  ['vm-connect']                              = { icon = '', unicode = 0xEBA9 },
  ['vm-outline']                              = { icon = '', unicode = 0xEB7A },
  ['vm-running']                              = { icon = '', unicode = 0xEB7B },
  ['warning']                                 = { icon = '', unicode = 0xEA6C },
  ['watch']                                   = { icon = '', unicode = 0xEB7C },
  ['whitespace']                              = { icon = '', unicode = 0xEB7D },
  ['whole-word']                              = { icon = '', unicode = 0xEB7E },
  ['window']                                  = { icon = '', unicode = 0xEB7F },
  ['word-wrap']                               = { icon = '', unicode = 0xEB80 },
  ['workspace-trusted']                       = { icon = '', unicode = 0xEBC1 },
  ['workspace-unknown']                       = { icon = '', unicode = 0xEBC3 },
  ['workspace-untrusted']                     = { icon = '', unicode = 0xEBC2 },
  ['wrench']                                  = { icon = '', unicode = 0xEB65 },
  ['wrench-subaction']                        = { icon = '', unicode = 0xEB65 },
  ['x']                                       = { icon = '', unicode = 0xEA76 },
  ['zap']                                     = { icon = '', unicode = 0xEA86 },
  ['zoom-in']                                 = { icon = '', unicode = 0xEB81 },
  ['zoom-out']                                = { icon = '', unicode = 0xEB82 },
}

-- Add indexing by unicode value
for name, config in pairs(vim.deepcopy(codicons)) do
  -- If it has a codicon defined for the unicode value, convert it to a list of names
  if codicons[config.unicode] then
    if type(codicons[config.unicode].name) ~= 'table' then
      codicons[config.unicode].name = { codicons[config.unicode].name }
    end
    table.insert(codicons[config.unicode].name, name)
  else
    codicons[config.unicode] = { name = name, icon = config.icon }
  end
end

return codicons
