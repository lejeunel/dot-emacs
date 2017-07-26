;;; init --- Krakapwa's Emacs init file
;;; Commentary:
;; See readme.

;;; Code:

;;; package setup
(require 'package)
(setq load-prefer-newer t
      package-enable-at-startup nil
      package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t
      use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(use-package yasnippet
  :commands (yas-minor-mode) ; autoload `yasnippet' when `yas-minor-mode' is called
                                        ; using any means: via a hook or by user
                                        ; Feel free to add more commands to this
                                        ; list to suit your needs.
  :init ; stuff to do before requiring the package
  (progn
    (add-hook 'python-mode-hook #'yas-minor-mode))
  (progn
    (add-hook 'inferior-python-mode-hook #'yas-minor-mode))
  :config ; stuff to do after requiring the package
  (progn
    (yas-reload-all)))

;;; bindings
;; evil
(use-package evil
  :defines evil-disable-insert-state-bindings
  :init
    (evil-mode t)
  (setq evil-want-fine-undo 'no
        evil-want-C-u-scroll t
        evil-want-C-d-scroll t
        evil-symbol-word-search t
        evil-cross-lines t
        evil-disable-insert-state-bindings t)
        (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key Info-mode-map "g" nil)
  :config
    (add-hook 'git-commit-mode-hook 'evil-insert-state)
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  ;; Relative line numbering
  (use-package rainbow-delimiters
    :ensure t
    :init)

  ;; Relative line numbering
  (use-package linum-relative
    :ensure t
    :init
    (progn
      (setq linum-relative-format "%3s ")
      (setq linum-relative-current-symbol "")))
  ;; Highlight indent
  (use-package highlight-indent-guides
    :ensure t
    :init
    (progn
      (setq linum-relative-format "%3s ")
      (linum-mode)
      (linum-relative-mode)
      (setq highlight-indent-guides-method 'column)))
  (use-package hlinum
    :ensure t
    :init
    (hlinum-activate)
  )
  (use-package paren
    :ensure t
    :init
    (progn
      (setq show-paren-style 'parenthesis)
      (show-paren-mode +1)
      )))

(with-eval-after-load 'comint
    (define-key comint-mode-map "\C-d" nil))

(defun evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
(evil-visual-restore))

(define-key evil-visual-state-map (kbd ">") 'evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'evil-shift-left-visual)
(define-key evil-visual-state-map [tab] 'evil-shift-right-visual)
(define-key evil-visual-state-map [S-tab] 'evil-shift-left-visual)

(use-package evil-anzu)

(use-package evil-commentary
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(use-package ediff
  :ensure nil
  :defer t
  :config (use-package evil-ediff))

(use-package evil-escape
  :diminish evil-escape-mode
  :config
  (evil-escape-mode))

(use-package evil-matchit
  :config (global-evil-matchit-mode))

(use-package evil-snipe
  :init (evil-snipe-mode))

(use-package evil-surround
  :config (global-evil-surround-mode))

(use-package evil-visualstar
  :init (global-evil-visualstar-mode))

;; key bindings
(use-package general
  :config
  ;; global keys
  (general-define-key
   :states '(insert)
   "M-y" 'helm-show-kill-ring
   "TAB" 'helm-company))

;;; navigation
;; helm
(use-package helm
  :diminish helm-mode
  :config
  (require 'helm-config)
  (general-define-key
   :keymaps 'helm-map
   "C-c !" 'helm-toggle-suspend-update
   "<tab>" 'helm-execute-persistent-action
   "C-i" 'helm-execute-persistent-action
   "C-z" 'helm-select-action)
  (global-unset-key (kbd "C-x c"))
  (helm-mode))

;; projectile
(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-enable-caching t
        projectile-completion-system 'helm
        projectile-switch-project-action 'helm-projectile)
  (projectile-global-mode))

(use-package helm-company
  :commands (helm-company)
  :config (company-mode))

(use-package helm-ag
  :commands (helm-ag)
  :config
  ;; fix https://github.com/bbatsov/projectile/issues/837
  (setq grep-find-ignored-files nil
        grep-find-ignored-directories nil))

(use-package helm-projectile
  :commands (helm-projectile)
  :config (helm-projectile-on))

(use-package helm-descbinds
  :config (helm-descbinds-mode))


(use-package helm-gitignore)

(load-file "~/.emacs.d/themes/monokai-theme.el")

(set-face-attribute 'default nil :font "Liberation Mono-12" )

(global-linum-mode t)
(global-visual-line-mode 1)

;;Maximize on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-hl-line-mode +1)
(blink-cursor-mode 0)
(set-cursor-color "#f4d942")

;;; appearance
(if (display-graphic-p)
    (progn
      (tool-bar-mode 0)
      (scroll-bar-mode 0)))

;; more context when scrolling
(setq next-screen-context-lines 4)

;; y/n for yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; start week on Monday
(setq calendar-week-start-day 1)

;; window undo/redo
(winner-mode)

;; tabs are truly evil
(setq-default indent-tabs-mode nil)

;; sentences end with one space
(setq sentence-end-double-space nil)

;;; settings
;; enable all commands
(setq disabled-command-function nil)

;; default truncate lines
(setq-default truncate-lines t)

;; disable bell
(setq ring-bell-function 'ignore
      visible-bell t)

;; increase garbage collection threshold
(setq gc-cons-threshold (* 10 1024 1024))

;; inhibit startup message
(setq inhibit-startup-message t)

;; kill settings
(setq save-interprogram-paste-before-kill t
      kill-do-not-save-duplicates t
      kill-whole-line t)

;; repeat mark pop
(setq-default set-mark-command-repeat-pop t)

;; set terminfo
(setq system-uses-terminfo nil)

;;; extensions
;; adaptive word wrapping
(use-package adaptive-wrap
  :config (adaptive-wrap-prefix-mode))

;; ag - the silver searcher
(use-package ag
  :commands (ag ag-files ag-regexp ag-project ag-dired helm-ag)
  :config (setq ag-highlight-search t
                ag-reuse-buffers t))

;; org mode extensions

(use-package org
  :general
  (:keymaps 'org-mode-map
    :states '(normal insert emacs)
    :major-mode 'org-mode
    :prefix "SPC"
    :non-normal-prefix "M-SPC"
    :which-key "org"
    "me" 'org-export-dispatch))

(use-package org-plus-contrib
  :mode (("\\.org\\'" . org-mode) ("[0-9]\\{8\\}\\'" . org-mode))
  :init
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t) (gnuplot . t) (C . t) (emacs-lisp . t) (haskell . t)
     (latex . t) (ledger . t) (python . t) (ruby . t) (sh . t)))
  (evil-define-key 'normal org-mode-map (kbd "g x") 'org-open-at-point)
  :config
  (use-package evil-org)
  (use-package org-ref)
  (use-package org-journal
    :commands (org-journal-new-entry))
  (use-package org-pomodoro
    :commands (org-pomodoro))
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (setq org-latex-listings t
        org-pretty-entities t
        setq org-ref-default-bibliography '("~/Documents/refs.bib")
        org-completion-use-ido t
        org-latex-custom-lang-environments '((C "lstlisting"))
        org-entities-user '(("join" "\\Join" nil "&#9285;" "" "" "⋈")
                            ("reals" "\\mathbb{R}" t "&#8477;" "" "" "ℝ")
                            ("ints" "\\mathbb{Z}" t "&#8484;" "" "" "ℤ")
                            ("complex" "\\mathbb{C}" t "&#2102;" "" "" "ℂ")
                            ("models" "\\models" nil "&#8872;" "" "" "⊧"))
        org-export-backends '(html beamer ascii latex md)))


;(set-frame-font FONT nil t)



;; git
(use-package git-timemachine)

;; yaml
(use-package yaml-mode
  :mode "\\.ya?ml\'")


(menu-bar-mode -1)

; Highlight the call to pdb
(defun annotate-pdb ()
  (interactive)
    (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)

(use-package elpy
  :defer t
  :ensure t
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable))

  :config
  (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()")
  (electric-indent-local-mode -1)
  (delete 'elpy-module-highlight-indentation elpy-modules)
  (delete 'elpy-module-flymake elpy-modules)

  ;(defun smart-open-line-above ()
  ;"Insert an empty line above the current line.
  ;  Position the cursor at it's beginning, according to the current mode."
  ;  (interactive)
  ;  (move-beginning-of-line nil)
  ;  (newline-and-indent)
  ;  (forward-line -1)
  ;  (indent-according-to-mode))


  (defun python-add-breakpoint ()
    "Add a break point"
    (interactive)
    (evil-open-above 1)
    (insert "import pdb; pdb.set_trace()")
    (evil-escape)
    (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))

    (defun my-elpy-shell-send-region-or-buffer (&optional arg)
      "Send the active region or the buffer to the Python shell.

    If there is an active region, send that. Otherwise, send the
    whole buffer.

    In Emacs 24.3 and later, without prefix argument, this will
    escape the Python idiom of if __name__ == '__main__' to be false
    to avoid accidental execution of code. With prefix argument, this
    code is executed."
      (interactive "P")
      ;; Ensure process exists
      (elpy-shell-get-or-create-process)
      (let ((if-main-regex "^if +__name__ +== +[\"']__main__[\"'] *:")
            (has-if-main nil))
        (if (use-region-p)
            (let ((region (elpy-shell--region-without-indentation
                           (region-beginning) (region-end))))
              (setq has-if-main (string-match if-main-regex region))
              (when (string-match "\t" region)
                (message "Region contained tabs, this might cause weird errors")))
              (python-shell-send-string region)
              (elpy-shell-switch-to-shell)
              (end-of-buffer)
              (evil-escape)
              (elpy-shell-switch-to-buffer))
          (save-excursion
            (goto-char (point-min))
            (setq has-if-main (re-search-forward if-main-regex nil t)))
          (python-shell-send-buffer arg)
          (elpy-shell-switch-to-shell)
          (end-of-buffer)
          (evil-escape)
          (elpy-shell-switch-to-buffer)
          )
        (elpy-shell-display-buffer)
        (when has-if-main
          (message (concat "Removed if __main__ == '__main__' construct, "
                           "use a prefix argument to evaluate.")))))

  (defun ha/elpy-goto-definition ()
    (interactive)
    (condition-case err
        (elpy-goto-definition)
      ('error (xref-find-definitions (symbol-name (symbol-at-point))))))


(use-package pyenv-mode
  :defer t
  :ensure t
  :config
    (defun projectile-pyenv-mode-set ()
      "Set pyenv version matching project name."
      (let ((project (projectile-project-name)))
        (if (member project (pyenv-mode-versions))
            (pyenv-mode-set project)
          (pyenv-mode-unset))))

    (add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
    (add-hook 'python-mode-hook 'pyenv-mode))

(use-package company-jedi
  :ensure t
  :init
  ;(setq company-jedi-python-bin "python2")
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package window-purpose)
(purpose-mode)
(add-to-list 'purpose-user-mode-purposes '(python-mode . py))
(add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
(purpose-compile-user-configuration)

(use-package python
  :defer t
  :general
  (:keymaps 'python-mode-map
    :states '(normal visual emacs)
    :major-mode 'python-mode
    :prefix "SPC"
    :which-key "Python"
    "mv" 'pyenv-mode-set
    "mb" 'elpy-shell-send-region-or-buffer
    ;"mb" 'elpy-shell-send-region-or-buffer
    "md" 'python-add-breakpoint
    "mg" 'anaconda-mode-find-assignments
    "mf" 'elpy-yapf-fix-code
    "mi" 'run-python))

(general-define-key :states '(normal insert emacs)
                    :major-mode 'inferior-python-mode
                    :keymaps 'inferior-python-mode-map
                    "C-r" 'comint-history-isearch-backward
                    "C-k" 'comint-previous-input
                    "C-j" 'comint-next-input)

(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt -i")


(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(use-package auctex
  :defer t
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init
  (progn
    (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
    (add-hook 'LaTeX-mode-hook #'flyspell-mode)
    (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
    (setq TeX-auto-save t
	  TeX-parse-self t
	  TeX-save-query nil
	  TeX-PDF-mode t)
    (setq-default TeX-master nil))
  :general
  (:keymaps 'latex-mode-map
   :states '(normal insert emacs)
   :major-mode 'latex-mode
   :prefix "SPC"
   :which-key "Latex"
      "mc" 'reftex-citation
   )
  )

;; So that RefTeX also recognizes \addbibresource.
(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
(setq reftex-default-bibliography '("~/Documents/2017_miccai/laurent_lejeune/refs.bib"))


(use-package iflipb
  :general
  (
    :states '(normal)
    :prefix "SPC"
    "k" 'iflipb-next-buffer
    "j" 'iflipb-previous-buffer))

;Single escape to exit "everything"
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

(general-define-key
 :states '(normal visual)
 :prefix "SPC"
       "TAB" 'switch-to-previous-buffer
       "ff" 'helm-find-files ; save windows layout
       "fs" 'save-buffer
       "wv" 'split-window-right
       "wd" 'delete-window
       "s" 'ace-window
       "bb" 'helm-mini
       "bd" 'kill-this-buffer
       ;"k" 'my-next-user-buffer
       ;"j" 'my-previous-user-buffer
       "ar" 'ranger
       "y" 'yas-insert-snippet
       "gs" 'magit-status
       "gtt" 'git-timemachine-toggle
       "gtn" 'git-timemachine-show-next-revision
       "gtp" 'git-timemachine-show-previous-revision
       "gtq" 'git-timemachine-quit
       "pr" 'profiler-report)

(require 'general)
(general-evil-setup t)


(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)



;;; provide init package
(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "003a9aa9e4acb50001a006cfde61a6c3012d373c4763b48ceb9d523ceba66829" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" default)))
 '(evil-symbol-word-search t)
 '(package-selected-packages
   (quote
    (iflipb iflibp buffer-stack hlinum rainbow-delimiters rainbow-delimiters-mode dashboard page-break-lines window-purpose dedicated latex-mode latex tex git-timemachine airline-themes ranger ac-anaconda company-anaconda anaconda-mode elpy evil-magit znc yaml-mode whitespace-cleanup-mode which-key virtualenvwrapper use-package unfill try toml-mode ssh-config-mode smooth-scroll sly scratch savekill rust-mode regex-tool puppet-mode processing-mode powershell powerline popwin pkgbuild-mode org-plus-contrib nginx-mode matlab-mode markdown-mode magit less-css-mode ledger-mode java-snippets helm-projectile helm-gitignore helm-descbinds helm-company helm-ag haskell-mode handlebars-mode gnuplot gitconfig-mode ggtags general fortune-cookie flycheck f evil-visualstar evil-surround evil-snipe evil-smartparens evil-matchit evil-escape evil-easymotion evil-commentary evil-anzu electric-spacing dtrt-indent dockerfile-mode docker demangle-mode csharp-mode crontab-mode company-c-headers color-theme-solarized cmake-mode bison-mode auto-compile ag adaptive-wrap ace-window spaceline pyenv-mode)))
 '(split-height-threshold nil)
 '(split-width-threshold 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; anzu
(use-package anzu
  :commands (isearch-foward isearch-backward)
  :config (global-anzu-mode))

;; company "complete anything"
(use-package company
  :diminish company-mode
  :commands (company-complete company-mode)
  :config
  (use-package company-c-headers)
  (push '(company-clang
          :with company-semantic
          :with company-yasnippet
          :with company-c-headers)
        company-backends))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous))


;; automatic demangling
(use-package demangle-mode
  :commands demangle-mode)

;; dtrt
(use-package dtrt-indent
  :load-path "site-lisp/dtrt-indent"
  :config
  (dtrt-indent-mode)
  (setq dtrt-indent-min-quality 60
        dtrt-indent-verbosity 3))

;; electric spacing
(use-package electric-spacing
  :commands electric-spacing-mode)

;; flycheck
(use-package flycheck
  :diminish flycheck-mode
  :init (global-flycheck-mode))

;; flyspell - use aspell instead of ispell
(use-package flyspell
  :commands (flyspell-mode flyspell-prog-mode)
  :config (setq ispell-program-name (executable-find "aspell")
                ispell-extra-args '("--sug-mode=ultra")))


;; ggtags
(use-package ggtags
  :commands ggtags-mode
  :diminish ggtags-mode
  :config
  (general-define-key
   :keymaps 'ggtags-mode-map
   :states '(normal)
   "g d" 'helm-gtags-dwim)
  (use-package helm-gtags
    :commands (helm-gtags-dwim)
    :config (helm-gtags-mode)))


;; magit
(use-package magit
  :commands (magit-status projectile-vc)
  :config
  (use-package evil-magit)
  (add-to-list 'magit-log-arguments "--no-abbrev-commit")
  (setq magit-popup-use-prefix-argument 'default
        magit-completing-read-function 'magit-ido-completing-read))

(global-git-commit-mode)

;; popwin
(use-package popwin
  :config (popwin-mode))

;; regex tool
(use-package regex-tool
  :commands (regex-tool))

;; save kill ring
(use-package savekill)

;; saveplace
(use-package saveplace
  :config
  (setq-default save-place t
                save-place-file (f-expand "saved-places" user-emacs-directory)))
;; scratch
(use-package scratch
  :commands (scratch))

;; slime
(use-package sly
  :commands (sly)
  :config (setq inferior-lisp-program (executable-find "sbcl")))


;; tramp
(use-package tramp
  :config
  (setq tramp-verbose 9
        tramp-default-method "ssh"
        tramp-ssh-controlmaster-options
        (concat "-o ControlPath=/tmp/tramp.%%r@%%h:%%p "
                "-o ControlMaster=auto "
                "-o ControlPersist=no")))

;; try
(use-package try
  :commands try)

;; undo-tree
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-history-directory-alist
        `(("." . ,(f-expand "undo-tree" user-emacs-directory)))
        undo-tree-auto-save-history t))

;; unfill autofill
(use-package unfill
  :commands (unfill-region unfill-paragraph toggle-fill-unfill))

;; uniquify
(use-package uniquify
  :ensure nil
  :config (setq uniquify-buffer-name-style 'forward))

;; which-key
(use-package which-key
  :diminish which-key-mode
  :config (which-key-mode))

;; whitespace
(use-package whitespace
  :commands (whitespace-mode)
  :config
  (setq whitespace-style '(face tabs spaces newline empty
                                trailing tab-mark newline-mark)))

(use-package whitespace-cleanup-mode
  :diminish whitespace-cleanup-mode
  :init (global-whitespace-cleanup-mode))

;; yasnippet
(use-package yasnippet
  :commands (yas-expand yas-insert-snippet)
  :config
  (use-package java-snippets)
  (yas-minor-mode))

;;; syntax support
;; mode mappings
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.vcsh\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'magic-mode-alist '(";;; " . emacs-lisp-mode))

;; bison
(use-package bison-mode
  :mode ("\\.y\\'" "\\.l\\'"))

;; CMake
(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

;; crontab
(use-package crontab-mode
  :mode "\\.cron\\(tab\\)?\\'")

;; C styles
(c-add-style "work"
             '("bsd"
               (c-basic-offset . 4)
               (c-offsets-alist . ((arglist-intro . +)))))

(add-to-list 'c-default-style '(c-mode . "work"))
(add-to-list 'c-default-style '(c++-mode . "work"))
(add-to-list 'c-default-style '(csharp-mode . "c#"))

;; git modes
(use-package gitattributes-mode
  :disabled t)
(use-package gitconfig-mode
  :mode ("/\\.gitconfig\\'" "/\\.git/config\\'" "/git/config\\'" "/\\.gitmodules\\'"))
(use-package gitignore-mode
  :mode ("/\\.gitignore\\'" "/\\.git/info/exclude\\'" "/git/ignore\\'"))

;; handlebars
(use-package handlebars-mode
  :mode ("\\.handlebars$" "\\.hbs$"))

;; json
(use-package json-mode
  :mode "\\.json$"
  :config (setq js-indent-level 4))

;; ledger
(use-package ledger-mode
  :mode "\\.ledger\\'"
  :config
  (define-key ledger-mode-map (kbd "C-c c") 'ledger-mode-clean-buffer)
  (setq ledger-post-amount-alignment-at :decimal
        ledger-post-amount-alignment-column 49
        ledger-clear-whole-transactions t)
  (use-package flycheck-ledger))

;; less-css
(use-package less-css-mode
  :mode "\\.less\\'")

;; markdown
(use-package markdown-mode
  :mode ("\\.markdown\\'" "\\.mk?d\\'" "\\.text\\'")
  :init
  (evil-define-key 'normal markdown-mode-map
    (kbd "g d") 'markdown-jump
    (kbd "g x") 'markdown-follow-link-at-point))

;; matlab
(use-package matlab-mode
  :mode "\\.m$")

;; nginx
(use-package nginx-mode
  :mode ("nginx.conf$" "/etc/nginx/.*"))
;; packages used in init
(use-package page-break-lines)
(use-package dashboard)

;; Powerline
(use-package spaceline-config
  :ensure spaceline
  :config
(spaceline-spacemacs-theme))

(use-package ranger
  :ensure t
  :defer t
  :commands (ranger)
  :config
  (require 'cl-lib)
  (setq ranger-cleanup-eagerly t)
  (setq ranger-show-hidden nil)
  )
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package dash)
(use-package f)

;;; system specific packages
;; load Linux configuration
(use-package linux
  :ensure nil
  :load-path "lisp/"
  :if (eq system-type 'gnu/linux))

;;; load local settings
(use-package local
  :ensure nil
  :load-path "site-lisp/")

(use-package auto-compile
  :defer t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package ace-window
  :bind (([remap next-multiframe-window] . ace-window))
  :config
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;;; files
;; backups
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 4
      kept-old-versions 2
      version-control t
      backup-directory-alist `(("." . ,(f-expand
                                        "backups" user-emacs-directory))))
;; 100 MB
(setq large-file-warning-threshold (* 100 1000 1000))

;; recent files
(setq recentf-max-saved-items 256
      recentf-max-menu-items 16)
(recentf-mode)

;; set auto revert of buffers if file is changed externally
(global-auto-revert-mode)

;; symlink version-control follow
(setq vc-follow-symlinks t)

;; dired
(setq dired-dwim-target t ; enable side-by-side dired buffer targets
      dired-recursive-copies 'always ; better recursion in dired
      dired-recursive-deletes 'top
      dired-listing-switches "-lahp")

;; compilation
(setq compilation-ask-about-save nil
      compilation-always-kill t)
