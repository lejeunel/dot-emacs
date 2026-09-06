;;; early-init.el -*- lexical-binding: t; -*-
(setq package-enable-at-startup nil)

;;; disable white screen flash on GUI startup
(setq default-frame-alist '(
  (background-color . "#000000")
  (ns-appearance . dark)
  (ns-transparent-titlebar . t)))
