
module BackEnd.Second.SaveAndRestore (
    saveAndRestore
  ) where

--import BackEnd.Second.SaveAndRestore.Rename   (saveAndRestore)
import BackEnd.Second.SaveAndRestore.NoRename (saveAndRestore)
-- こっちは関数呼び出しのCoalescingが出来ない(それでもこっちのほうが効率的)
-- 使う場合はCoalescing.hsを編集

