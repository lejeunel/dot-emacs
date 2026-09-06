;;; init.el -*- lexical-binding: t; -*-

(let ((config-file (expand-file-name "config.el" user-emacs-directory)))
  (if (file-exists-p config-file)
      (load config-file nil 'nomessage)
    (warn "⚠️  Tangled config.el not found! Run your tangle script first.")))
