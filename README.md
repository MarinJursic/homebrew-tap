# Homebrew tap

Homebrew formulae for installing checksum-pinned Fixcard release binaries.

## Fixcard

[Fixcard](https://github.com/MarinJursic/fixcard) is local, inert memory for
recurring development failures. Install the newest release candidate with a
fully qualified formula name:

```bash
brew install MarinJursic/tap/fixcard
fixcard --version
fix --version
```

The fully qualified command trusts only this formula rather than every formula
that may be added to the tap. Homebrew downloads the upstream, checksummed
binary for the current operating system and CPU architecture.

Formula changes are tested on Intel and ARM variants of macOS and Linux. Report
Fixcard product or binary issues in the
[Fixcard repository](https://github.com/MarinJursic/fixcard/issues); report tap
or installation metadata issues in this repository.
