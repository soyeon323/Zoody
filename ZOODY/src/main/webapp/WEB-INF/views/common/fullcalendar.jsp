<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

</head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

<style>


/* 캘린더 조상 */
.fc {
  font-size: 16px;
}



.fc-theme-standard td {
  border: none;
  
}

.fc .fc-daygrid-day-top {
  display: flex;
  justify-content: center;
}

/* 오늘 날짜 */
.fc .fc-daygrid-day.fc-day-today {
  background-color: rgba(72, 119, 239, 0.171);
  border-radius: 5px;
}

  td.fc-day.fc-day-fri.fc-day-today.fc-daygrid-day:hover {
    background-color: #4877efc4;
    color: #fff;
  }

.fc-day-today > .fc-daygrid-day-frame.fc-scrollgrid-sync-inner >.fc-daygrid-day-top {
  box-sizing: border-box;
}

/* items */
.fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {
  min-height: 10;
}

/* table */
.fc .fc-scrollgrid-liquid {
    height: 100%;
    border: none;
}


/* table header items*/
table td[class*=col-], table th[class*=col-] {
    border: none;
}

</style>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      width: 100 + '%',
      height: 90 + '%' ,
      aspectRatio: 1,
      
      titleFormat : { year: 'numeric', month: 'long' }, 

    });
    
    calendar.render();
    
  });
  
  

 
  

  

</script>