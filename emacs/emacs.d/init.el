;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8
    markdown-mode))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'exec-path "/usr/local/bin")


;; OS Specific stuff
;; -------------------------------
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X")
    (tool-bar-mode 0)))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux")
    (tool-bar-mode 0))))


;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;;(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; colors and keys
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#263238" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 135 :width normal :foundry "nil" :family "Tahoma"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "yellow" :weight bold))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "Cyan" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "green")))))

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x w") 'whitespace-mode)

(global-set-key [home] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)

;; Evernote/geeknote keys
(global-set-key (kbd "C-c g c") 'geeknote-create)
(global-set-key (kbd "C-c g e") 'geeknote-edit)
(global-set-key (kbd "C-c g f") 'geeknote-find)
(global-set-key (kbd "C-c g s") 'geeknote-show)
;; (global-set-key (kbd "C-c g r") 'geeknote-remove) ;; OMG why did I ever put this here
(global-set-key (kbd "C-c g m") 'geeknote-move)

;; ido makes everything nicer
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Column counts please
(column-number-mode t)

;; Indent things nicely, we are not savages
(electric-indent-mode 1)
(electric-pair-mode 1)

;; Helper for python code
(fset 'pdb-insert
   [?i ?m ?p ?o ?r ?t ?  ?p ?d ?b ?\; ?  ?p ?d ?b ?. ?s ?e ?t ?_ ?t ?r ?a ?c ?e ?\( ?\)])
(global-set-key  (kbd "C-x p") 'pdb-insert)

;; Helm hack for saving search results
(global-set-key (kbd "C-c a g") 'helm-do-ag-project-root)

;; Set a "different" default face for the eshell
(defun my-buffer-face-mode-courrier ()
    (interactive)
    (setq buffer-face-mode-face '(:family "Monospace" :height 100))
    (buffer-face-mode))
(add-hook 'eshell-mode-hook 'my-buffer-face-mode-courrier)
(add-hook 'shell-mode-hook 'my-buffer-face-mode-courrier)

;; Server mode so we can be a fast editor
(server-mode t)

(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pyenv-mode-auto pyfmt helm-ag helm cider carbon-now-sh highlight-parentheses dockerfile-mode yaml-mode clojure-mode pyenv-mode pylint pig-mode coverage writegood-mode pydoc coffee-mode handlebars-mode python-docstring php-mode terraform-mode py-autopep8 php+-mode material-theme markdown-mode jedi go-mode geeknote flycheck elpy ein better-defaults))))

