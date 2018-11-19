(org-babel-load-file "~/.spacemacs.d/my_spacemacs_config.org")

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
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.5 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-hide-emphasis-markers t)
 '(org-hierarchical-todo-statistics nil)
 '(org-image-actual-width (quote (200)))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-rmail org-w3m)))
 '(org-read-date-prefer-future (quote time))
 '(org-startup-indented t)
 '(org-startup-with-latex-preview t)
 '(org-structure-template-alist
   (quote
    (("el" "#+BEGIN_SRC emacs-lisp
?
#+END_SRC")
     ("s" "#+BEGIN_SRC ?

#+END_SRC")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER")
     ("C" "#+BEGIN_COMMENT
?
#+END_COMMENT")
     ("l" "#+BEGIN_EXPORT latex
?
#+END_EXPORT")
     ("L" "#+LaTeX: ")
     ("h" "#+BEGIN_EXPORT html
?
#+END_EXPORT")
     ("H" "#+HTML: ")
     ("a" "#+BEGIN_EXPORT ascii
?
#+END_EXPORT")
     ("A" "#+ASCII: ")
     ("i" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?"))))
 '(org-table-use-standard-references t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "IN PROGRESS(i@/@)" "PAUSED(p@/@)" "BLOCKED(b@/@)" "|" "CANCLED(c@/@)" "DONE(d@/@)"))))
 '(package-selected-packages
   (quote
    (restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well elisp-format magithub ghub+ apiwrap yaml-mode emoji-cheat-sheet-plus company-emoji eterm-256color flyspell-popup jedi company-jedi sublimity yasnippet-snippets insert-shebang fish-mode dockerfile-mode docker docker-tramp company-shell org-mime treepy graphql gmail-message-mode ham-mode html-to-markdown flymd edit-server ein request-deferred websocket deferred git-gutter-fringe git-gutter-fringe+ git-gutter+ xterm-color shell-pop multi-term fringe-helper git-gutter eshell-z eshell-prompt-extras esh-help diff-hl livid-mode skewer-mode json-mode js2-refactor company-tern web-beautify simple-httpd json-snatcher json-reformat multiple-cursors js2-mode js-doc tern coffee-mode csv-mode org-autolist org-pomodoro auctex-latexmk floobits org-projectile org-category-capture org-present alert log4e gntp org-download htmlize gnuplot disaster company-c-headers cmake-mode clang-format company-quickhelp company-auctex auctex reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl pdf-tools tablist unfill smeargle orgit mwim mmm-mode markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor evil-commentary company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic vimrc-mode dactyl-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(powerline-default-separator nil)
 '(powerline-image-apple-rgb t)
 '(windmove-wrap-around t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
