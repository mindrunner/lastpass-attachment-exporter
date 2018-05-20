# lastpass-attachment-exporter
Exports all Attachments from lastpass. Make sure, you run this in from a safe
place, for example an encrypted hard drive. All your attachements will be
cleartext readable.

## prerequisites
This script uses [lastpass-cli](https://github.com/lastpass/lastpass-cli). Make
sure, you are already logged in.

bash
sed
awk
grep
tr

## usage
1) login via `lpass login`
2) run ./lpass-att-export.sh
3) check subfolder 'lpass-export'

