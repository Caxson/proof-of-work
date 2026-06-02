---
description: Run the verified-delivery workflow on the current task (or $ARGUMENTS).
---

Apply the **verified-delivery** skill to: $ARGUMENTS

If no argument is given, apply it to the current task. Decompose into steps,
attach a real verification to each (Playwright screenshot / SQL check / API
round-trip / device screenshot), use real data only, and produce an evidence
bundle. Do NOT mark anything done without user-confirmed proof.
