;;
;; A python specific settings file.
;;
(add-to-list 'load-path "~/.emacs.d/python-mode.el-6.1.3") 
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.3")
(require 'python-mode)

(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))
(lambda-mode 1)

(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)
(add-hook 'lisp-mode-hook
          #'(lambda () (setq autopair-dont-activate t)))

(add-hook 'python-mode-hook
          #'(lambda ()
              (push '(?' . ?')
                    (getf autopair-extra-pairs :code))
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

(require 'python-pep8)
;;(require 'python-pylint)

(add-to-list 'load-path
              "~/projects/github/yasnippet")
;(require 'yasnippet) ;; not yasnippet-bundle
;(yas/global-mode 1)
(add-hook 'python-mode-hook 'jedi:ac-setup)
