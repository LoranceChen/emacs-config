(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(electric-indent-mode -1)
(setq inhibit-splash-screen t);forbid welcome buffer when open emacs

(global-linum-mode t)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "https://elpa.zilongshanren.com/gnu/")
			 ("melpa-stable" . "https://elpa.zilongshanren.com/melpa-stable/")))

;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
 ;                       ("marmalade" . "http://marmalade-repo.org/packages/")
  ;                      ("melpa-stable" . "http://stable.melpa.org/packages/")
   ;                     ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;;‘C-h v load-path RET’ gives you the documentation variable ‘load-path’
(add-to-list 'load-path "~/.emacs.d/haskell-mode/")

;(add-to-list 'load-path "~/.emacs.d/org/") todo remove

;;add package if not installed
(require 'cl)
(defvar my-packages '(
		      company
		      monokai-theme
                      hungry-delete
		      swiper
		      counsel
		      smartparens
		      exec-path-from-shell
		      popwin
		   ) "Default packages")

(defun my-package-installed-p ()
  (loop for pkg in my-packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my-package-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my-packages)
    (when (not (package-installed-p pkg))
    (package-install pkg))))

;interactive
(setq-default cursor-type 'bar)

;;editor basic=================
(require 'org)
(setq org-src-fontify-natively t)

(global-company-mode t)
(global-hl-line-mode t);;current line heightlight
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode);;add phrass match tip when open el mode
(load-theme 'monokai t); load theme

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'hungry-delete)
(global-hungry-delete-mode)

;;swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-load-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
;;(global-set-key (kbd "C-x l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(require 'smartparens-config)
(smartparens-global-mode t);parens auto fill

;;find source code
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-auto-revert-mode t);refresh the file when modified by other editor

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'popwin)
(popwin-mode t);such as C-h C-f(help window) comfortable then default

;;not works yet
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("8lc", "lorancechen")
					    ))

(setq ring-bell-function 'ignore)
(delete-selection-mode t)

;;git find managed project file
(global-set-key (kbd "C-c p f") 'counsel-git)
;;==========================


; haskell
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode/")

(eval-after-load 'haskell-mode (load-library "haskell-mode"))
;(require 'haskell-mode)
(define-key haskell-mode-map (kbd "<f8>") 'haskell-navigate-imports)


;auto generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("f81a9aabc6a70441e4a742dfd6d10b2bae1088830dc7aba9c9922f4b1bd2ba50" default)))
 '(package-selected-packages
   (quote
    (hungry-delete monokai-theme markdown-mode zygospore yasnippet ws-butler volatile-highlights undo-tree smartparens intero iedit helm-swoop helm-projectile helm-gtags ggtags function-args dtrt-indent company-irony comment-dwim-2 anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

