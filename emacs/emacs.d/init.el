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
    py-autopep8))

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

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; colors and keys
(custom-set-faces
 '(font-lock-comment-face ((((class color) 
                             (min-colors 88) 
                             (background dark)) 
                            (:foreground "yellow" :weight bold))))
 '(font-lock-function-name-face ((((class color) 
                                   (min-colors 88) 
                                   (background dark)) 
                                  (:foreground "SkyBlue"))))
 '(font-lock-keyword-face ((((class color) 
                             (min-colors 88) 
                             (background dark)) 
                            (:foreground "Cyan" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "green")))))

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x w") 'whitespace-mode)

;; Column counts please
(column-number-mode t)


;; init.el ends here
