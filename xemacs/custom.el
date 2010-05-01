;;***************************************************
;; Customization
;;***************************************************
(message "--Setting custom variables (colors)--")
(custom-set-variables
 '(speedbar-smart-directory-expand-flag t)
 '(gutter-buffers-tab-visible-p nil)
 '(pc-select-selection-keys-only t)
 '(column-number-mode t)
 '(toolbar-captioned-p t)
 '(gnuserv-program (concat exec-directory "/gnuserv"))
 '(jde-compile-option-directory "")
 '(winring-ring-size 10)
 '(tab-width 3)
 '(toolbar-visible-p t)
 '(truncate-lines nil)
 '(jde-compile-option-command-line-args "-deprecation -g")
 '(jde-compile-option-classpath (quote ("C:\\JBuilder5\\jdk1.3\\jre\\lib\\rt.jar;C:\\robocode\\robocode.jar;C:\\robocode\\robots")))
 '(line-number-mode t)
 '(stack-trace-on-error nil)
 '(pc-select-meta-moves-sexps t)
 '(user-mail-address "Administrator@TORNADO")
 '(modeline-3d-p t)
 '(query-user-mail-address nil)
 '(pc-selection-mode t))
(custom-set-faces
 '(default ((t (:foreground "white" :background "black" :size "13pt" :family "Tahoma"))) t)
 '(custom-set-face ((((class color)) (:foreground "white" :background "blue" :stipple "~/.xemacs/white.xpm"))))
 '(gui-button-face ((t (:background "grey75" :inverse-video t))) t)
 '(info-node ((t (:family "lucida" :bold t :italic t))))
 '(custom-comment-tag-face ((((class color) (background light)) (:foreground "yellow" :background "black"))))
 '(html-helper-italic-face ((t (:family "lucida" :italic t))) t)
 '(left-margin ((t (:stipple "~/.xemacs/white.xpm"))) t)
 '(font-lock-string-face ((((class color) (background light)) (:foreground "cyan"))))
 '(font-lock-reference-face ((((class color) (background light)) (:foreground "red2"))))
 '(message-headers ((t (:bold t :stipple "~/.xemacs/white.xpm"))))
 '(shell-prompt-face ((t (:foreground "green" :background "black"))) t)
 '(xsl-other-element-face ((((background light)) (:foreground "lightBlue"))))
 '(gnus-header-newsgroups-face ((((class color) (background light)) (:foreground "MidnightBlue" :family "lucida" :italic t))))
 '(custom-documentation-face ((t (:stipple "~/.xemacs/white.xpm"))) t)
 '(gnus-emphasis-underline-italic ((t (:family "lucida" :italic t :underline t))))
 '(custom-group-tag-face ((((class color) (background light)) (:foreground "lightblue" :underline t))))
 '(man-bold ((t (:bold t :stipple "~/.xemacs/white.xpm"))))
 '(custom-variable-tag-face ((((class color) (background light)) (:foreground "lightblue" :underline t))))
 '(xsl-xslt-alternate-face ((((background light)) (:foreground "yellow"))))
 '(man-italic ((t (:family "lucida" :italic t))))
 '(gnus-summary-low-unread-face ((t (:family "lucida" :italic t))))
 '(font-lock-doc-string-face ((((class color) (background light)) (:foreground "white" :background "darkgreen"))))
 '(gnus-summary-low-ticked-face ((((class color) (background light)) (:foreground "firebrick" :family "lucida" :italic t))))
 '(font-lock-preprocessor-face ((((class color) (background light)) (:foreground "cyan" :background "blue"))))
 '(custom-comment-face ((((class grayscale color) (background light)) (:foreground "yellow" :background "black" :italic nil))))
 '(font-lock-variable-name-face ((((class color) (background light)) nil)))
 '(gui-element ((t (:background "Gray80"))) t)
 '(right-margin ((t (:stipple "~/.xemacs/white.xpm"))) t)
 '(xsl-xslt-main-face ((((background light)) (:foreground "cyan"))))
 '(custom-face-tag-face ((t (:underline t :stipple "~/.xemacs/white.xpm"))))
 '(green ((t (:foreground "green4" :stipple "~/.xemacs/white.xpm"))) t)
 '(hyper-apropos-section-heading ((t (:family "lucida" :bold t :italic t))))
 '(gnus-header-content-face ((((class color) (background light)) (:foreground "indianred4" :family "lucida" :italic t))))
 '(custom-state-face ((((class color) (background light)) (:foreground "dark green" :stipple "~/.xemacs/white.xpm"))))
 '(man-heading ((t (:bold t :stipple "~/.xemacs/white.xpm" :family "lucida"))))
 '(font-lock-warning-face ((((class color) (background light)) (:foreground "Red" :bold t))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "cyan"))))
 '(font-lock-keyword-face ((nil (:foreground "cyan"))))
 '(underline ((t (:underline t :stipple "~/.xemacs/white.xpm"))) t)
 '(jde-java-font-lock-package-face ((((class color) (background light)) (:foreground "white"))))
 '(yellow ((t (:foreground "yellow3" :stipple "~/.xemacs/white.xpm"))) t)
 '(gnus-signature-face ((((type x)) (:family "lucida" :italic t))))
 '(gnus-emphasis-underline-bold-italic ((t (:family "lucida" :bold t :italic t :underline t))))
 '(font-lock-type-face ((((class color) (background light)) (:foreground "cyan"))))
 '(message-cited-text ((t (:stipple "~/.xemacs/white.xpm" :family "lucida" :italic t))))
 '(bold ((t (:bold t :stipple "~/.xemacs/white.xpm"))) t)
 '(bold-italic ((t (:stipple "~/.xemacs/white.xpm" :family "lucida" :bold t :italic t))) t)
 '(shell-output-face ((t (:foreground "green" :background "black"))) t)
 '(blue ((t (:foreground "blue" :stipple "~/.xemacs/white.xpm"))) t)
 '(jde-java-font-lock-modifier-face ((((class color) (background light)) (:foreground "white"))))
 '(message-header-newsgroups-face ((((class color) (background light)) (:foreground "blue4" :family "lucida" :bold t :italic t))))
 '(custom-button-face ((t (:bold t :stipple "~/.xemacs/white.xpm"))))
 '(mmm-face ((t (:stipple "~/.xemacs/beige.xpm"))) t)
 '(message-header-contents ((t (:stipple "~/.xemacs/white.xpm" :family "lucida" :italic t))))
 '(italic ((t (:stipple "~/.xemacs/white.xpm" :family "lucida" :italic t))) t)
 '(gnus-summary-low-ancient-face ((((class color) (background light)) (:foreground "RoyalBlue" :family "lucida" :italic t))))
 '(font-lock-comment-face ((nil (:foreground "yellow" :background "black"))))
 '(x-face ((t (:foreground "black" :background "white" :stipple "~/.xemacs/white.xpm"))))
 '(gnus-emphasis-italic ((t (:family "lucida" :italic t))))
 '(cvs-header-face ((((class color) (background light)) (:foreground "lightblue" :bold t))))
 '(font-lock-function-name-face ((((class color) (background light) (type mswindows)) (:foreground "lightblue1"))))
 '(cvs-filename-face ((((class color) (background light)) (:foreground "lightblue"))))
 '(isearch ((t (:foreground "" :background "paleturquoise"))) t)
 '(highlight ((t (:stipple "~/.xemacs/green.xpm"))) t)
 '(modeline ((t (:stipple "~/.xemacs/bd.xpm"))) t)
 '(gnus-emphasis-bold-italic ((t (:family "lucida" :bold t :italic t))))
 '(zmacs-region ((t (:stipple "~/.xemacs/brightyellow.xpm"))) t)
 '(dired-face-boring ((((class color)) (:foreground "Gray65" :stipple "~/.xemacs/white.xpm"))))
 '(gnus-summary-low-read-face ((((class color) (background light)) (:foreground "DarkGreen" :family "lucida" :italic t))))
 '(message-highlighted-header-contents ((t (:stipple "~/.xemacs/white.xpm" :family "lucida" :bold t :italic t)))))


;;**************************************************
;; Stuff to add to the menu
;;**************************************************
(add-menu-button '("Tools")
		 ["Speedbar" speedbar-frame-mode
		  :style toggle
		  :selected (and (boundp 'speedbar-frame)
				 (frame-live-p speedbar-frame)
				 (frame-visible-p speedbar-frame)) ]
		 "--")

(load-file "~/.xemacs/my-toolbar.el"); load the toolbar

;; ************************************************
;; Functions
;; ************************************************
(defun xml-indent-custom ()
  (setq indent-tabs-mode t)
  (setq indent-tabs-relative t))
  

;;**************************************************
;; Specialty modes
;;**************************************************
(message "--Setting specialty modes--")
(setq auto-mode-alist
      (append
       (list
	'("\\.fo" . xsl-mode)
	'("\\.xsl" . xsl-mode)
	'("\\.ddl" . sql-mode)
	'("\\.xsp" . xsl-mode)
	'("\\.js" . jde-mode)
	'("\\.cpp" . c++-mode)
	'("\\.h" . c++-mode)
	'("\\.c" . c-mode)
	'("\\.jsp" . html-mode)
	'("\\.xml" . xsl-mode)
	'("\\.py" . python-mode))
	auto-mode-alist))

;;(require 'xml-other)

;; XSL mode
(autoload 'xsl-mode "xslide" "Major mode for XSL stylesheets." t)

;; Turn on font lock when in XSL mode
(add-hook 'xsl-mode-hook
	  'turn-on-font-lock)


;(defadvice xml-mode (after run-xml-mode-hooks act)
;  "Invoke `xml-mode-hook' hooks in the XML mode."
;  (run-hooks 'xml-mode-hook))


;; JDE (Java) Mode
(message "--Loading JDE mode--")
;(add-to-list 'load-path (expand-file-name "/usr/lib/xemacs/xemacs-packages/jde/lisp"))
;(add-to-list 'load-path (expand-file-name "/usr/lib/xemacs/xemacs-packages/semantic"))
;(add-to-list 'load-path (expand-file-name "/usr/lib/xemacs/xemacs-packages/lib"))
;(add-to-list 'load-path (expand-file-name "/usr/lib/xemacs/xemacs-packages/eieio"))
;(add-to-list 'load-path (expand-file-name "/usr/lib/xemacs/xemacs-packages/xml-other"))
;(require 'jde)

;; BPMS (Buisness Process Managment System) mode
;;(message "--Loading BPMS Mode--")
;;(require 'bpms)

;;**************************************************
;; Hooks
;;**************************************************
(load "~/.xemacs/code-modes.el" nil t)
(add-hook 'c-mode-hook 'timo-c-mode-hook)
(add-hook 'c++-mode-hook 'timo-c++-mode-hook)
(add-hook 'java-mode-hook 'timo-java-mode-hook)

;;
;;**************************************************
;; Key bindings
;;**************************************************
(global-set-key 'delete "\C-d")
(global-set-key 'search-forward "\C-f")
(setq-default tab-width 4)
(setq indent-tabs-mode t)
(setq indent-relative t)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64))

;;**************************************************
;; Final stuff
;;**************************************************
(message "--Setting final bits 'n pieces--")
;(display-time)

(font-lock-mode t)
(require 'font-lock) ; enable syntax highlighting

(setq frame-title-format "%b - XEmacs ")
(message "--Loading done...--")

(setq minibuffer-max-depth nil)
