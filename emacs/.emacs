
(setq inhibit-splash-screen t)

(tool-bar-mode 0)

(setq make-backup-files nil)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

(add-to-list 'load-path "~/.emacs.d")

;; Ask for confirmation before quitting Emacs
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

;; Show trailing whitespaces
(add-hook 'python-mode-hook (lambda() (setq show-trailing-whitespace t)))

;; y or n only please
(fset 'yes-or-no-p 'y-or-n-p)

;; org mode looks interesting
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(save-place t nil (saveplace))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#222222" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Ubuntu"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "yellow" :weight bold))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "Cyan" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "green")))))


;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Column counts please
(column-number-mode t)

;; Making a better python IDE
(load-library "py-settings")
