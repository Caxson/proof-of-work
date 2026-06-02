---
name: evidence-first-debugging
description: Use when diagnosing a failure, bug, freeze, crash, or any "why doesn't this work" — gather concrete evidence (logs, real data, a reproduction) BEFORE naming a root cause, rule out your own code first, rank hypotheses by confidence with the supporting evidence attached, and fix the root cause rather than the symptom the log happens to surface.
---

# Evidence-First Debugging

Diagnosis is evidence, not guessing.

## Rules

1. **Read the logs / code first.** Never state "it fails because X" before
   you have read the relevant logs and code. No log read → no conclusion.

2. **Suspect yourself first.** Default hypothesis: your own code, logic, or
   angle is wrong — not the environment, permissions, or hardware. Rule out
   your own bug with evidence before blaming anything external. (Classic
   trap: retrying your own broken input code, then blaming "permissions"
   and quitting.)

3. **One story, not many.** A different "cause" each turn means you are
   guessing. Stop and return to the evidence.

4. **Rank hypotheses with evidence.** List candidate causes, each with the
   specific evidence that confirms or refutes it and a confidence level. Do
   not commit to a fix until the top hypothesis is supported by data.

5. **Fix the root, not the symptom.** Solve the actual mechanism (e.g.
   "incomplete data"), not the single field the log printed. Never delete
   data or run on a degraded state just to make the error disappear — that
   creates new bugs downstream.

## Leverage
Dispatch an INDEPENDENT subagent to investigate noisy areas or to
adversarially challenge your conclusion. A fresh perspective is the fastest
way out of "I kept ramming my own wrong assumption." For broad log/grep
sweeps, offload to a subagent and keep only the findings in main context.
