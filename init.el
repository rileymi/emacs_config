;; Emacs Configuration
;; Author:  Michael Riley (michael@michael-riley.com)
;; Created: 18 Aug 2020

(setq inhibit-startup-screen t)     ;; Don't display the startup screen.
(setq initial-scratch-message nil)  ;; Don't display a message in the scratch buffer.
(setq ring-bell-function 'ignore)   ;; Silence is bliss.

(setq-default indent-tabs-mode nil) ;; Use spaces not tabs.

(load-theme 'wombat)

(if (fboundp 'scroll-bar-mode)      ;; Disable the vertical scroll bar.
    (scroll-bar-mode -1))

(if (fboundp 'tool-bar-mode)        ;; Disable the tool bar.
    (tool-bar-mode -1))

(menu-bar-mode -1)                  ;; Disable the menu bar.

(column-number-mode)                ;; Display the column number in the mode line.
(show-paren-mode)                   ;; Hilight matching parenthesis.
(save-place-mode)                   ;; Restore point to its previous location when visiting a file.

;; Perform macOS specific customisations.
(when (eq system-type 'darwin)
   (setq ns-command-modifier 'meta)
   (setq ns-alternate-modifier 'none)
   (set-frame-font "-*-Courier New-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))

;; Configure the backup system.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backup"))))

;; Configure the global key bindings.
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
