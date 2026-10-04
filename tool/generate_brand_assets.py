#!/usr/bin/env python3
"""Generate Brees brand assets from the original Figma wordmark treatment.

The Figma launch screen (node 3:1820) uses a white "Brees" wordmark on
Brees purple (#2C14DD). This script keeps platform icons and portfolio
branding derived from that treatment instead of inventing a standalone mark.
"""

from __future__ import annotations

import argparse
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

PURPLE = (44, 20, 221, 255)  # #2C14DD
WHITE = (255, 255, 255, 255)
TEXT = "Brees"


def load_font(path: Path, size: int) -> ImageFont.FreeTypeFont:
    font = ImageFont.truetype(str(path), size=size)
    try:
        axes = font.get_variation_axes()
        values = [axis["default"] for axis in axes]
        changed = False
        for index, axis in enumerate(axes):
            name = axis["name"]
            if isinstance(name, bytes):
                name = name.decode("utf-8", errors="ignore")
            if "weight" in str(name).lower():
                values[index] = min(axis["maximum"], max(axis["minimum"], 700))
                changed = True
        if changed:
            font.set_variation_by_axes(values)
    except Exception:
        try:
            for name in font.get_variation_names():
                display = name.decode("utf-8", errors="ignore") if isinstance(name, bytes) else str(name)
                if display.strip().lower() == "bold":
                    font.set_variation_by_name(name)
                    break
        except Exception:
            pass
    return font


def fitted_font(font_path: Path, target_width: int) -> ImageFont.FreeTypeFont:
    low, high = 10, 1400
    while low < high:
        mid = (low + high + 1) // 2
        font = load_font(font_path, mid)
        box = font.getbbox(TEXT)
        width = box[2] - box[0]
        if width <= target_width:
            low = mid
        else:
            high = mid - 1
    return load_font(font_path, low)


def draw_centered_wordmark(image: Image.Image, font_path: Path, target_width: int, fill=WHITE) -> None:
    font = fitted_font(font_path, target_width)
    draw = ImageDraw.Draw(image)
    box = draw.textbbox((0, 0), TEXT, font=font)
    width = box[2] - box[0]
    height = box[3] - box[1]
    x = (image.width - width) / 2 - box[0]
    y = (image.height - height) / 2 - box[1]
    draw.text((x, y), TEXT, font=font, fill=fill)


def save_app_icon(path: Path, size: int, font_path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    image = Image.new("RGBA", (size, size), PURPLE)
    draw_centered_wordmark(image, font_path, int(size * 0.66))
    image.convert("RGB").save(path, optimize=True)


def save_wordmark(path: Path, font_path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    image = Image.new("RGBA", (720, 190), (0, 0, 0, 0))
    draw_centered_wordmark(image, font_path, 520, fill=PURPLE)
    image.save(path, optimize=True)


def save_readme_logo(path: Path, font_path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    image = Image.new("RGBA", (900, 260), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    draw.rounded_rectangle((0, 0, 899, 259), radius=56, fill=PURPLE)
    draw_centered_wordmark(image, font_path, 430)
    image.save(path, optimize=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--font", type=Path, required=True)
    args = parser.parse_args()

    if not args.font.exists():
        raise SystemExit(f"Font not found: {args.font}")

    save_readme_logo(Path("docs/assets/brees-logo.png"), args.font)
    save_wordmark(Path("docs/assets/brees-wordmark.png"), args.font)
    save_app_icon(Path("docs/assets/brees-app-icon.png"), 1024, args.font)

    save_app_icon(Path("android/app/src/main/res/drawable/ic_launcher_brees.png"), 1024, args.font)
    save_app_icon(Path("ios/Runner/Assets.xcassets/AppIcon.appiconset/Brees-AppIcon-1024.png"), 1024, args.font)

    for size in (16, 32, 64, 128, 256, 512, 1024):
        save_app_icon(
            Path(f"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_{size}.png"),
            size,
            args.font,
        )

    for size in (192, 512):
        save_app_icon(Path(f"web/icons/Icon-{size}.png"), size, args.font)
        save_app_icon(Path(f"web/icons/Icon-maskable-{size}.png"), size, args.font)

    save_app_icon(Path("web/favicon.png"), 64, args.font)


if __name__ == "__main__":
    main()
