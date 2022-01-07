(define (my-script img drw)
  (begin
    (gimp-image-scale img 96 96)
    (gimp-displays-flush)
    (gimp-image-resize img 128 128 0 0)
    (define lyr (vector-ref (cadr (gimp-image-get-layers img)) 0))
    (gimp-layer-resize-to-image-size lyr)
    (gimp-displays-flush)
  )
)
(script-fu-register
  "my-script"                ;関数名
  "まいスクリプト"           ;メニューラベル
  "GIMPを終了します。"       ;description
  "takkete"                  ;作成者
  "copyright 2020 takkete"   ;コピーライト
  "May 28, 2020"             ;作成日付
  ""                        ;image type that the script works on
  SF-IMAGE "Input Image" 0
  SF-DRAWABLE "Input Drawable" 0
)
(script-fu-menu-register "my-script" "<Image>/File/Create")