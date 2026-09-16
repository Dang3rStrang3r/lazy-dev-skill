# lazy-dev

> Answer first. No fluff. Code that ships.

An [Agent Skill](https://docs.claude.com/en/docs/claude-code/skills) that forces AI coding agents to stop writing essays and start writing code.

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
- **No flattery.** No "Great question!", no "I'd be happy to help!
- **No unrequested abstractions.** YAGNI, enforced.
- **Deletion over addition.** The best code is the code never written.
- **Stdlib first.** Native features over dependencies.

## Live Demo

Tested with Gemini (free, browser). Pasted `SKILL.md` as first message, then ran three prompts.

### Setup

![Setup](docs/demo-setup.png)

### Default mode -- `full`

**Prompt:**
> Fix this: my Python code raises IndexError when list is empty. Write a function that returns the first element or None.

**Output:**
```python
def first_or_none(lst):
    return lst[0] if lst else None
```
> skipped: [error handling], add when [logging required].

![Full mode](docs/demo-full.png)

### Ultra mode

**Prompt:**
> /lazy-dev ultra
> Fix this: I need to validate user email, username, and password on signup.

**Output:**
```python
import re

def validate_signup(username: str, email: str, password: str) -> bool:
    return bool(
        username and len(username) >= 3 and
        re.match(r"^[^A\s]+@[^@\s]+\.[^@\s]+$", email) and
        password and len(password) >= 8
    )
```
> skipped: [detailed error dicts], add when [UX requires field-specific feedback].

![Ultra mode](docs/demo-ultra.png)

### Lite mode

**Prompt:**
> /lazy-dev lite
> Refactor this: def add(a, b): result = a + b; return result

**Output:**
```python
def add(a, b):
    return a + b
```
> Lazier: use the + operator directly.

![Lite mode](docs/demo-lite.png)

## Install

### Claude Code
```bash
git clone https://github.com/Dang3rStrang3r/lazy-dev-skill ~/.claude/skills/lazy-dev
```

### Cursor
```bash
git clone https://github.com/Dang3rStrang3r/lazy-dev-skill ~/.cursor/skills/lazy-dev
```

### Gemini CLI
```bash
git clone https://github.com/Dang3rStrang3r/lazy-dev-skill ~/.gemini/skills/lazy-dev
```

### Manual
Copy `SKILL.md` into your agent's skills directory.

## Intensity Levels

| Level | Behavior |
|-------|----------|
| `lite` | Build what's asked, mention lazier alternative in one line |
| `full` | (default) Ladder enforced, stdlib first |
| `ultra` | YAGNI extremist, deletion before addition |

Switch: `/lazy-dev lite` / `/lazy-dev full` / `/lazy-dev ultra`
Disable: `stop lazy-dev`

## License

MIT

