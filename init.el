(defun tangle-init ()
  "If the current buffer is 'init.org' the code-blocks are
tangled, and the tangled file is compiled."
  (when (equal (buffer-file-name)
               (expand-file-name (concat user-emacs-directory "init.org")))
    ;; Avoid running hooks when tangling.
    (let ((prog-mode-hook nil))
      (org-babel-tangle)
      (byte-compile-file (concat user-emacs-directory "init.el")))))

(add-hook 'after-save-hook 'tangle-init)

(require 'package)
(setq load-prefer-newer t
      package-enable-at-startup nil
      package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("stable-melpa" . "https://stable.melpa.org/packages/")
        ("myelpa" . "https://raw.githubusercontent.com/lejeunel/myelpa/master/"))
      package-archive-priorities
            '(("gnu" . 5)
              ("melpa"     . 0)
              ("myelpa"     . 10)
              ("stable-melpa"     . 0)
              ("org"     . 0)
              ("elpy"        . 0)))
(package-initialize nil)

(use-package exec-path-from-shell
  :custom
  (exec-path-from-shell-check-startup-files nil)
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
(exec-path-from-shell-initialize))

;;(require 'cl)
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

(use-package diminish
    :ensure t)

(setq elpamr-default-output-directory "~/myelpa")

(add-to-list 'load-path "~/.emacs.d/site-lisp/elpa-mirror")
(require 'elpa-mirror)

(use-package yasnippet
; autoload `yasnippet' when `yas-minor-mode' is called
; using any means: via a hook or by user
; Feel free to add more commands to this
; list to suit your needs.
    :diminish yas-minor-mode
    :general
  (:keymaps 'yas-minor-mode-map
  :states '(normal visual emacs)
  :prefix "SPC"
  "y" 'yas-insert-snippet)
  :commands (yas-minor-mode yas-exapand yas-insert-snippet)
  :init ; stuff to do before requiring the package
  (progn
    (add-hook 'python-mode-hook #'yas-minor-mode)
    (add-hook 'org-mode-hook #'yas-minor-mode)
    (add-hook 'inferior-python-mode-hook #'yas-minor-mode))
  ;;(progn
  ;;  )
  :config ; stuff to do after requiring the package
  (progn
    (yas-reload-all)
    (add-to-list 'yas-snippet-dirs "$HOME/.emacs.d/snippets")
    (add-to-list 'yas-snippet-dirs "$HOME/.emacs.d/yasnippet-snippets"))
    (yas-global-mode t))

(setq evil-want-C-i-jump nil)

(use-package evil
  :defines evil-disable-insert-state-bindings
  :init
(progn
    (evil-mode t)
    (setq evil-want-fine-undo 'no
            evil-want-C-u-scroll t
            evil-want-C-d-scroll t
            evil-symbol-word-search t
            evil-cross-lines t
            evil-disable-insert-state-bindings t)
            (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
        (define-key Info-mode-map "g" nil)
    (use-package evil-org
    :init (add-hook 'org-mode-hook 'evil-org-mode)
    :diminish evil-org-mode
    :config  (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))))
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
      (setq highlight-indent-guides-method 'column))
    :diminish highlight-indent-guides-mode)
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
      

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

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
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


(use-package evil-anzu)

(use-package evil-commentary
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(use-package undo-tree
    :diminish undo-tree-mode
    :init (global-undo-tree-mode))

(use-package ediff
  :ensure nil
  :defer t
  :config (use-package evil-ediff))

(use-package evil-escape
  :diminish evil-escape-mode
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "jk")
)

(use-package evil-matchit
  :config (global-evil-matchit-mode))

(use-package evil-snipe
  :diminish evil-snipe-mode
  :init (evil-snipe-mode)
  :config
  (setq evil-snipe-smart-case t)
)

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
   "M-y" 'helm-show-kill-ring))

;; projectile
(use-package projectile
  :ensure projectile
  :diminish projectile-mode
  :init

    (use-package helm-projectile
    :ensure t
    :general
        (:keymaps 'projectile-mode-map
        :states '(normal visual emacs)
        :prefix "SPC"
        :which-key "projectile"
        "pf" 'helm-projectile-find-file
        "pb" 'projectile-compile-project
        "pi" 'projectile-invalidate-cache
        "pa" 'helm-projectile-ag
        "pg" 'helm-projectile-grep
        "ps" 'helm-projectile-switch-project))
  :config
  (setq projectile-enable-caching t
        projectile-mode t
        projectile-completion-system 'helm
        projectile-switch-project-action 'helm-projectile)
  (projectile-mode)
  )

(use-package helm
  :ensure helm
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
  :init (progn
               (require 'helm-config)
               (helm-mode t)

                (use-package helm-themes   :ensure t :defer 5)
                (use-package helm-ag
                    :commands (helm-ag)
                    :config
                    ;; fix https://github.com/bbatsov/projectile/issues/837
                    (setq grep-find-ignored-files nil
                            grep-find-ignored-directories nil))
                (use-package helm-descbinds
                :config (helm-descbinds-mode))

                (use-package helm-gitignore)))

(setq-default frame-title-format '("%b"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:background "#282a36" :foreground "sky blue" :box nil)))))

(setq myfont "Hack")
(cond
((string-equal system-name "multichouette")
  (set-face-attribute 'default nil :font myfont :height 130))
((string-equal system-name "tc")
  (set-face-attribute 'default nil :font myfont :height 164)))

(use-package airline-themes
:init
(progn
    (require 'airline-themes)
    (load-theme 'airline-doom-one t))
:config
(progn
    (set-face-attribute 'mode-line          nil :font "Fira Mono for Powerline")
    (set-face-attribute 'mode-line-inactive nil :font "Fira Mono for Powerline")
    (setq powerline-utf-8-separator-left        #xe0b0
        powerline-utf-8-separator-right       #xe0b2
        airline-utf-glyph-separator-left      #xe0b0
        airline-utf-glyph-separator-right     #xe0b2
        airline-utf-glyph-subseparator-left   #xe0b1
        airline-utf-glyph-subseparator-right  #xe0b3
        airline-utf-glyph-branch              #xe0a0
        airline-utf-glyph-readonly            #xe0a2
airline-utf-glyph-linenumber #xe0a1)))

(use-package doom-themes
:init
;;(load-theme 'doom-dracula t)
(load-theme 'doom-one t)
:config
(progn
    (doom-themes-neotree-config)

(doom-themes-org-config)))
(global-linum-mode t)
(global-visual-line-mode 1)
(diminish 'visual-line-mode)
(diminish 'hi-lock-mode)
(diminish 'evil-snipe-local-mode)

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
    :config (adaptive-wrap-prefix-mode)
    :diminish adaptive-wrap-prefix-mode
)

    ;; which-key
    (use-package which-key
    :diminish which-key-mode
    :config (which-key-mode))

(defun my/zoom-in ()
"Increase font size by 10 points"
(interactive)
(set-face-attribute 'default nil
                    :height
                    (+ (face-attribute 'default :height)
                        10)))

(defun my/zoom-out ()
  "Decrease font size by 10 points"
  (interactive)
  (set-face-attribute 'default nil
                      :height
                      (- (face-attribute 'default :height)
                         10)))
                         
(require 'hydra) ;; this fixes a bug...
(use-package hydra
  :ensure t
  :defer t)
      
(defhydra hydra-zoom()
"zoom"
  ("g" my/zoom-in)
  ("l" my/zoom-out))

;; org mode extensions

(use-package org
  :general
  (:keymaps 'org-mode-map
    :states '(normal insert emacs)
    :major-mode 'org-mode
    :prefix "SPC"
    :non-normal-prefix "M-SPC"
    :which-key "org"
    "me" 'org-export-dispatch
    "mo" 'org-open-at-point
    "mc" 'org-ref-helm-insert-cite-link)
  :config
  
 (setq org-agenda-files '("~/ownCloud/org/agenda" "~/Documents/paper-notes/notes.org")) 

  ;;where to save todo items
  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 1))))
  
  ;;skips highest priority for custom agenda view
  (defun my-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.
    PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))
      
  (defun my-pop-to-org-agenda ()
    "Visit the org agenda, in the current window or a SPLIT."
    (interactive)
    (org-agenda nil "c"))      
      
  ;;set priority range from A to C with default A
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?C)
  (setq org-default-priority ?A)
  
  ;;org custom agenda
  (setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags-todo "PRIORITY=\"A\"\LEVEL>1" 
                ((org-agenda-files '("~/ownCloud/org/agenda/tasks.org")) 
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo ""
                   ((org-agenda-skip-function
                     '(or (my-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))
 


  ;;(setq-default org-display-custom-times t)
  ;;(setq org-time-stamp-custom-formats '("<%d-%m-%Y %a>" . "<%d-%m-%Y %a %H:%M>")) 
  ;;open agenda in current window
  (setq org-agenda-window-setup (quote current-window))
  (setq org-capture-templates
  '(("t" "todo" entry (file+headline "~/ownCloud/org/agenda/tasks.org" "Tasks")
         "* TODO [#A] %? \n %T")
    ("m" "meeting" entry (file+headline "~/ownCloud/org/agenda/agenda.org" "Meetings")
    "* %? \n %T")
    ("d" "deadline" entry (file+headline "~/ownCloud/org/agenda/agenda.org" "Deadlines")
    "* TODO %? \n DEADLINE: %T")
    ("n" "note" entry (file+headline "~/ownCloud/org/agenda/notes.org" "Notes")
    "* %? \n %T")
))
)

;; PDFs visited in Org-mode are opened in Evince (and not in the default choice) https://stackoverflow.com/a/8836108/789593
(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(general-define-key :states '(normal emacs)
                    :major-mode 'org-agenda-mode
                    :keymaps 'org-agenda-mode-map
                    "k" 'org-agenda-previous-line
                    "j" 'org-agenda-next-line
                    "C-k" 'org-priority-down
                    "C-j" 'org-priority-up
                    "S-k" 'org-timestamp-down
                    "S-j" 'org-timestamp-up
                    "j" 'org-agenda-next-line
                    "c" 'org-capture)
                    
(setq org-reveal-root "~/.dotfiles/reveal.js/")
(setq org-reveal-mathjax t)
(setq org-src-fontify-natively t)

(menu-bar-mode -1)

(use-package exec-path-from-shell
  :disabled (not (equal system-type 'darwin))
  :config
  (progn
    ;; For debugging
    (when nil
      (message "path: %s, setup: %s" (getenv "PATH")
               (getenv "ENVIRONMENT_SETUP_DONE"))
      (setq exec-path-from-shell-debug t))
    (setq exec-path-from-shell-arguments (list "-l"))
    (setq exec-path-from-shell-check-startup-files nil)
    (add-to-list 'exec-path-from-shell-variables "SHELL")
    (add-to-list 'exec-path-from-shell-variables "GOPATH")
    (add-to-list 'exec-path-from-shell-variables "ENVIRONMENT_SETUP_DONE")
    (add-to-list 'exec-path-from-shell-variables "PYTHONPATH")
    (exec-path-from-shell-initialize)))

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
  (setq elpy-rpc-backend "jedi")
  
  (eval-when-compile
      (defvar python-master-file))
  (defun python-rerun-master-file ()
    (interactive)
    (python-switch-to-master-file)
    (elpy-shell-send-region-or-buffer))

  (defun python-run-master-file ()
    (interactive)
    (python-switch-to-master-file)
    (elpy-shell-send-region-or-buffer))

  (defun python-set-master-file ()
    (interactive)
    (setq python-master-file (buffer-name))
    (message "Set this buffer as python master file"))

  (defun python-switch-to-master-file ()
    (interactive)
    (switch-to-buffer python-master-file))

  (defun python-add-breakpoint ()
    "Add a break point"
    (interactive)
    (evil-open-above 1)
    (insert "import pdb; pdb.set_trace()")
    (evil-escape)
    (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))

      :diminish elpy-mode

)

  (defun ha/elpy-goto-definition ()
    (interactive)
    (condition-case err
        (elpy-goto-definition)
      ('error (xref-find-definitions (symbol-name (symbol-at-point))))))

(use-package pyenv-mode
  :defer t
  :ensure t
  :init 
    (add-to-list 'exec-path "~/.pyenv/shims")
    (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
    (pyenv-mode)
    (defun projectile-pyenv-mode-set ()
      "Set pyenv version matching project name."
      (let ((project (projectile-project-name)))
        (if (member project (pyenv-mode-versions))
            (pyenv-mode-set project)
          (pyenv-mode-unset))))

    (add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
    (add-hook 'python-mode-hook 'pyenv-mode))

 (use-package jedi
  :ensure t
  :init
  (setq company-jedi-python-bin "~/.pyenv/shims/python")
  :config
  (use-package company-jedi
    :ensure t
    :init
    (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
    (setq company-jedi-python-bin "python")))   



(use-package python
  :defer t
  :general
  (:keymaps '(python-mode-map inferior-python-mode-map)
    :states '(normal visual emacs)
    :major-mode '(python-mode inferior-python-mode)
    :prefix "SPC"
    :which-key "Python"
    "mv" 'pyenv-mode-set
    "mb" 'elpy-shell-send-region-or-buffer
    "mq" 'elpy-kill-all
    "ms" 'python-set-master-file
    "mm" 'python-switch-to-master-file
    "mr" 'python-run-master-file
    "md" 'python-add-breakpoint
    "mg" 'elpy-goto-definition
    "mf" 'elpy-yapf-fix-code
    "mh" 'elpy-doc
    "mi" 'run-python)
    :config
      (setq python-indent-offset 4)
      (elpy-enable)
        (add-hook 'python-mode-hook
        (lambda ()
            (setq flycheck-python-pylint-executable "/usr/bin/pylint")
            (setq tab-width 4)
            (setq flycheck-pylintrc "~/.pylintrc")))

)

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

(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

(use-package rtags
  :ensure t
  :general
  (:keymaps '(c-mode-map c++-mode-map)
    :states '(normal visual emacs)
    :major-mode '(c-mode c++-mode-map)
    :prefix "SPC"
    :which-key "C/C++"
    "ms" 'rtags-find-symbol-at-point
    "mr" 'rtags-find-references-at-point)
  :diminish rtags
  :config
  (progn
    (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
    (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

    (setq rtags-autostart-diagnostics t)
    (rtags-diagnostics)
    (setq rtags-completions-enabled t)
    (setq rtags-use-helm t)

    (use-package flycheck-rtags
      :ensure t
      :config
      (progn
	(defun my-flycheck-setup ()
	  (flycheck-select-checker 'rtags))
	(add-hook 'c-mode-hook #'my-flycheck-setup)
	(add-hook 'c++-mode-hook #'my-flycheck-setup))
      )
    (use-package company-rtags
      :ensure t
      :config
      (progn
    	(require 'company)
        (add-to-list 'company-backends 'company-rtags)
    	))
    )
)
(add-hook 'c-mode-common-hook #'setup-flycheck-rtags)

(use-package lua-mode
  :ensure t
  :mode (("\\.lua\\'" . lua-mode)))

(use-package tex
:ensure auctex
:general
(:keymaps 'LaTeX-mode-map
  :states '(normal emacs)
  :major-mode 'LaTeX-mode
  :prefix "SPC"
  :which-key "Latex"
    "mm" 'TeX-command-master
    "mv" 'TeX-command-run-all
    "mp" 'preview-at-point
  )
:init
(progn (add-hook 'LaTeX-mode-hook 'turn-on-reftex))
:config
(setq reftex-ref-macro-prompt nil)
(progn
  (use-package auto-complete
    :config
    (progn
      (ac-flyspell-workaround)
      (setq ac-auto-show-menu 0.01
            ac-auto-start 1
            ac-delay 0.01)))

  (use-package ispell
    :ensure t
    :config
    (progn
      (make-local-variable 'ispell-parser)
      (setq ispell-parser 'tex)))

  (use-package ac-ispell
    :ensure t
    :requires auto-complete ispell
    )

  (use-package writegood-mode
    :ensure t
    :config
    (writegood-mode))

  (use-package smartparens-latex
    :disabled t ;; Does not seem to be available
    :ensure t
    :config
    (smartparens-mode +1))

  (use-package ac-math
    :ensure t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq TeX-save-query nil)
(setq reftex-plug-into-AUCTeX t)))

(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init)
)

(use-package org-ref
:init

    (setq org-ref-bibtex-completion-actions
    (quote
        (("Edit notes" . helm-bibtex-edit-notes)
        ("Open PDF, URL or DOI" . helm-bibtex-open-any)
        ("Open URL or DOI in browser" . helm-bibtex-open-url-or-doi)
        ("Show entry" . helm-bibtex-show-entry)
        ("Insert citation" . helm-bibtex-insert-citation)
        ("Insert reference" . helm-bibtex-insert-reference)
        ("Insert BibTeX key" . helm-bibtex-insert-key)
        ("Insert BibTeX entry" . helm-bibtex-insert-bibtex)
        ("Insert formatted citation(s)" lambda
        (_)
        (insert
        (mapconcat
            (quote identity)
            (cl-loop for key in
                    (helm-marked-candidates)
                    collect
                    (org-ref-format-entry key))
            "

    ")))
        ("Attach PDF to email" . helm-bibtex-add-PDF-attachment)
        ("Add keywords to entries" . org-ref-helm-tag-entries)
        ("Copy entry to clipboard" . bibtex-completion-copy-candidate)
        ("Add PDF to library" . helm-bibtex-add-pdf-to-library))))
    :config
    (setq org-ref-bibliography-notes "~/Documents/paper-notes/notes.org"
        org-ref-default-bibliography '("~/Documents/paper-notes/refs.bib")
        org-ref-pdf-directory "~/ownCloud/papers/")
    (setq bibtex-completion-bibliography "~/Documents/paper-notes/refs.bib"
        bibtex-completion-library-path "~/ownCloud/papers"
        bibtex-completion-notes-path "~/Documents/paper-notes/notes.org")
    (setq bibtex-completion-notes-template-one-file
      (format
      "\n** ${author} (${year}): ${title} [cite:${key}]\n  :PROPERTIES:\n  :Custom_ID: \n  :END:\n"))
    (helm-delete-action-from-source "Edit notes" helm-bibtex-edit-notes)
    (helm-add-action-to-source "Edit notes" 'bibtex-completion-edit-notes helm-bibtex-edit-notes 0)
)
        
(use-package reftex
  :diminish reftex-mode
  :commands turn-on-reftex
  :init
  (progn
  (setq reftex-plug-into-AUCTeX t))
  (setq reftex-default-bibliography '("~/Documents/litteratureReview/refs.bib"))
  :config
  (general-define-key
   :keymaps 'LaTeX-mode-map
    :states '(normal emacs)
    :major-mode 'LaTeX-mode
    :prefix "SPC"
    :which-key "Latex"
   "mrc" 'helm-bibtex-with-local-bibliography
   "mrg"    'reftex-grep-document
   "mri"    'reftex-index-selection-or-word
   "mrI"    'reftex-display-index
   "mr TAB" 'reftex-index
   "mrl"    'reftex-label
   "mrp"    'reftex-index-phrase-selection-or-word
   "mrP"    'reftex-index-visit-phrases-buffer
   "mrr"    'reftex-reference
   "mrt"    'reftex-toc
   "mrT"    'reftex-toc-recenter
   "mrv" 'reftex-view-crossref)
  (reftex-mode))

(which-key-add-key-based-replacements
    "SPC mr" "reftex"
 )

;Single escape to exit "everything"
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

(general-define-key
 :states '(normal visual)
 :prefix "SPC"
       "ff" 'helm-find-files ; save windows layout
       "fs" 'save-buffer
       "tw" 'whitespace-mode
       "qr" 'restart-emacs
       "wf" 'make-frame-command
       "wv" 'split-window-right
       "wf" 'split-window-fairly
       "wd" 'delete-window
       "TAB" 'ace-window
       "s" 'ace-swap-window
       "b" 'helm-mini
       "x" 'kill-this-buffer
       "r" 'ranger
       "z" 'hydra-zoom/body
       "af" 'ag-dired
       "as" 'helm-ag-project-root
        "hb" 'describe-bindings
        "hv" 'describe-variable
        "hf" 'describe-function
        "hp" 'describe-package
        "oa" 'my-pop-to-org-agenda
        "oc" 'org-capture
        "os" 'org-store-link
        "ol" 'org-insert-link
        "or" 'org-refile
        "us" 'purpose-save-window-layout
        "ul" 'purpose-load-window-layout
        "ur" 'purpose-reset-window-layout
  )

  (which-key-add-key-based-replacements
      "SPC gt" "git timemachine"
      "SPC g" "git"
      "SPC f" "file"
      "SPC a" "ag"
      "SPC h" "help"
      "SPC t" "toggle"
      "SPC b" "buffer"
      "SPC w" "window"
      "SPC m" "major-mode"
  )

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
 '(custom-safe-themes (quote (default)))
 '(evil-symbol-word-search t)
 '(exec-path-from-shell-check-startup-files nil)
 '(package-selected-packages
   (quote
    (org-ref evil-collection iflibp buffer-stack hlinum rainbow-delimiters rainbow-delimiters-mode dashboard page-break-lines window-purpose dedicated latex-mode latex tex git-timemachine ranger elpy evil-magit znc yaml-mode whitespace-cleanup-mode which-key virtualenvwrapper use-package unfill try toml-mode ssh-config-mode smooth-scroll sly scratch savekill rust-mode regex-tool puppet-mode processing-mode powershell powerline popwin pkgbuild-mode nginx-mode matlab-mode markdown-mode magit less-css-mode ledger-mode org-plus-contrib java-snippets helm-gitignore helm-descbinds helm-company helm-ag haskell-mode handlebars-mode gnuplot gitconfig-mode ggtags general fortune-cookie flycheck f evil-visualstar evil-surround evil-snipe evil-smartparens evil-matchit evil-escape evil-easymotion evil-commentary evil-anzu electric-spacing dtrt-indent dockerfile-mode docker demangle-mode csharp-mode company-c-headers cmake-mode bison-mode auto-compile ag adaptive-wrap ace-window pyenv-mode)))
 '(split-height-threshold nil)
 '(split-width-threshold 0))

(use-package restart-emacs
    :ensure t)

;; yaml
(use-package yaml-mode
:mode "\\.ya?ml\'")

;; anzu
(use-package anzu
:commands (isearch-foward isearch-backward)
:config (global-anzu-mode)
:diminish anzu-mode
)

(use-package company
:diminish company-mode
:commands (company-complete company-mode)
:config
  (use-package company-c-headers))

(with-eval-after-load 'company
(global-company-mode)
(define-key company-active-map (kbd "C-j") #'company-select-next)
(define-key company-active-map (kbd "C-k") #'company-select-previous))

(use-package helm-company
  :ensure t
  :config
  (general-define-key
  :states '(insert)
  "TAB" 'helm-company))

(setq company-backends
      '((company-files          ; files & directory
        company-keywords       ; keywords
        company-capf
        company-jedi
        company-yasnippet
        )
        (company-abbrev company-dabbrev)
))

;; automatic demangling
(use-package demangle-mode
:commands demangle-mode)

(use-package dtrt-indent
:ensure t
:commands dtrt-indent-mode
:diminish dtrt-indent-mode
:defer 3
:config
(progn
(dtrt-indent-mode 1)
(setq global-mode-string (--remove (eq it 'dtrt-indent-mode-line-info) global-mode-string))))

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
:diminish '(ggtags-mode helm-gtags-mode)
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
  :general
  (:states '(normal visual emacs)
  :prefix "SPC"
  :which-key "Magit"
  "gs" 'magit-status
  "gf" 'with-editor-finish
  "gtt" 'git-timemachine-toggle
  "gtn" 'git-timemachine-show-next-revision
  "gtp" 'git-timemachine-show-previous-revision
  "gtq" 'git-timemachine-quit
)
  :config
  (use-package evil-magit)
  (add-to-list 'magit-log-arguments "--no-abbrev-commit")
  (setq magit-popup-use-prefix-argument 'default))

(global-git-commit-mode)

;; git
(use-package git-timemachine)

;; popwin
(use-package popwin
:config (popwin-mode))

;; save kill ring
(use-package savekill)

;; scratch
(use-package scratch
:commands (scratch))

;; slime
(use-package sly
:commands (sly)
:config (setq inferior-lisp-program (executable-find "sbcl")))

(use-package ranger
:ensure t)

(use-package ace-window
:ensure t)

(use-package dashboard
  :preface
    (defun my/dashboard-banner ()
    """Set a dashboard banner including information on package initialization
    time and garbage collections."""
    (setq dashboard-banner-logo-title
            (format "Emacs ready in %.2f seconds with %d garbage collections."
                    (float-time (time-subtract after-init-time before-init-time)) gcs-done)))
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'my/dashboard-banner)
  :config
  (setq dashboard-startup-banner 'logo)
  
  (setq dashboard-items '((recents . 5) (bookmarks . 5) (projects . 5) (agenda . 5)))
  (dashboard-setup-startup-hook))

(use-package iflipb
:general
(
:states '(normal)
:config
  (defun swap-buffer-window ()
    "Put the buffer from the selected window in next window, and vice versa"
    (interactive)
    (let* ((this (selected-window))
      (other (next-window))
      (this-buffer (window-buffer this)))
      (set-window-buffer other this-buffer)
      (iflipb-next-buffer 1) ;;change current buffer
      (other-window 1) ;;swap cursor to new buffer
      )
   )

:prefix "SPC"
"k" 'iflipb-next-buffer
"j" 'iflipb-previous-buffer
"d" 'swap-buffer-window))

(setq iflipb-ignore-buffers '("magit" "^[*]"))

(use-package cmake-mode
  :mode (("/CMakeLists\\.txt\\'" . cmake-mode)
("\\.cmake\\'" . cmake-mode)))

(use-package window-purpose
    :ensure t
    :diminish purpose-mode
    :init
        (purpose-mode)
        (purpose-compile-user-configuration) ; activates your changes
    :config
        (add-to-list 'purpose-user-mode-purposes '(python-mode . py))
        (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
        (purpose-compile-user-configuration))
