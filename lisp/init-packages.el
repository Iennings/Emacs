(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
                ;; --- Auto-completion ---
                company
		company-anaconda
                ;; --- Better Editor ---
                hungry-delete
                swiper
                counsel
                smartparens
		popwin
		smooth-scrolling
                ;; --- Major Mode ---
                js2-mode
		markdown-mode
                ;; --- Minor Mode ---
                nodejs-repl
                exec-path-from-shell
		flycheck
;;		auto-yasnippet
		;;		snippet
		yasnippet
		evil
		window-numbering
		evil-surround
		evil-nerd-commenter
		which-key
                ;; --- Themes ---
                monokai-theme
                solarized-theme
                ) "Default packages")
 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
;; Added by Package.el.  This must come before configurations of
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
;; 							   company-dabbrev)))
;; 	  )

;; (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;;加载主题
;; (add-to-list 'my/packages 'monokai-theme)
;; (load-theme 'monokai 1)
(add-to-list 'my/packages 'solarized-theme)
(load-theme 'solarized-dark 1)


;;smartparens
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;hungry-mode 插件
(require 'hungry-delete)
(global-hungry-delete-mode)

;;popwin插件配置,将光标移动到新建窗口中
(require 'popwin)
(popwin-mode 1)

;;(require 'helm-ag)
;;(helm-do-)
;;yasnippet自动补全插件（还未使用）
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
;;(global-set-key (kbd "H-w") #'aya-create)
;;(global-set-key (kbd "H-y") #'aya-expand)

;;windows-numbering
;;(window-numbering-mode 1)

(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode 1)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)


;;evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;;which-key
(require 'which-key)
(which-key-mode 1)

;;ivy插件
(require 'ivy)
(ivy-mode 1)

;;自动补全功能开启
(require 'company)
;;(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode 1)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;;hippie补全（不知道效果，还没学）
;; (require 'hippie)
;; (setq hippie-expand-try-function-list '(try-expand-debbrev
;;                                         try-expand-debbrev-all-buffers
;;                                         try-expand-debbrev-from-kill
;;                                         try-complete-file-name-partially
;;                                         try-complete-file-name
;;                                         try-expand-all-abbrevs
;;                                         try-expand-list
;;                                         try-expand-line
;;                                         try-complete-lisp-symbol-partially
;;                                         try-complete-lisp-symbol))

(add-to-list 'company-backends 'company-anaconda)

(add-hook 'python-mode-hook 'anaconda-mode)

(provide 'init-packages)
