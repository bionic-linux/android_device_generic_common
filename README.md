# GSI Specific Packages

This document introduces some GSI specific packages that are installed to the
system_ext partition, and the reason why GSI needs those packages is for
supporting all devices by an unique image.

## Changes in resource overlays

### SystemUI overlays

Some devices access the private android framework resource by `@*android:`
while overlaying their SystemUI setting `status_bar_header_height_keyguard`,
and the private resource is unstable so referencing it in non-GSI partitions
might cause some problems (b/245806899).

In order to prevent from getting SystemUI crash, GSI adds a runtime resource
overlay in the system_ext partition, which is having the greatest overlay
precedence so this can override all the wrong device settings.

Lifetime of this package:
* Starts at: Android 14.
* Deprecation plan: TBD, depends on b/254581880.
