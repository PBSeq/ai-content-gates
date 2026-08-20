# AI Content Gates

![license](https://img.shields.io/badge/license-MIT-green) ![bash](https://img.shields.io/badge/bash-no%20dependencies-blue) ![field--tested](https://img.shields.io/badge/field--tested-daily%20pipeline-orange)

**Shell-script gates that block AI-generated content defects before they cost you money.**

This repo is the free, working core of a system built inside a real daily-publishing
AI video operation. The doctrine in one line:

> The second time a defect appears, it stops being a note-to-self and becomes a
> machine gate — a script that exits non-zero and blocks the expensive stage.

"Be more careful" is not a system. A grep pattern is.

## Why gates, and where

A content pipeline has stages with wildly different costs. Fixing a word in a draft
is free. After image generation, it costs a regeneration. After render, a re-render.
After publishing, a public correction. So you place a gate in front of every stage
that costs something, and the gate checks exactly the failures that have actually
bitten you — not a generic checklist.

## The free gate in this repo

[`gate-sample.sh`](gate-sample.sh) checks a markdown script for the three defect
classes that most often survive human review:

1. **Absolute claims** (`never`, `always`, `first ever`, `no one`) — the words most
   likely to be factually wrong and most likely to get quoted against you
2. **Unsourced sections** — any factual section without a source line
3. **On-screen text held to a weaker bar than narration** — captions get screenshotted;
   they need the *stricter* standard, not the looser one

```bash
./gate-sample.sh your-script.md   # exit 0 = pass, exit 1 = blocked, with line numbers
```

No dependencies beyond bash and grep. Copy it, edit the patterns to match the
failures your pipeline actually produces.

## The full kits

The production versions — with the repair tools, prompt systems, and the
multi-session protocol — are paid products. Built and used daily, priced honestly,
30-day money back. Launch code **LAUNCH20** takes 20% off (first 100 buyers):

| Kit | What it is | Price |
|---|---|---|
| [The Machine Gate Kit](https://pathobrain.gumroad.com/l/aipppc) | Fact-check gate, PIL image-repair toolkit, era-guard prompt system, $0 pipeline playbook | $29 |
| [The Era Guard Report](https://pathobrain.gumroad.com/l/era-guard-report) | Field report with real adoption-rate data: why negative prompts summon what they ban (19% → 75% keep rate) | $9 |
| [Content OS for Claude Code](https://pathobrain.gumroad.com/l/content-os-claude-code) | The protocol for parallel Claude Code sessions: five collision classes, gate pattern, handoff templates | $49 |

## Honest scope

Everything here came from one operation in one domain. The transferable part is the
method — find your recurring defects, convert them into gates — not our specific
grep patterns. No income claims, no automation hype.
