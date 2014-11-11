;;; Nick's .emacs file.
;;; 
;;; THIS IS MY .EMACS FILE. THERE ARE MANY LIKE IT. THIS ONE IS MINE.
;;;
;;; Code:

;;; emacs basics
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(add-to-list 'load-path "~/.emacs.d/")
;(tool-bar-mode 0)

;; y or n only please
(fset 'yes-or-no-p 'y-or-n-p)

;;; key bindings
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x w") 'whitespace-mode)
;;; These are not working...
(global-set-key (kbd "C-<insert>") 'clipboard-kill-ring-save)
(global-set-key (kbd "<shift>-<insert>") ' clipboard-yank)
(global-set-key (kbd "<shift>-<delete>") 'clipboard-kill-region)
(global-set-key (kbd "C-<end>") 'end-of-buffer)
(setq x-select-enable-clipboard t)
;;; The next two prevent accidental closings on the mac
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "s-w"))

;;; Are we on a Mac? Lets restore some sanity
(when (memq window-system '(mac ns))
  (setq exec-path (append exec-path '("/usr/local/bin")))
  ;;; I prefer cmd key for meta
  (setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none))

;; Ask for confirmation before quitting Emacs
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

;; Show trailing whitespaces and leading tabs.
;; Whitespace mode.
(require 'whitespace)
;(setq whitespace-style
;  '(lines-tail tabs tab-mark trailing))
(setq show-trailing-whitespace t)
;(add-hook 'python-mode-hook (lambda() (setq show-trailing-whitespace t)))


;; org mode looks interesting
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Set a "different" default face for the eshell
(defun my-buffer-face-mode-courrier ()
    (interactive)
    (setq buffer-face-mode-face '(:family "Monospace" :height 100))
    (buffer-face-mode))
(add-hook 'eshell-mode-hook 'my-buffer-face-mode-courrier)
(add-hook 'compilation-mode-hook 'my-buffer-face-mode-courrier)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-auto-start nil)
 '(ac-disable-inline t)
 '(ac-show-menu-immediately-on-auto-complete t)
 '(column-number-mode t)
 '(save-place t nil (saveplace))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#222222" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "unknown" :family "Ubuntu"))))
 '(ac-candidate-face ((t (:background "lightgray" :foreground "black" :family "Ubuntu Monospace"))))
 '(ac-candidate-mouse-face ((t (:background "blue" :foreground "white" :family "Ubuntu Monospace"))))
 '(ac-completion-face ((t (:foreground "darkgray" :underline t :family "Ubuntu Monospace"))))
 '(ac-selection-face ((t (:background "steelblue" :foreground "white" :family "Ubuntu Monospace"))))
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

;; Remember where we were
(desktop-save-mode 1)

;;Handy macro for inserting pdb.set_trace
(fset 'pdb-insert
   [return ?i ?m ?p ?o ?r ?t ?  ?i  ?p ?d ?b ?\; ?  ?i ?p ?d ?b ?. ?s ?e ?t ?_ ?t ?r ?a ?c ?e ?\( ?\)])
(global-set-key  (kbd "C-x p") 'pdb-insert)


;;el-get, an awseome apt-get like manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get/")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync)


;;el-get controlled things to keep up with
;; (el-get-update jedi)


;; Making a better python IDE
(load "py-settings")
(global-set-key  (kbd "C-SPC") 'jedi:complete)
(setq auto-complete-mode t)


;;Hack to make sure the auto complete doesn't screw things over.
(set-cursor-color "white")

;;yaml support
(load "yaml-mode")
;(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;;; tab sanity
(load "tabs")


;;; Show the file path in the title of the frame
(setq-default frame-title-format "%b (%f)")

;;; cleanliness is a must
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-flake8rc "~/.config/flake8")


;;; git gutter is a lifesaver
(setq git-gutter+-mode t)


;;; Awesome completion tool
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have


;;; .Emacs ends here
