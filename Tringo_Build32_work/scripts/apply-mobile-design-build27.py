from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
html_path = root / "app/src/main/assets/Tringo.html"
gradle_path = root / "app/build.gradle"

if not html_path.exists() or not gradle_path.exists():
    raise SystemExit("Tringo Android source files were not found.")

html = html_path.read_text(encoding="utf-8")
marker = "tringo-android-mobile-design-build27"

if marker not in html:
    css = r"""
<style id="tringo-android-mobile-design-build27">
@media (max-width: 900px) {
  html,body{width:100%!important;height:100%!important;min-height:100%!important;margin:0!important;overflow:hidden!important;background:#edf6ff!important;overscroll-behavior:none}
  body{padding:0!important}
  .app{display:grid!important;grid-template-rows:70px minmax(0,1fr) 72px!important;width:100%!important;max-width:100vw!important;height:100vh!important;height:100dvh!important;min-height:0!important;overflow:hidden!important;gap:0!important}
  .app>.top{height:70px!important;min-height:70px!important;box-sizing:border-box!important;display:flex!important;align-items:center!important;padding:7px 13px!important;gap:9px!important;border:0!important;border-radius:0 0 21px 21px!important;background:linear-gradient(115deg,#07316f 0%,#0758b4 62%,#078ce9 100%)!important;box-shadow:0 6px 20px rgba(5,49,105,.2)!important;position:relative!important;z-index:3!important}
  .top .brand,.top .app-brand-band{display:flex!important;align-items:center!important;min-width:0!important;flex:1 1 auto!important;background:transparent!important;border:0!important;padding:0!important}
  .top .window-mascot-mark{display:block!important;width:49px!important;height:49px!important;flex:0 0 49px!important;object-fit:contain!important;margin:0!important}
  .top .titlewrap{display:flex!important;flex-direction:column!important;min-width:0!important}
  .top .title{display:block!important;color:#fff!important;font-size:23px!important;line-height:1.05!important;font-weight:900!important;background:transparent!important;border:0!important;padding:0!important;box-shadow:none!important}
  .top .subtitle,.top .sep,.top .creator{display:none!important}
  .top .right{display:flex!important;align-items:center!important;gap:6px!important;margin-left:auto!important;min-width:0!important}
  .top .online{display:flex!important;align-items:center!important;gap:5px!important;padding:4px 5px!important;color:#fff!important;font-size:11px!important;font-weight:800!important;white-space:nowrap!important;background:transparent!important}
  .top .dot{width:9px!important;height:9px!important}
  .top .app-version{display:block!important;padding:6px 8px!important;border-radius:10px!important;background:#fff!important;color:#102d63!important;font-size:12px!important;font-weight:900!important;white-space:nowrap!important}
  .content{display:flex!important;flex-direction:column!important;width:100%!important;height:100%!important;min-height:0!important;padding:0!important;gap:0!important;overflow:hidden!important;background:linear-gradient(180deg,#f8fbff 0%,#eaf5ff 72%,#dceeff 100%)!important;position:relative!important}
  .content>.left,.content>.rightpanel{display:none!important}
  .center{display:grid!important;grid-template-rows:auto auto minmax(0,1fr) auto!important;flex:1 1 auto!important;width:100%!important;height:100%!important;min-width:0!important;min-height:0!important;overflow:hidden!important;padding:0!important;border:0!important;border-radius:0!important;box-shadow:none!important;background:transparent!important}
  .mobile-hero{display:flex!important;align-items:center!important;gap:12px!important;width:calc(100% - 24px)!important;min-height:112px!important;box-sizing:border-box!important;margin:12px 12px 10px!important;padding:10px 13px!important;border:1px solid #d3e5f7!important;border-radius:22px!important;background:linear-gradient(115deg,rgba(255,255,255,.98),rgba(226,241,255,.96))!important;box-shadow:0 7px 22px rgba(18,74,132,.09)!important;overflow:hidden!important;position:relative!important}
  .mobile-hero:after{content:"";position:absolute;left:-8%;right:-8%;bottom:-31px;height:52px;border-radius:50% 50% 0 0/100% 100% 0 0;background:linear-gradient(90deg,rgba(32,151,255,.05),rgba(16,132,241,.15),rgba(32,151,255,.04));pointer-events:none}
  .mobile-hero>img{display:block!important;width:98px!important;height:98px!important;flex:0 0 98px!important;object-fit:contain!important;margin:0!important}
  .mh-text{position:relative!important;z-index:1!important;min-width:0!important;color:#102e67!important;font-size:17px!important;line-height:1.24!important;font-weight:900!important}
  .mh-text small{display:block!important;margin-top:7px!important;color:#536b8d!important;font-size:11px!important;line-height:1.35!important;font-weight:600!important}
  .mobile-shortcuts{display:grid!important;grid-template-columns:repeat(2,minmax(0,1fr))!important;gap:7px!important;padding:0 12px 9px!important}
  .mobile-shortcuts button{display:flex!important;align-items:center!important;justify-content:flex-start!important;gap:9px!important;min-width:0!important;min-height:47px!important;box-sizing:border-box!important;padding:7px 10px!important;border:1px solid #cfe1f4!important;border-radius:15px!important;background:linear-gradient(180deg,#fff,#f2f8ff)!important;color:#12336d!important;box-shadow:0 3px 11px rgba(17,74,130,.06)!important;font:inherit!important;text-align:left!important}
  .mobile-shortcuts button span{display:grid!important;place-items:center!important;width:30px!important;height:30px!important;flex:0 0 30px!important;border-radius:10px!important;background:#e3f1ff!important;color:#087bea!important;font-size:19px!important;font-weight:900!important}
  .mobile-shortcuts button b{font-size:12px!important;line-height:1.15!important;font-weight:800!important}
  .mobile-shortcuts button:last-child{grid-column:1/-1!important;min-height:42px!important}
  .chathead{display:none!important}
  .chat{grid-row:3!important;min-height:0!important;height:auto!important;overflow-y:auto!important;overflow-x:hidden!important;padding:7px 12px 10px!important;-webkit-overflow-scrolling:touch!important}
  .msg{gap:7px!important;margin:8px 0!important}
  .avatar{width:36px!important;height:36px!important;flex:0 0 36px!important}
  .bubble{max-width:92%!important;padding:11px 13px!important;border-radius:19px!important;font-size:14px!important;line-height:1.42!important}
  .result,.result-card{width:100%!important;min-width:0!important;box-sizing:border-box!important}
  .result-grid{grid-template-columns:minmax(0,1fr)!important;gap:8px!important}
  .composer{grid-row:4!important;position:relative!important;bottom:auto!important;z-index:8!important;box-sizing:border-box!important;flex:0 0 auto!important;padding:8px 12px max(9px,env(safe-area-inset-bottom))!important;background:linear-gradient(180deg,rgba(237,247,255,.84),#e5f3ff)!important}
  .composer form{display:flex!important;gap:7px!important;border-radius:24px!important;padding:5px 6px 5px 12px!important;background:#fff!important;border:1px solid #cbdfee!important;box-shadow:0 5px 16px rgba(14,72,132,.09)!important}
  .input{min-width:0!important;font-size:15px!important}
  .send{width:45px!important;height:45px!important;flex:0 0 45px!important;border-radius:15px!important}
  .attach{width:30px!important;flex:0 0 30px!important}
  .suggestions{display:flex!important;gap:6px!important;padding:7px 1px 0!important;overflow-x:auto!important;white-space:nowrap!important}
  .suggestions button{font-size:11px!important;padding:6px 9px!important;flex:0 0 auto!important}
  footer.bottom{display:none!important}
  .mobile-bottom-nav{display:flex!important;position:relative!important;grid-row:3!important;z-index:50!important;width:100%!important;height:72px!important;min-width:0!important;box-sizing:border-box!important;align-items:stretch!important;justify-content:space-around!important;gap:2px!important;padding:5px 5px max(5px,env(safe-area-inset-bottom))!important;background:rgba(255,255,255,.98)!important;border-top:1px solid #d2e4f2!important;box-shadow:0 -5px 18px rgba(18,70,115,.10)!important;overflow:hidden!important}
  .mobile-bottom-nav button{flex:1 1 20%!important;min-width:0!important;max-width:none!important;padding:3px 1px!important;display:flex!important;flex-direction:column!important;align-items:center!important;justify-content:center!important;gap:3px!important;border:0!important;border-radius:13px!important;background:transparent!important;color:#536b88!important;font:inherit!important}
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
@media(max-width:380px){.top .window-mascot-mark{width:43px!important;height:43px!important;flex-basis:43px!important}.top .title{font-size:20px!important}.mobile-hero{min-height:100px!important}.mobile-hero>img{width:84px!important;height:84px!important;flex-basis:84px!important}.mh-text{font-size:15px!important}.mobile-shortcuts button{min-height:43px!important;padding:6px 7px!important}.mobile-shortcuts button b{font-size:11px!important}.mobile-bottom-nav button>small{font-size:8px!important}}
@media(min-width:901px){.mobile-shortcuts{display:none!important}}
</style>
"""
    html += "\n" + css
    html_path.write_text(html, encoding="utf-8", newline="\n")

gradle = gradle_path.read_text(encoding="utf-8")
gradle, count = re.subn(r"versionCode\s+\d+", "versionCode 27", gradle, count=1)
if not count:
    raise SystemExit("Could not update Android versionCode.")
gradle_path.write_text(gradle, encoding="utf-8", newline="\n")
print("Applied Tringo Android responsive mobile design Build 27.")
