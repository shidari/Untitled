def main : IO Unit := do
  let englishGreeting := IO.println "Hello!"
  IO.println "Bonjour!"
  englishGreeting

-- 1. IO.println "Hello!"　を評価
-- 2. 上のアクションをenglishGreetingに束縛
-- 3. IO.println "Bonjour!"を実行
-- 4. englishGreetingを実行
