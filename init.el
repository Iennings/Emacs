(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;;打开配置文件快捷键
(defun open-init-file()
 (interactive)
 (find-file "~/.emacs.d/init.el"))

;;Package Management
(require 'init-packages)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-better-defaults)
(require 'org)
;;(require 'evil-leader)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;自动加载外部修改过的文件
(global-auto-revert-mode 1)

;;解码设置默认为utf-8
(set-language-environment "UTF-8")

;;ag插件，搜索使用(还未学会

;;(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;;expand-region 选中区域（还未安装）

(require 'impatient-mode)
(defun my-imp-org-to-html-filter (buffer)
  (let ((output-buffer (current-buffer))
        (log-message-max nil))
    (with-current-buffer buffer
      (let ((output (org-export-as 'html)))
        (with-current-buffer output-buffer (insert output))))))
(defun my-impatient-mode-hook()
  (progn (imp-set-user-filter 'my-imp-org-to-html-filter)
         (message "My org-imp-mode hook trigger")))
(add-hook 'impatient-mode-hook 'my-impatient-mode-hook)

;;evil模式开启
(require 'evil)
(require 'evil-leader)
;;(global-evil-leader-mode 1)
(window-numbering-mode 1)
(evil-mode 1)
;;evil-leader 键
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
;;  "s"  'save-excursion
  )

;;dired配置，开始两个配置是默认递归删除和复制)
;;C-x d可以进入Dired模式（自己选择路径）,快捷键C-x C-j可以进入当前文件夹的所在路径
;;(setq dired-recursive-deletes 'always)
;;(setq dired-recursive-copies 'always)

(require 'dired-x)
(put 'dired-find-alternate-file 'disabled nil)
;;延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(setq dired-dwin-target 1)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
