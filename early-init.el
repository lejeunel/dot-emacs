;;; early-init.el -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

(when initial-window-system
  (push '(background-color . "#000000") default-frame-alist))

  (setq frame-title-format '("%b"))

(setq xterm-extra-capabilities '(modifyOtherKeys getSelection setSelection))
