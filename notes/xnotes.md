





recording sessions show page
- 
Create Below:
New Session | New Artist | New Studio | New Engineer





need to write a blog post
   use the project readme (download it?)
need to record a walk-through
Add to calendar => study groups and sessions

JS catch up
:lesson


:videos


:miniprojects






time stuff

select_time 1
   <%=    select_time(datetime = Time.current, options = {}, html_options = {}, ) %>
   <br>
select_time 2
   
<%=    my_time = Time.now + 0.days + 0.hours + 0.minutes + 0.seconds %>
<%=    select_time(my_time) %>
   <br>
select_time 3
   
<%=    select_time(Time.now, time_separator: ':', ampm: true , start_hour: 2, end_hour: 14) %>
<br>
<br>
year select
<%=    select_year(Date.today, field_name: 'current_year') %>
<br>
<br>
15 step time select
<%=    time_select 'game', 'game_time', {minute_step: 15} %>

<br>
<br>
Today's date (tag)
<%=    time_tag Date.today %>
<br>










