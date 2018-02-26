#  <#Title#>

)Is it possible to remove facebook events if user logs out from calendar?
This is behaviour of system calendar, so it should be possible somehow. When you disable integration, all events loaded from this integration are removed.

2)Imagine if user enables facebook integration in system calendar. Then all events will be displayed in Lilius calendar, even when integration is disabled. Is there a way to prevent this and display only non integrated events?

What differentiates evens from EventKit that are native and that were loaded from external source?

3)How often calendar refreshes events? I did some changes in facebook events and waited for some time, but changes were not loaded.
We should impletet some simple scheduler to refresh events.

4)When user first time enables facebook integration, mac slows down a little bit, so this operation is pretty heavy and intensive.
if this happens only first time, but not during scheduled updates, so it is not critical, otherwise it is a problem.

5)first UI change required right away is to change settings/integration panel and move facebook an google selectors into vertical split view, like in (System Calendar/Settings/Accounts), but right now without +/- button in the bottom. It will allow to add settings when in is required and leave space for future integrations.
