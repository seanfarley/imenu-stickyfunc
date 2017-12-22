;;; imenu-stickyfunc.el --- An imenu version of `semantic-stickyfunc-mode' -*- lexical-binding: t -*-

;; Author: Sean Farley <sean@farley.io>
;; Url: http://github.com/seanfarley/imenu-stickyfunc
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))
;; Keywords: language, tools

;;; Commentary:

;; Basically, this is a re-implementation of `semantic-stickyfunc-mode' based
;; on imenu. Also added, is the feature to show arguments to a function a la
;; `semantic-stickyfunc-enchance'.

;; My inspiration for this mode is that semantic ended up being way too slow to
;; deal with and that imenu mostly had the information needed.

;;; Installation:

;; To install manually, put this file in your `load-path', require
;; `imenu-stickyfunc' in your init file, and run the same command.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

;;;; Requirements

;;;; Variables

(defvar imenu-auto-rescan)

(defvar imenu-stickyfunc-old-hlf nil
  "Value of the header line when entering imenu-stickyfunc mode.")

(defvar-local imenu-stickyfunc-stickyline nil
  "Value of header line")
(put 'imenu-stickyfunc-stickyline 'risky-local-variable t)

(defconst imenu-stickyfunc-header-line-format
  '(:eval (progn
            (setq imenu-stickyfunc-stickyline (imenu-stickyfunc--fetch-stickyline))
            (list
             (propertize " " 'display '((space :align-to 0)))
             'imenu-stickyfunc-stickyline)))
  "The header line format used by stickyfunc mode.")

(defgroup imenu-stickyfunc nil
  "Options for `imenu-stickyfunc-mode'."
  :group 'org)

;;;; Functions

(defun imenu-stickyfunc--fetch-stickyline ()
  "Make the function at the top of the current window sticky.
Capture its function declaration, and place it in the header
line. If there is no function, disable the header line."
  (save-excursion
    (goto-char (window-start (selected-window)))
    (format "%s" (point))))

;;;; Minor mode

;;;###autoload
(define-minor-mode imenu-stickyfunc-mode
  "Minor mode to make the current function sticky in the header line.
With prefix argument ARG, turn on if positive, otherwise off.
Return non-nil if the minor mode is enabled."
  :group 'imenu
  (if imenu-stickyfunc-mode
      (progn
        (when (and (local-variable-p 'header-line-format (current-buffer))
                   (not (eq header-line-format
                            imenu-stickyfunc-header-line-format)))
          ;; if imenu is not loaded, then load it here
          (unless (featurep 'imenu)
            (require 'imenu nil t))
          ;; set default if not already set
          (setq-default imenu-auto-rescan t)
          ;; Save previous buffer local value of header line format.
          (set (make-local-variable 'imenu-stickyfunc-old-hlf)
               header-line-format))
        ;; Enable the mode
        (setq header-line-format imenu-stickyfunc-header-line-format))
    ;; Disable mode
    (when (eq header-line-format imenu-stickyfunc-header-line-format)
      ;; Restore previous buffer local value of header line format if
      ;; the current one is the sticky func one.
      (kill-local-variable 'header-line-format)
      (when (local-variable-p 'imenu-stickyfunc-old-hlf (current-buffer))
        (setq header-line-format imenu-stickyfunc-old-hlf)
        (kill-local-variable 'imenu-stickyfunc-old-hlf)))))

(provide 'imenu-stickyfunc)

;;; imenu-stickyfunc.el ends here
