from pathlib import Path
import re
import runpy

root = Path(__file__).resolve().parents[1]
base_script = root / "scripts" / "apply-mobile-design-build27.py"
if not base_script.exists():
    raise SystemExit("Missing Build27 base script; refusing to continue.")

# Keep the complete, known Build27 interface as the starting point.
runpy.run_path(str(base_script), run_name="__main__")

html_path = root / "app/src/main/assets/Tringo.html"
gradle_path = root / "app/build.gradle"
html = html_path.read_text(encoding="utf-8")
marker = "tringo-android-mobile-refinements-build28"

if marker not in html:
    css = r'''
<style id="tringo-android-mobile-refinements-build28">
/* Build 28: safe-area and landscape refinements; Build 27 design remains intact. */
@media (max-width: 900px) {
  body { padding-top: env(safe-area-inset-top, 0px) !important; }
  .composer { padding-bottom: max(9px, env(safe-area-inset-bottom)) !important; }
  img, video, canvas, iframe { max-width: 100%; }
  input, button, select, textarea { max-width: 100%; }
}
@media (max-width: 900px) and (orientation: landscape) {
  .app { height: 100vh !important; height: 100dvh !important; }
  .app > .top { min-height: 54px !important; height: 54px !important; }
  .top .window-mascot-mark { width: 40px !important; height: 40px !important; flex-basis: 40px !important; }
  .top .title { font-size: 20px !important; }
  .mobile-hero { min-height: 76px !important; margin-top: 7px !important; margin-bottom: 6px !important; }
  .mobile-hero > img { width: 64px !important; height: 64px !important; flex-basis: 64px !important; }
  .mh-text { font-size: 14px !important; }
  .mh-text small { margin-top: 3px !important; font-size: 10px !important; }
  .mobile-shortcuts { gap: 5px !important; padding-bottom: 5px !important; }
  .mobile-shortcuts button { min-height: 36px !important; }
  .mobile-bottom-nav { height: 58px !important; }
  .mobile-bottom-nav button > span { font-size: 17px !important; }
}
</style>
'''
    html += "\n" + css
    html_path.write_text(html, encoding="utf-8", newline="\n")

gradle = gradle_path.read_text(encoding="utf-8")
gradle, n = re.subn(r"versionCode\s+\d+", "versionCode 28", gradle, count=1)
if n != 1:
    raise SystemExit("Could not safely set versionCode 28.")
gradle_path.write_text(gradle, encoding="utf-8", newline="\n")
print("Applied Tringo Android Build 28 refinements.")
