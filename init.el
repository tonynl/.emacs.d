

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: Emacs configuration startup file.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set system environment variables
;;
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Library Paths
;; Note: Keep every emacs library underneath ~/.emacs.d and 
;;   shun loading them from the system paths. This makes it 
;;   easier to use this config on multiple systems.

;(push "~/.emacs.d" load-path)
;; recursively add the sub-directories to load-path
(let ((default-directory "~/.emacs.d/elpa_unavailable/"))
  (normal-top-level-add-subdirs-to-load-path))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; set init file for custom settings
;;
(setq custom-file "~/.emacs.d/rc/rc-emacs-custom.el")
(load custom-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load RCs
;;

;; elpa package management
(load "~/.emacs.d/rc/rc-elpa.el")

;; --------------NOT IN USE--------------
;; Standalone CEDET has to be loaded and built-in CEDET has to be unloaded before CEDET used by others (el-get).
;;(load "~/.emacs.d/rc/rc-cedet.el") ;; CEDET devel version from bzr
;; --------------NOT IN USE--------------

;; basic preferences
(load "~/.emacs.d/rc/rc-emacs-pref.el")  ;; Emacs Preferences
(load "~/.emacs.d/rc/rc-key-bindings.el")  ;; key bindings
(load "~/.emacs.d/rc/rc-decor.el")  ;; fonts, color-theme, font zoom, etc.
(load "~/.emacs.d/rc/rc-server-windows.el") ;; Set up server mode on Windows.

;; buffer, window, file management
(load "~/.emacs.d/rc/rc-buffer-management.el") ;; iswitchb, ido, uniquify, tab bar for buffer management
(load "~/.emacs.d/rc/rc-desktop.el") ;; desktop package for saving buffer list and window management
(load "~/.emacs.d/rc/rc-dired.el") ;; dired, ibuffer, etc. for file management

;; small tools
(load "~/.emacs.d/rc/rc-swiss-knife.el")

;; big tools
(load "~/.emacs.d/rc/rc-auto-complete.el") ;; auto-complete
(load "~/.emacs.d/rc/rc-yasnippet.el")
(load "~/.emacs.d/rc/rc-pabbrev.el")
(load "~/.emacs.d/rc/rc-ecb.el")

;; mode configs
(load "~/.emacs.d/rc/rc-shell-mode.el") ;; shell-mode
(load "~/.emacs.d/rc/rc-text-mode.el") ;; text-mode
(load "~/.emacs.d/rc/rc-lisp-mode.el") ;; lisp-mode
(load "~/.emacs.d/rc/rc-cc-mode.el") ;; cc-mode
(load "~/.emacs.d/rc/rc-ess-mode.el") ;; ESS-mode
(load "~/.emacs.d/rc/rc-elpy.el") ;; python support by elpy
;; (load "~/.emacs.d/rc/rc-matlab-mode.el") ;; matlab-emacs make failed
(load "~/.emacs.d/rc/rc-css-mode.el") ;; css-mode


