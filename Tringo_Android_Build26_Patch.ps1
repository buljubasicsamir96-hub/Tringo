$ErrorActionPreference = "Stop"

$root = (Get-Location).Path
$htmlPath = Join-Path $root "Tringo_Android_Project\app\src\main\assets\Tringo.html"
$gradlePath = Join-Path $root "Tringo_Android_Project\app\build.gradle"
$workflowPath = Join-Path $root ".github\workflows\android-apk.yml"

foreach ($p in @($htmlPath, $gradlePath, $workflowPath)) {
    if (-not (Test-Path $p)) { throw "Nedostaje datoteka: $p. Pokreni skriptu iz glavnog Tringo repozitorija." }
}

$html = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)

if ($html -notmatch 'tringo-android-mobile-design-build26') {
    $heroStart = $html.IndexOf('<div class="mobile-hero">')
    if ($heroStart -lt 0) { throw "Nije pronađen postojeći mobile-hero blok." }

    # Existing hero contains one nested text div; insert shortcuts after the complete hero.
    $heroEnd = $html.IndexOf('</div></div>', $heroStart)
    if ($heroEnd -lt 0) { throw "Nije pronađen završetak mobile-hero bloka." }
    $heroEnd += '</div></div>'.Length

    $shortcuts = @'
<div class="mobile-shortcuts" aria-label="Brzi pristup">
<button type="button" data-nav="chat"><span>▦</span><b>Danas</b></button>
<button type="button" data-nav="history"><span>◷</span><b>Historija</b></button>
<button type="button" data-nav="codes"><span>☆</span><b>Najčešće greške</b></button>
<button type="button" data-nav="manuals"><span>▤</span><b>Uputstva</b></button>
<button type="button" data-nav="about"><span>ⓘ</span><b>O aplikaciji</b></button>
<button type="button" data-nav="updates"><span>↻</span><b>Ažuriranje</b></button>
<button type="button" data-nav="appearance"><span>◐</span><b>Izgled</b></button>
</div>
'@
    $html = $html.Insert($heroEnd, "`r`n" + $shortcuts)

    $navPattern = '(?s)<nav class="mobile-bottom-nav"[^>]*>.*?</nav>'
    $newNav = @'
<nav class="mobile-bottom-nav" aria-label="Glavni meni">
  <button class="active" data-nav="chat" type="button"><span>●</span><small>Chat</small></button>
  <button data-nav="history" type="button"><span>◷</span><small>Historija</small></button>
  <button data-nav="codes" type="button"><span>☆</span><small>Greške</small></button>
  <button data-nav="manuals" type="button"><span>▤</span><small>Uputstva</small></button>
  <button data-nav="about" type="button"><span>ⓘ</span><small>O aplikaciji</small></button>
</nav>
'@
    $html = [regex]::Replace($html, $navPattern, $newNav, 1)

    $mobileCss = @'
<style id="tringo-android-mobile-design-build26">
@media(max-width:900px){
 html,body{width:100%;height:100%;min-height:100%;overflow:hidden!important;background:#edf6ff!important}
 body{margin:0!important}
 .app{width:100%!important;max-width:100vw!important;height:100vh!important;height:100dvh!important;min-height:0!important;display:grid!important;grid-template-rows:72px minmax(0,1fr) 68px!important;overflow:hidden!important}
 .app>.top{height:72px!important;min-height:72px!important;box-sizing:border-box!important;padding:8px 13px!important;border-radius:0 0 22px 22px!important;display:flex!important;align-items:center!important;gap:9px!important;background:linear-gradient(115deg,#06295f 0%,#0755a8 65%,#0787e8 100%)!important;box-shadow:0 7px 22px rgba(8,60,120,.18)!important}
 .top .brand{display:flex!important;flex:1 1 auto!important;min-width:0!important}
 .top .app-brand-band{display:flex!important;align-items:center!important;gap:8px!important;min-width:0!important;background:transparent!important;border:0!important;padding:0!important}
 .top .sep{display:none!important}
 .top .window-mascot-mark{display:block!important;width:52px!important;height:52px!important;flex:0 0 52px!important;object-fit:contain!important;margin:0!important}
 .top .titlewrap{display:flex!important;flex-direction:column!important;min-width:0!important}
 .top .title{display:block!important;color:#fff!important;font-size:23px!important;line-height:1.05!important;font-weight:900!important;padding:0!important;background:transparent!important;border:0!important;box-shadow:none!important}
 .top .subtitle{display:none!important}
 .top .right{display:flex!important;align-items:center!important;gap:7px!important;margin-left:auto!important;min-width:0!important}
 .top .online{display:flex!important;align-items:center!important;gap:5px!important;padding:5px 7px!important;font-size:11px!important;font-weight:800!important;color:#fff!important;white-space:nowrap!important;background:transparent!important}
 .top .dot{width:9px!important;height:9px!important}
 .top .creator{display:none!important}
 .top .app-version{display:block!important;padding:6px 9px!important;font-size:12px!important;font-weight:900!important;border-radius:11px!important;background:#fff!important;color:#102b62!important;white-space:nowrap!important}
 .content{display:flex!important;flex-direction:column!important;min-height:0!important;height:100%!important;overflow:hidden!important;padding:0!important;gap:0!important;background:linear-gradient(180deg,#f5faff 0%,#eaf5ff 100%)!important}
 .content>.left,.content>.rightpanel{display:none!important}
 .center{display:grid!important;grid-template-rows:auto auto minmax(0,1fr) auto!important;flex:1 1 auto!important;width:100%!important;min-width:0!important;min-height:0!important;height:100%!important;overflow:hidden!important;border:0!important;border-radius:0!important;box-shadow:none!important;background:transparent!important;padding:0!important}
 .mobile-hero{display:flex!important;align-items:center!important;gap:10px!important;box-sizing:border-box!important;width:calc(100% - 24px)!important;min-height:116px!important;margin:12px 12px 9px!important;padding:10px 12px!important;border:1px solid #d5e7f6!important;border-radius:22px!important;background:linear-gradient(115deg,#fff 0%,#e8f4ff 100%)!important;box-shadow:0 7px 22px rgba(19,76,135,.09)!important;overflow:hidden!important}
 .mobile-hero>img{display:block!important;width:105px!important;height:105px!important;flex:0 0 105px!important;object-fit:contain!important;margin:0!important}
 .mh-text{font-size:17px!important;line-height:1.25!important;font-weight:900!important;color:#102e67!important;min-width:0!important}
 .mh-text small{display:block!important;margin-top:7px!important;font-size:11px!important;line-height:1.35!important;font-weight:600!important;color:#536b8d!important}
 .mobile-shortcuts{display:grid!important;grid-template-columns:repeat(2,minmax(0,1fr))!important;gap:7px!important;padding:0 12px 9px!important}
 .mobile-shortcuts button{min-width:0!important;min-height:47px!important;display:flex!important;align-items:center!important;justify-content:flex-start!important;gap:9px!important;padding:7px 10px!important;border:1px solid #cfe2f4!important;border-radius:14px!important;background:linear-gradient(180deg,#fff,#f2f8ff)!important;color:#12336d!important;box-shadow:0 3px 10px rgba(17,74,130,.06)!important;font:inherit!important;text-align:left!important}
 .mobile-shortcuts button span{display:grid!important;place-items:center!important;width:29px!important;height:29px!important;flex:0 0 29px!important;border-radius:9px!important;background:#e3f1ff!important;color:#087bea!important;font-size:19px!important;font-weight:900!important}
 .mobile-shortcuts button b{font-size:12px!important;line-height:1.15!important;font-weight:800!important}
 .chathead{display:none!important}
 .chat{grid-row:3!important;min-height:0!important;height:auto!important;overflow-y:auto!important;overflow-x:hidden!important;padding:6px 12px 10px!important;-webkit-overflow-scrolling:touch!important}
 .msg{gap:7px!important;margin:8px 0!important}
 .avatar{width:36px!important;height:36px!important;flex:0 0 36px!important}
 .bubble{max-width:92%!important;padding:10px 12px!important;font-size:14px!important;line-height:1.4!important}
 .result{width:100%!important;min-width:0!important;box-sizing:border-box!important;padding:10px!important}
 .result-grid{grid-template-columns:minmax(0,1fr)!important;gap:8px!important}
 .bosnianbox,.solutionbox{grid-column:1!important}
 .code{font-size:29px!important}
 .original,.bosnian,.solution{font-size:14px!important;overflow-wrap:anywhere!important}
 .composer{grid-row:4!important;position:relative!important;bottom:auto!important;z-index:8!important;box-sizing:border-box!important;flex:0 0 auto!important;padding:8px 12px max(9px,env(safe-area-inset-bottom))!important;background:linear-gradient(180deg,rgba(237,247,255,.82),#e5f3ff)!important}
 .composer form{display:flex!important;gap:7px!important;border-radius:24px!important;padding:5px 6px 5px 12px!important;background:#fff!important;border:1px solid #cbdfee!important;box-shadow:0 5px 16px rgba(14,72,132,.09)!important}
 .input{min-width:0!important;font-size:15px!important}
 .send{width:45px!important;height:45px!important;flex:0 0 45px!important;border-radius:15px!important}
 .attach{width:30px!important;flex:0 0 30px!important}
 .suggestions{display:flex!important;gap:6px!important;padding:7px 1px 0!important;overflow-x:auto!important;white-space:nowrap!important}
 .suggestions button{font-size:11px!important;padding:6px 9px!important;flex:0 0 auto!important}
 footer.bottom{display:none!important}
 .mobile-bottom-nav{display:flex!important;position:relative!important;grid-row:3!important;z-index:50!important;width:100%!important;height:68px!important;min-width:0!important;box-sizing:border-box!important;align-items:stretch!important;justify-content:space-around!important;gap:2px!important;padding:5px 5px max(5px,env(safe-area-inset-bottom))!important;background:rgba(255,255,255,.98)!important;border-top:1px solid #d2e4f2!important;box-shadow:0 -5px 18px rgba(18,70,115,.10)!important;overflow:hidden!important}
 .mobile-bottom-nav button{flex:1 1 20%!important;min-width:0!important;max-width:none!important;padding:3px 1px!important;display:flex!important;flex-direction:column!important;align-items:center!important;justify-content:center!important;gap:3px!important;border:0!important;border-radius:12px!important;background:transparent!important;color:#536b88!important;font:inherit!important}
 .mobile-bottom-nav button>span{font-size:20px!important;line-height:1.1!important}
 .mobile-bottom-nav button>small{font-size:9px!important;line-height:1.1!important;font-weight:800!important;white-space:nowrap!important}
 .mobile-bottom-nav button.active{color:#087bea!important;background:#e8f4ff!important}
 html.dark,html.dark body{background:#091725!important}
 html.dark .content{background:linear-gradient(180deg,#0b1726,#102438)!important}
 html.dark .mobile-hero{background:linear-gradient(115deg,#172b40,#10263d)!important;border-color:#304b65!important}
 html.dark .mh-text{color:#f1f7ff!important}
 html.dark .mh-text small{color:#b7c9dc!important}
 html.dark .mobile-shortcuts button{background:linear-gradient(180deg,#1b3046,#14283c)!important;border-color:#304b65!important;color:#eaf4ff!important}
 html.dark .mobile-shortcuts button span{background:#173f63!important;color:#56b7ff!important}
 html.dark .chat{color:#eaf4ff!important}
 html.dark .composer{background:linear-gradient(180deg,rgba(15,31,47,.88),#12283d)!important}
 html.dark .composer form{background:#1a2d40!important;border-color:#36536c!important}
 html.dark .input{color:#f2f7fc!important;background:transparent!important}
 html.dark .mobile-bottom-nav{background:rgba(14,29,44,.99)!important;border-color:#30475c!important}
 html.dark .mobile-bottom-nav button{color:#b7c9dc!important}
 html.dark .mobile-bottom-nav button.active{color:#fff!important;background:#174b7b!important}
}
@media(max-width:380px){
 .top .window-mascot-mark{width:44px!important;height:44px!important;flex-basis:44px!important}
 .top .title{font-size:20px!important}
 .mobile-hero>img{width:88px!important;height:88px!important;flex-basis:88px!important}
 .mh-text{font-size:15px!important}
 .mobile-shortcuts button{min-height:43px!important;padding:6px 7px!important}
 .mobile-shortcuts button b{font-size:11px!important}
 .mobile-bottom-nav button>small{font-size:8px!important}
}
@media(min-width:901px){.mobile-shortcuts{display:none!important}}
</style>
'@
    $html += "`r`n" + $mobileCss
    [System.IO.File]::WriteAllText($htmlPath, $html, [System.Text.UTF8Encoding]::new($false))
}

$gradle = [System.IO.File]::ReadAllText($gradlePath, [System.Text.Encoding]::UTF8)
$gradle = [regex]::Replace($gradle, 'versionCode\s+\d+', 'versionCode 26')
[System.IO.File]::WriteAllText($gradlePath, $gradle, [System.Text.UTF8Encoding]::new($false))

$workflow = @'
name: Build Tringo Android APK

on:
  workflow_dispatch:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: Tringo_Android_Project
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Set up Java 17
        uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: '17'
      - name: Set up Android SDK
        uses: android-actions/setup-android@v3
        with:
          packages: platform-tools
      - name: Install Gradle
        uses: gradle/actions/setup-gradle@v4
        with:
          gradle-version: '8.9'
      - name: Install Android platform
        run: sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"
      - name: Build APK
        run: gradle --no-daemon assembleDebug
      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: Tringo-Android-APK-Build26
          path: app/build/outputs/apk/debug/*.apk
          if-no-files-found: error
'@
[System.IO.File]::WriteAllText($workflowPath, $workflow, [System.Text.UTF8Encoding]::new($false))

Write-Host ""
Write-Host "Tringo Android Build 26 je pripremljen." -ForegroundColor Green
Write-Host "Promijenjeni su samo mobilni izgled, Android versionCode i putanja automatskog builda."
Write-Host "Baza, pretraga, funkcije, originalni logo i maskota nisu mijenjani."
Write-Host "Sada provjeri izmjene u GitHub Desktopu, commit i Push origin."
