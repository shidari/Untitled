abbrev URI := String
abbrev Version := String

inductive HTTPMETHOD : Type where
| GET
| POST

structure HTTPResponse where
  mk ::
  status : Nat
  body : String

def httpResponseToString (r: HTTPResponse): String :=
  s!"HTTP/{r.status}\n{r.body}"

instance : ToString HTTPResponse where
 toString := httpResponseToString


class Handles (m: HTTPMETHOD) where
  handle : IO HTTPResponse

instance: Handles .GET where
  handle := pure $ HTTPResponse.mk 200 "This is GET response"

instance: Handles .POST where
  handle := pure $ HTTPResponse.mk 201 "This is POST response"

-- テストハーネス
def testAll : IO Unit := do
  let getResp ← Handles.handle (.GET)
  IO.println s!"GET: {getResp}"
  let postResp ← Handles.handle (.POST)
  IO.println s!"POST: {postResp}"

-- 実行例
#eval testAll
