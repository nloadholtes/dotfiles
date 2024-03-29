;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(require 'package)
;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    blacken
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
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
(setq make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'exec-path "/usr/local/bin")
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(which-function-mode t)

;; Useful snippet to recreate the scratch
;; buffer in case it gets deleted/saved.
;;
(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

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

;; Saving the desktop (open files and such)
(desktop-save-mode 1)

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; I think that jedi was interferring with elpy, both popping up the completion box
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq popup-use-optimized-column-computation nil)

;; commented out, kinda slow on save
;;(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'python-mode-hook 'pyvenv-mode)

;; Ugh, can't get this working like I want
;;(add-hook 'python-mode 'highlight-indent-guides-mode)

;; Helper for sorting imports
(define-key python-mode-map (kbd "C-c o") #'py-isort-buffer)

;; Highlight parentheses everywhere
;;(define-globalized-minor-mode global-highlight-parentheses-mode
;;  highlight-parentheses-mode
;;  (lambda ()
;;    (highlight-parentheses-mode t)))
;;(global-highlight-parentheses-mode t)

;; Force py3
(setq elpy-rpc-python-command "python3.7")
;; (setq python-shell-interpreter "ipython3"
;;       python-shell-interpreter-args "-i --simple-prompt")

;; colors and keys
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#263238" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "DAMA" :family "Ubuntu"))))
;;  '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "yellow" :weight bold))))
;;  '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue"))))
;;  '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "Cyan" :weight bold))))
;;  '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "green"))))
;;  '(popup-face ((t (:background "lightgray" :foreground "black" :family "noto mono")))))


;;
;; Setup keybindings
;;
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x w") 'whitespace-mode)
;; (global-set-key "\C-e" 'backward-kill-word)  ;; Steve Yegge suggestion for faster typing
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key [home] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)

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

;; Helper for formating XML
(fset 'xml-format
   [?\C-x ?h ?\C-u ?\M-| ?x ?m ?l ?l ?i ?n ?t ?  ?- ?- ?f ?o ?r ?m ?a ?t ?  ?- return])
(global-set-key  (kbd "C-x x") 'xml-format)

;; Insert a - instead of a * in markdown docs
(fset 'dash-insert
      [return \-])
(global-set-key (kbd "M-S-RET") 'dash-insert)  ;; NOT WORKING. Also, make this markdown not global key.

;; Helm hack for saving search results
(global-set-key (kbd "C-c a g") 'helm-do-ag-project-root)

;;
;; End of keybindings
;;

;; Server mode so we can be a fast editor
(server-mode t)

(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)

;; Inserting today's date
(defun insert-todays-date (arg)
  (interactive "P")
  (insert (if arg
              (format-time-string "%Y-%m-%d")
            (format-time-string "[%Y-%m-%d]"))))
(global-set-key "\C-x\M-d" `insert-todays-date)

(defun markdown-insert-header-3-date ()
  "Insert a level three atx-style (hash mark) header that
includes today's date.
See `markdown-insert-header'."
  (interactive "*")
  (setq date (insert-todays-date nil))
  (markdown-insert-header 3 date nil)
  (end-of-line)
  (newline))

(add-hook 'markdown-mode-hook
	  (lambda() (local-set-key (kbd "C-c d") 'markdown-insert-header-3-date)))

;; Markdown and Github Flavored Markdown modes
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))  ;; Forcing gfm because it looks nicer
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(setq markdown-command "markdown --extras=code-friendly")
(setq markdown-fontify-code-blocks-natively t)
(setq markdown-indent-on-enter nil)
(setq markdown-asymmetric-header t)
(setq markdown-enable-wiki-links t)

;; End of Markdown section

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-safe-themes
   '("90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default))
 '(eldoc-idle-delay 10)
 '(fci-rule-color "#37474f")
 '(font-use-system-font t)
 '(hl-sexp-background-color "#1c1f26")
 '(org-agenda-files nil)
 '(package-selected-packages
   '(groovy-mode annotate py-isort org-roam dot-mode jinja2-mode highlight-indent-guides git-gutter-fringe+ git-gutter+ blacken jedi-direx markdown-mode+ todoist json-reformat org-bullets org-mind-map pyenv-mode-auto pyfmt helm-ag helm cider carbon-now-sh highlight-parentheses dockerfile-mode yaml-mode clojure-mode pyenv-mode pylint pig-mode coverage writegood-mode pydoc coffee-mode handlebars-mode python-docstring php-mode terraform-mode py-autopep8 php+-mode material-theme markdown-mode jedi go-mode flycheck ein better-defaults))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil)
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu" :foundry "DAMA" :slant normal :weight normal :height 90 :width normal)))))
