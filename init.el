;; Emacs Configuration
;; Author:  Michael Riley (michael@michael-riley.com)
;; Created: 18 Aug 2020

(setq inhibit-startup-screen t)     ;; Don't display the startup screen.
(setq initial-scratch-message nil)  ;; Don't display a message in the scratch buffer.
(setq ring-bell-function 'ignore)   ;; Silence is bliss.
(setq linum-format "%3d ")          ;; Set format for line numbers.
(setq resize-mini-windows t)        ;; Dynamically resize the minibuffer to fit the text currently displayed.

(setq-default indent-tabs-mode nil) ;; Use spaces not tabs.
(setq-default fill-column 155)      ;; Break the line at column 155 when using Auto Fill mode.

(load-theme 'wombat)

(if (fboundp 'scroll-bar-mode)      ;; Disable the vertical scroll bar.
    (scroll-bar-mode -1))

(if (fboundp 'tool-bar-mode)        ;; Disable the tool bar.
    (tool-bar-mode -1))

(if (fboundp 'set-fringe-mode)      ;; No left fringe, default width for right fringe.
    (set-fringe-mode '(0 . nil)))

(menu-bar-mode -1)                  ;; Disable the menu bar.

(column-number-mode)                ;; Display the column number in the mode line.
(show-paren-mode)                   ;; Hilight matching parenthesis.
(save-place-mode)                   ;; Restore point to its previous location when visiting a file.
(recentf-mode)                      ;; Enable Recentf Mode.

(require 'dired-x)                  ;; Needed to make the C-x C-j binding to dired-jump available.

;; Perform macOS specific customisations.
(when (eq system-type 'darwin)
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'none)
  (set-frame-font "-*-Courier New-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))

;; Configure the backup system.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backup"))))

;; Configure CC Mode.
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (linum-mode))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; Configure Ido Mode.
(ido-mode 1)                        ;; Enable Ido Mode.
(setq ido-enable-flex-matching t)   ;; Enable flexible matching.

;; Configure Emacs Lisp mode.
(defun my-emacs-lisp-mode-hook ()
  (linum-mode)
  (setq truncate-lines t))

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

;; Configure Org mode.
(defun my-org-mode-hook ()
  (auto-fill-mode))

(add-hook 'org-mode-hook 'my-org-mode-hook)

;; Custom functions.
(defun mdr-find-recent-file ()
  "Find a recently visited file."
  (interactive)
  (let ((file-name (ido-completing-read "Find recent file: " recentf-list)))
    (find-file file-name)))

;; Configure the global key bindings.
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x C-r") 'mdr-find-recent-file)
