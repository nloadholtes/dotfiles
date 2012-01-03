;;
;; A python specific settings file.
;;
(add-to-list 'load-path "~/.emacs.d/python-mode.el-6.0.4") 
(setq py-install-directory "~/.emacs.d/python-mode.el-6.0.4")
(require 'python-mode)

(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
