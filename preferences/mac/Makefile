before:
	defaults read > defaults_before.txt && defaults -currentHost read > defaults_currentHost_before.txt

after:
	defaults read > defaults_after.txt && defaults -currentHost read > defaults_currentHost_after.txt

diff:
	diff defaults_before.txt defaults_after.txt

hostdiff:
	diff defaults_currentHost_before.txt defaults_currentHost_after.txt

read:
	defaults read | less