# Tiny things that are useful 


## afk

## colortest

## fixopenwith

## noncommittal
Scan a list of git repositories for statuses that are out of step if the
following ways:

1.  Non-committed files that are more than 60m old
2.  Unpushed changes
3.  Unpulled changes

If any are found, display a growl notification.

You wouldn't generally run this yourself - stick a launchctl script in and tell
it to run every 10m

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>uk.co.leftbrained.noncommittal</string>
	<key>ProgramArguments</key>
	<array>
		<string>/Users/gavin/Code/home/binfiles/noncommittal</string>
	</array>
	<key>RunAtLoad</key>
	<false/>
	<key>StartInterval</key>
	<integer>600</integer>
</dict>
</plist>
```


## pd

## prowl
