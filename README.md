# lazy-dev

> Answer first. No fluff. Code that ships.

A [Agent Skill](https://docs.claude.com/en/docs/claude-code/skills) that forces AI coding agents to stop writing essays and start writing code.

## The Problem

You ask for a bug fix. You get:
- "Great question! Let me think about this..."
- 3 paragraphs of context
- An abstract interface with one implementation
- A factory class for a function that returns a string
- The actual fix, buried on line 87

## The Fix

`lazy-dev` enforces a lazy senior dev mindset:

- **Answer first.** Code, then max 3 lines of explanation.
- **No flattery.** No "Great question!", no "I'd be happy to help!"
- **No unrequested abstractions.** YAGNI, enforced.
- **Deletion over addition.** The best code is the code never written.
- **Stdlib first.** Native features over dependencies.

## Example

**Before:**
> Great question! To fix this bug, we could create an `AbstractUserValidatorFactory` that...
> *(200 more lines)*

**After:**
> ```python
> if not user.email:
>     raise ValueError("email required")
> ```
> skipped: validator class, add when 2nd rule appears.

## Install

### Claude Code
```bash
git clone https://github.com/YOUR-USERNAME/lazy-dev-skill ~/.claude/skills/lazy-dev