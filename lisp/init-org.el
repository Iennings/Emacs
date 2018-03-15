(require 'org)
(require 'org-capture)
;;org插件配置(还未使用过）
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/Learning-note/org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

(provide 'init-org)
