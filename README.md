# BK Explorer

Interactive Brooklyn street exploration map for painting every block you've walked with your crew.

**Live at:** [bk-explorer.com](https://bk-explorer.com)

---

## What It Is

A collaborative map where 5 friends track every street they've walked in Brooklyn. Tap a street to paint it your color. When multiple people walk the same street, it turns green (shared). When all 5 have walked it, it turns white (everyone).

## The Crew

| Color | Explorer |
|-------|----------|
| Red | Alex |
| Blue | Zack |
| Yellow | Weston |
| Orange | Oliver |
| Purple | Dominick |
| Green | Shared (2+ people) |
| White | Everyone (all 5) |

## Features

### Core
- **Street painting** — tap any street to claim it with your color
- **Real-time sync** — all changes sync to Firebase so everyone sees updates
- **Erase mode** — eraser button to remove paint from streets
- **Undo** — reverse your last action (stores up to 50 actions)
- **Deselect paint** — tap your selected color again to enter view-only mode

### Desktop Sidebar
- **Paint mode** — color picker with eraser and undo
- **Filter by person** — show only one person's streets, dims everything else
- **Neighborhood progress** — progress bars for ~35 Brooklyn neighborhoods, sorted by % complete
- **Street search** — search any street, click to zoom to it
- **Legend** — color reference for all explorers
- **Collapsible sidebar** — collapse to just the color picker with the arrow button

### Mobile
- **Paint mode** — floating color picker at bottom with "PAINT MODE" label
- **Search button** — magnifying glass icon in header, opens full-screen search
- **Leaderboard button** — trophy icon in header, opens centered popup overlay
- **Legend** — floating above the color picker
- **Map blocking** — map interaction disabled when search is open

### Leaderboard
- **Desktop** — left-aligned bar below the header showing per-person block counts, ranked
- **Mobile** — centered popup overlay toggled from header button
- Includes shared and everyone counts

### Hover/Highlight
- **Map hover** — subtle silver glow when hovering streets on the map
- **Search highlight** — pink glow when hovering streets in the search list
- **Shared street popup** — hovering a shared (green) street shows who painted it

### Login
- Name-based access control at [bk-explorer.com](https://bk-explorer.com)
- Animated grid background with floating street line effects
- Login persists for 7 days via localStorage
- Only the 5 explorers can access the app

### Dev Mode
- **DEV button** in header stats area (desktop only, password: `7777`)
- **User bans** — cycle Active -> Temp Ban (24h) -> Permanent Ban -> Unban
- Permanent bans strip all paint and sync to Firebase
- Unbanning restores paint from backup
- Banned colors cannot be used to paint
- **Dev environment** — separate `dev.html` page with red "DEV" branding and isolated data path (`/bk_explorer/dev_blocks`)

## Tech Stack

- **Frontend:** Vanilla JavaScript (single HTML file)
- **Map:** MapLibre GL JS v4.1.2
- **Tiles:** CARTO dark map tiles + OpenStreetMap data
- **Database:** Firebase Realtime Database
- **Compression:** pako (zlib) for embedded street data
- **Fonts:** Google Fonts (DM Sans, Space Mono)
- **Hosting:** Vercel at bk-explorer.com
- **Domain:** GoDaddy DNS -> Vercel

## Project Structure

```
bk-explorer/
  index.html      — Main app (map + all features)
  login.html      — Login/landing page
  dev.html        — Dev environment (isolated data)
  deploy.sh       — GitHub Pages deployment script
  CNAME           — Custom domain config
  README.md       — This file
```

## Deployment

Hosted on Vercel. Deploy to production:

```bash
vercel --prod
```
