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

(provide 'imenu-stickyfunc)

;;; imenu-stickyfunc.el ends here
