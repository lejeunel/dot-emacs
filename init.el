;;; init.el -*- lexical-binding: t; -*-

(let ((config-file (expand-file-name "config.el" user-emacs-directory)))
  (if (file-exists-p config-file)
      (load config-file nil 'nomessage)
    (warn "⚠️  Tangled config.el not found! Run your tangle script first.")))
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((elisp-lint-indent-specs (describe . 1) (it . 1) (thread-first . 0)
			      (cl-flet . 1) (cl-flet* . 1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
