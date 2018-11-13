;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; ============= File types ==================
     csv
     markdown
     ipython-notebook
     docker
     shell-scripts
     latex
     org
     emoji

     ;;    :bind (:map spacemacs-org-mode-map-root-map ("M-RET" . nil)))
     

     ;; ============= Tools/Utils ==================
     osx
     helm
     evil-commentary
     git
     spell-checking
     ;; (spell-checking :variables enable-flyspell-auto-completion t)
     syntax-checking
     version-control
     better-defaults
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      ;; tab behabior should be cycle, concider trying
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.3
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      )
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'shell)
     ;; floobits

     ;; ============= Langs ==================
     c-c++
     javascript
     (python :variables
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t)
     vimscript
     emacs-lisp


     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(sublimity eterm-256color org-autolist)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner "~/.emacs.d/core/banners/binary.jpg"
   ;; dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 5)
                                (bookmarks . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1
                               )
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.25
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '( :relative t
                                :disabled-for-modes dired-mode
                                                    doc-view-mode
                                                    pdf-view-mode
                                :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (defface my-face-red
  ;;   '((t (:inherit shadow 
  ;;                  :box (:line-width -2 ;neg. in order to keep the same size of lines
  ;;                                    :color "grey75"
  ;;                                    :style pressed-button)))) "Face for keystrokes"
  ;;   :group 'org-faces)

  ;; (use-package pdf-tools
  ;;   :ensure t
  ;;   :config
  ;;   (custom-set-variables
  ;;    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  ;;   (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
  ;; (pdf-tools-install)
  
  ;; might be worth having but is a little busy 
  ;; (highlight-indentation-mode t)

  ;; (setq-default dotspacemacs-configuration-layers '(pdf-tools))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp  . t)
     (python  . t)
     (shell .t)
     ))
  (add-to-list 'auto-mode-alist '("*bash.fc*" . shell-script-mode))
  (setq-default dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-enable-help-tooltip t
                                   auto-completion-enable-snippets-in-popup t
                                   auto-completion-enable-sort-by-usage t
                                   )))

  ;; --------------------------------
  ;;https://github.com/dunn/company-emoji
  (defun --set-emoji-font (frame)
    "Adjust the font settings of FRAME so Emacs can display emoji properly."
    (if (eq system-type 'darwin)
        ;; For NS/Cocoa
        (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
      ;; For Linux
      (set-fontset-font t 'symbol (font-spec :family "Symbola") frame 'prepend)))

  ;; For when Emacs is started in GUI mode:
  (--set-emoji-font nil)
  ;; Hook for when a frame is created with emacsclient
  ;; see https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Frames.html
  (add-hook 'after-make-frame-functions '--set-emoji-font)
  ;; --------------------------------

  ;; (with-eval-after-load 'org
  ;;   (add-hook 'org-mode-hook (lambda()
  ;;                              (define-key
  ;;                                evil-normal-state-local-map
  ;;                                (kbd "M-RET")
  ;;                                #'org-meta-return)
  ;;                              (define-key
  ;;                                evil-insert-state-local-map
  ;;                                (kbd "M-RET")
  ;;                                #'org-meta-return)))

  ;; (require 'org-inlinetask)

  ;; (defun scimax/org-return (&optional ignore)
  ;;   "Add new list item, heading or table row with RET.
  ;; A double return on an empty element deletes it.
  ;; Use a prefix arg to get regular RET. "
  ;;   (interactive "P")
  ;;   (if ignore
  ;;       (org-return)
  ;;     (cond

  ;;     ((eq 'line-break (car (org-element-context)))
  ;;       (org-return-indent))

  ;;     ;; Open links like usual, unless point is at the end of a line.
  ;;     ;; and if at beginning of line, just press enter.
  ;;     ((or (and (eq 'link (car (org-element-context))) (not (eolp)))
  ;;           (bolp))
  ;;       (org-return))

  ;;     ;; It doesn't make sense to add headings in inline tasks. Thanks Anders
  ;;     ;; Johansson!
  ;;     ((org-inlinetask-in-task-p)
  ;;       (org-return))

  ;;     ;; checkboxes too
  ;;     ((org-at-item-checkbox-p)
  ;;       (org-insert-todo-heading nil))

  ;;     ;; lists end with two blank lines, so we need to make sure we are also not
  ;;     ;; at the beginning of a line to avoid a loop where a new entry gets
  ;;     ;; created with only one blank line.
  ;;     ((org-in-item-p)
  ;;       (if (save-excursion (beginning-of-line) (org-element-property :contents-begin (org-element-context)))
  ;;           (org-insert-heading)
  ;;         (beginning-of-line)
  ;;         (delete-region (line-beginning-position) (line-end-position))
  ;;         (org-return)))

  ;;     ;; org-heading
  ;;     ((org-at-heading-p)
  ;;       (if (not (string= "" (org-element-property :title (org-element-context))))
  ;;           (progn (org-end-of-meta-data)
  ;;                 (org-insert-heading-respect-content)
  ;;                 (outline-show-entry))
  ;;         (beginning-of-line)
  ;;         (setf (buffer-substring
  ;;               (line-beginning-position) (line-end-position)) "")))

  ;;     ;; tables
  ;;     ((org-at-table-p)
  ;;       (if (-any?
  ;;           (lambda (x) (not (string= "" x)))
  ;;           (nth
  ;;             (- (org-table-current-dline) 1)
  ;;             (org-table-to-lisp)))
  ;;           (org-return)
  ;;         ;; empty row
  ;;         (beginning-of-line)
  ;;         (setf (buffer-substring
  ;;               (line-beginning-position) (line-end-position)) "")
  ;;         (org-return)))

  ;;     ;; fall-through case
  ;;     (t
  ;;       (org-return)))))


  ;; (define-key org-mode-map (kbd "RET")
  ;;   'scimax/org-return)
    ;; (add-hook 'org-mode-hook (lambda()
    ;;                            (define-key
    ;;                              evil-normal-state-local-map
    ;;                              (kbd "M-RET")
    ;;                              #'org-meta-return)
    ;;                            (define-key
    ;;                              evil-insert-state-local-map
    ;;                              (kbd "M-RET")
    ;;                              #'org-meta-return)))
    ;; )
                                        ; from enberg on #emacs
  ;; (setq compilation-finish-function
  ;;       (lambda (buf str)
  ;;         (if (null (string-match ".*exited abnormally.*" str))
  ;;             ;;no errors, make the compilation window go away in a few seconds
  ;;             (progn
  ;;               (run-at-time
  ;;                "2 sec" nil 'delete-windows-on
  ;;                (get-buffer-create "*compilation*"))
  ;;               (message "No Compilation Errors!")))))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; --- PACKAGES ---
  (require 'org-protocol)
  (require 'sublimity)
  (require 'org-autolist)
  (add-hook 'org-mode-hook 'org-autolist-mode)

  ;; https://github.com/dieggsy/eterm-256color
  (require 'eterm-256color)
  (add-hook 'term-mode-hook #'eterm-256color-mode)

  ;; --- HOOKS ---
  ;; - SHELL HOOKS -
  (add-hook 'shell-mode-hook
            (lambda ()
              (define-key evil-insert-state-map (kbd "<tab>") 'auto-complete)
              ('auto-complete-mode)))
  ;; - ORG HOOKS -
  (add-hook 'org-mode-hook 'spacemacs/delay-emoji-cheat-sheet-hook)
  (add-hook 'org-mode-hook 'company-emoji-init)
  (add-hook 'org-log-buffer-setup-hook (lambda ()
                                         (evil-ex-define-cmd "wq" 'org-ctrl-c-ctrl-c)))
  (spacemacs/set-leader-keys-for-major-mode 'org-mode ";" 'org-set-tags-command)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode ":" 'org-set-tags-to)
  (spacemacs/set-leader-keys "oc" 'org-capture)
  ;; Re-indent all text in org-mode when saved 
  (defun org-mode-indent-hook()
    "Auto Indent Org-Mode"
    (when (eq major-mode 'org-mode)
      (org-indent-indent-buffer)))
  (add-hook 'after-save-hook 'org-mode-indent-hook)

  ;; --- VISUAL ---
  ;; Always wrap lines
  (global-visual-line-mode 1) ; wrap line by default

  ;; --- POWER LINE ---
  ;; Date-time in powerline
  ;; From: https://emacs.stackexchange.com/questions/16735/how-to-add-date-and-time-into-spacemacs-mode-line
  (spaceline-define-segment datetime
    (shell-command-to-string "echo -n $(date '+%a %d %b %I:%M%p')"))
  ;; Add datetime
  (spaceline-spacemacs-theme 'datetime)
  ;; add version control
  (setq spaceline-version-control-p t)
  ;; hide minor mode from statusline
  (setq-default spaceline-minor-modes-p nil)


  ;; https://korewanetadesu.com/emacs-on-os-x.html
  (when (featurep 'ns)
    (defun ns-raise-emacs ()
      "Raise Emacs."
      (ns-do-applescript "tell application \"Emacs\" to activate"))

    (defun ns-raise-emacs-with-frame (frame)
      "Raise Emacs and select the provided frame."
      (with-selected-frame frame
        (when (display-graphic-p)
          (ns-raise-emacs))))
    (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)
    (when (display-graphic-p)
      (ns-raise-emacs)))

  ;; --- NAVIGATION ---
  ;; --- WINDOW ---
  ;; better splits split
  (spacemacs/set-leader-keys "w\\" 'split-window-right-and-focus)
  (spacemacs/set-leader-keys "w-" 'split-window-below-and-focus)
  ;; Move between windows with modifier (CMD) + arrow
  (windmove-default-keybindings 'super)

  ;; change workspace quickly
  (spacemacs/set-leader-keys "\~" 'eyebrowse-switch-to-window-config)
  (spacemacs/set-leader-keys "`" 'eyebrowse-last-window-config)

  ;; --- CURSOR ---
  ;; move within visual lines, not true lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; Enable mouse support
  (unless window-system
    (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
    (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

  ;; --- EVIL EX COMMANDS ---
  ;; typos
  (evil-ex-define-cmd "Q" "q")
  (evil-ex-define-cmd "Q!" "q!")
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "W!" "w!")
  (evil-ex-define-cmd "WQ" "wq")
  (evil-ex-define-cmd "Wq" "wq")
  (evil-ex-define-cmd "wQ" "wq")
  (evil-ex-define-cmd "WQ!" "wq!")
  (evil-ex-define-cmd "Wq!" "wq!")
  (evil-ex-define-cmd "wQ!" "wq!")



  ;; (require 'sublimity-scroll)
  ;; (require 'sublimity-map)
  ;; (require 'sublimity-attractive)
  ;; (setq sublimity-scroll-weight 10
  ;;       sublimity-scroll-drift-length 5)
  ;; (sublimity-map-set-delay 10)
  ;; emacs application framework TESTING
  ;; (require 'eaf)

  ;; (setq powerline-default-separator 'slant)

  ;; (setq-default dotspacemacs-configuration-layers '(
  ;;                                                   (python :variables python-enable-yapf-format-on-save t)))
  ;; (setq-default dotspacemacs-configuration-layers
  ;;               '((python :variables python-sort-imports-on-save t)))

  ;; (setq-default dotspacemacs-configuration-layers '(
  ;;                                                   (python :variables python-enable-yapf-format-on-save t)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-clang-language-standard "c++11")
 '(flycheck-gcc-language-standard "c++11")
 '(helm-external-programs-associations (quote (("my_file_extension" . "open"))))
 '(org-agenda-files
   (quote
    ("~/org/notes.org" "~/org/todo.org" "~/org/info.org")))
 '(org-capture-templates
   (quote
    (("l" "Link-selected" entry
      (file+headline "~/org/notes.org" "Links")
      "* %:annotation :link:capture:
%u
\"%i\"
%?")
     ("L" "Link-unselected" entry
      (file+headline "~/org/notes.org" "Links")
      "* %:annotation :link:capture:
%u
%?")
     ("n" "Note" entry
      (file+headline "~/org/notes.org" "Notes")
      "* %? :NOTE:
%i
%a")
     ("t" "Todo" entry
      (file+headline "~/org/notes.org" "Todos")
      "* TODO %? :TODO:
%i
%a"))))
 '(org-clock-idle-time 15)
 '(org-emphasis-alist
   (quote
    (("*"
      (bold :foreground "red"))
     ("/"
      (italic :foreground "green"))
     ("_"
      (underline :foreground "yellow"))
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("+"
      (:strike-through t)))))
 '(org-hide-emphasis-markers t)
 '(org-hierarchical-todo-statistics nil)
 '(org-image-actual-width (quote (200)))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-rmail org-w3m)))
 '(org-read-date-prefer-future (quote time))
 '(org-startup-indented t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "IN PROGRESS(i@/@)" "PAUSED(p@/@)" "BLOCKED(b@/@)" "|" "CANCLED(c@/@)" "DONE(d@/@)"))))
 '(package-selected-packages
   (quote
    (yaml-mode emoji-cheat-sheet-plus company-emoji eterm-256color flyspell-popup jedi company-jedi sublimity yasnippet-snippets insert-shebang fish-mode dockerfile-mode docker docker-tramp company-shell org-mime treepy graphql gmail-message-mode ham-mode html-to-markdown flymd edit-server ein request-deferred websocket deferred git-gutter-fringe git-gutter-fringe+ git-gutter+ xterm-color shell-pop multi-term fringe-helper git-gutter eshell-z eshell-prompt-extras esh-help diff-hl livid-mode skewer-mode json-mode js2-refactor company-tern web-beautify simple-httpd json-snatcher json-reformat multiple-cursors js2-mode js-doc tern coffee-mode csv-mode org-autolist org-pomodoro auctex-latexmk floobits org-projectile org-category-capture org-present alert log4e gntp org-download htmlize gnuplot disaster company-c-headers cmake-mode clang-format company-quickhelp company-auctex auctex reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl pdf-tools tablist unfill smeargle orgit mwim mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-commentary company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic vimrc-mode dactyl-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(powerline-default-separator nil)
 '(powerline-image-apple-rgb t)
 '(windmove-wrap-around t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
