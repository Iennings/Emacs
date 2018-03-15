(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-c r") 'org-capture)

;;(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init-keybindings)
