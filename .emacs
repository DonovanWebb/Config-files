
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;;;Normal settings
(setq-default redisplay-dont-pause t)
(setq-default visible-cursor nil)
(setq line-spacing 0)
(blink-cursor-mode 1)
(setq-default cursor-in-non-selected-windows nil)
(menu-bar-mode 0)
(setq-default line-spacing 0)
(tool-bar-mode -1)  ; turn off tool-bar
(scroll-bar-mode -1)  ; turn off scroll-bar
(fringe-mode 0)  ; turn off fringe
(tooltip-mode nil)  ; turn off tool-tip
(setq-default show-help-function nil)  ; turn off help messages
(setq-default use-dialog-box nil)
(add-to-list 'default-frame-alist '(font . "Terminus-20"))

;; Enable a color theme
(load-theme 'moe-dark t)

;;; Clipboard
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;;; helm
(package-install 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-mini)

;;; company
(semantic-mode 0)
(package-install 'company)
(require 'company)
(setq company-tooltip-align-annotations t)
(add-hook 'after-init-hook 'global-company-mode)

;;; Folding
(require 'origami)
(global-origami-mode 1)
(add-hook 'latex-mode-hook
          (lambda () (setq-local origami-fold-style 'triple-braces)))


;;; flycheck
(require 'flycheck)
(setq flycheck-python-flake8-executable "flake8")
(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; python
(setq py-python-command "python3")

;;; ace jump mode
(package-install 'ace-jump-mode)
(require 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; Powerline
;;;(require 'powerline)
;;;(require 'powerline-evil)

;;; Movement
;;;(package-install 'ace-jump-mode)
;;;(require 'ace-jump-mode)
;;;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
;;;(define-key evil-visual-state-map (kbd "SPC") 'ace-jump-mode)
;;;(define-key evil-normal-state-map (kbd ", w") 'ace-jump-char-mode)
;;;(define-key evil-normal-state-map (kbd ", c") 'ace-jump-char-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (dired-subtree pdf-tools emms boron-theme shx flycheck ace-jump-mode company auto-complete helm undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(transparency 100)

(winner-mode t)

;; dired

(require 'dired-subtree)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "<tab>") #'dired-subtree-toggle)
             (local-set-key (kbd "<backtab>") #'dired-subtree-cycle)))
