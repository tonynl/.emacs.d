

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-cc-mode.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: cc-mode
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(require 'cc-mode)

;; create a face for function calls in C-mode
(add-hook 'c-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(\\sw+\\) ?(" 1 font-lock-function-name-face)) t))) 

(add-hook 'c++-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(\\sw+\\) ?(" 1 font-lock-function-name-face)) t))) 

;; turn on auto newline and hungry delete for cc-mode
(add-hook 'c-mode-hook (lambda () (c-toggle-auto-hungry-state 1)))
(add-hook 'c++-mode-hook (lambda () (c-toggle-auto-hungry-state 1)))

;; Load imenu menubar
(add-hook 'c-mode-hook (lambda () (imenu-add-menubar-index)))
(add-hook 'c++-mode-hook (lambda () (imenu-add-menubar-index)))

;; To cause the *compilation* buffer to automatically scroll to the end of new output
(setq compilation-scroll-output t)


;;---------------------------------------- NEW ---------------------------;;

(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)

;; C++ function definitions in a header file are expanded to definitions
;; in acorresponding source file
(require 'member-functions)
(setq mf--source-file-extension "cpp")
