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



TODO: May 18
1)current date circle is not moved to next day when day is switched. App should be exited and realunched to make date correct.
OK, it can be fixed even without relaunching the app.
2)Event longer than 1 day is shown only in first day of the series. It should be shown in all days when event occured.
-OK, I will check and fix.

3)Not clear when event from calendar is shown. I though it should be shown righw away, when yo create event in iCal, but it does not happen. Event is not shown on the pane after I create new one. But when I create event from the lilius (+) button, everything is updated.
Looks like events from iCal are not read regularly after app starts. It should work transparently to user.

-OK, I think we don’t have immediate refresh mechanism from iCal. I will add it.

4)List of events in the left pane is not adjusted when number of events is bigger than the window. It should adjust automatically to fit all events of the day and up to the sie of the main calendar window on the right, but no more. (So they are equal at the end).
-OK, I will fix it.

5)Event with long description does not fit the cell. I am not sure how to do it the best, as description may be too long, but if possible make 2 lines of text when required. But it should not affect other 3 columns.


One way it to show small text as it is showing right now, and on mouse hover, we can show full details, or we can make cell height to show two lines. Please let me know.

Other question:
how to process reminders from google calendar? Is it possible to save them in reminders app? Right now they are not loaded.

We should add UI for facebook and google integration. Basic settings - how often to refresh, and what to load.
For facebook events - how often to refresh, load events by status (interested/going etc)
For google - how often to refresh, what calendars ot load. So it should detect what calendars are there and what should be displayed.


