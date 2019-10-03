# alfred-workflows-addcalendarevent

Workflow for Alfred 2 (and 3) to add an event in Calendar.

Just type:

`cal [event] at [time][am|pm] [on [date]] [dur] [every] in [location] @[calendar name] alarm [X min|hour|day|month|year]`

![01](./readme/02.jpg)

`cal default`

![Example](./readme/03.jpg)

## Just have in mind some keywords:

at - on - dur - every - in - @ - alarm

## First execution

When you execute the cal command for the first time, Calendar will pop a dialog like this:

![Example](./readme/03.jpg)

You have to select the default Calendar name that will be used to create new events.

You can change it later typing:

`cal default`

## See some examples:

cal meet my mother at 15:00 on 10/03/2013 in ShoppingM @Personal alarm 0 minute 30 minutes 1 h 8 hours

Create an event, using "Personal" calendar, with 4 sound alarms - at the time of event, 30 minutes before, 1 hour before and 8 hours before.

Or just:

cal some important event at 9pm tomorrow dur 4 hours

Create an event tomorrow from 9pm to 1am

You can omit "at" for "all day event"

![01](./readme/01.jpg)

## More examples:

    cal event at 14 on 21 dur 1 h
    cal event at 14 tomorrow alarm 0 m 10 h 5 days 1 month 1 year
    cal event at 14 on 21/04 alarm 1 d 5 days
    cal event today
    cal event tomorrow
    cal event at 15 on 28/03/13 dur 4 days
    cal event on 25 every year
    cal event at 15 every monday
    cal event every month
    cal event at 15 on 28 in Museum alarm 10 d 2 months
    cal event at 11pm on 23
    cal event at 10 pm today dur 2 h
    cal event at 9pm tomorrow alarm 5 days
    cal event at 11 am tomorrow
    cal event at 11 tomorrow
    cal event at 15 on friday
    cal event at 14 on mon
    cal event at 2pm on saturday
    cal event at 2pm on sat every day
    
 <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=rtoshiro%40gmail%2ecom&lc=US&item_name=Toshiro&no_note=0&currency_code=BRL&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHostedGuest"><img border="0" alt="Visualizar imagem" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" /></a>
