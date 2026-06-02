---
name: verified-delivery
description: Use when building, fixing, or implementing anything that can be run — decompose the work into steps, prove EACH step with real actions (Playwright screenshots, SQL/database checks, API round-trips, device screenshots) against real data, never mock data, and refuse to mark the task done until you have an evidence bundle the user has confirmed.
---

# Verified Delivery

Turn the request into a verification-backed chain. Do not claim success
without proof.

## Procedure

1. **Locate & read.** Scope the relevant code and logs — use search to
   bound the area; do NOT read an entire large repo. Understand the real
   interaction logic. If a design or assumption looks wrong, STOP and
   confirm with the user before building.

2. **Decompose, and attach a verification to each step.** For every step,
   decide up front HOW it will be proven, by surface:
   - **Web / UI** → drive it with Playwright and screenshot the result.
   - **Data / backend** → write a script that calls the REAL service, then
     query the DB/SQL to confirm the write actually landed.
   - **Blocked by hardware/device** → close the loop via API first, and
     tell the user this is a stand-in for the real device test.
   - **Mobile** → drive the device and screenshot.
   - **Always use REAL data. Never mock data** unless the user explicitly
     asks for mock data.

3. **Confirm the plan (for non-trivial work).** Send the user the step plan
   plus how each step will be verified, before writing code. Obvious or
   small tasks may proceed directly with a one-line note.

4. **Build and verify step by step.** Each step must be proven by a REAL
   action on REAL data — not a simulated action and not an asserted
   success.

5. **On repeated failure (three or more).** Stop. Give a full cause
   analysis that FIRST rules out your own bug. Do NOT fake a pass and do
   NOT degrade or work around the problem. Re-plan from a new angle.

6. **End-to-end proof.** When everything is done, run one end-to-end
   verification. Save the evidence chain + screenshots to a TEMP directory
   (never the user's home root). In chat, give only a compact table:
   step → how verified → result → evidence path. The task is "done" ONLY
   after the user confirms.

## Leverage
- Dispatch an INDEPENDENT subagent for adversarial verification — let it
  try to DISPROVE that a step works, rather than confirm it.
- For multi-step or parallel verification, orchestrate it as a workflow.
