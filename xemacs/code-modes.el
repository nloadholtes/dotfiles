;; C-mode hook. Start from the K&R style. We use tabs for indenting and
;; the tab width is 8.
(defun timo-c-mode-hook ()
  "Timo's C-mode"
  (c-set-style "K&R")
  (setq c-basic-offset 3)
  (setq indent-tabs-mode t)
  (c-set-offset 'arglist-close 1)
  (setq tab-width 3))

;; C++-mode
(defun timo-c++-mode-hook ()
  "Timo's C++-mode"
  (c-set-style "K&R")
  (setq c-basic-offset 3)
  (setq indent-tabs-mode t)
  (c-set-offset 'inline-open 1)
  (c-set-offset 'arglist-close 1)
  (setq tab-width 3))

;; Java-mode hook.
(defun timo-java-mode-hook ()
  "Timo's Java-mode"
  (c-set-style "K&R")
  (c-set-offset 'topmost-intro-cont 0)
  (setq c-basic-offset 3)
  (setq indent-tabs-mode t)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'substatement-open 0)
  (setq tab-width 3))

