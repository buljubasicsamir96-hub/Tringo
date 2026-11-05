from pathlib import Path
p=Path("Tringo_Android_Project/app/src/main/assets/Tringo.html")
s=p.read_text(encoding="utf-8")
marker="tringo-android-build29-samsung-a32-fix"
if marker not in s:
    css=Path("Tringo_Build29_mobile_fix.css").read_text(encoding="utf-8")
    s=s.replace("</head>", f"\n<style id=\"{marker}\">\n{css}\n</style>\n</head>", 1)
    p.write_text(s, encoding="utf-8")
print("Build 29 mobile CSS applied")
