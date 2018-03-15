;;(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;;打开最近文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(setq make-backup-files nil)

(setq auto-save-default nil)

(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-defaults)
