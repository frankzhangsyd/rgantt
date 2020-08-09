HTMLWidgets.widget({

  name: 'rgantt',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

        return {
      renderValue: function(x) {

       var tasks = HTMLWidgets.dataframeToD3(x.data);
       var gantt = new Gantt("#"+el.id, tasks);
       gantt.change_view_mode('Week');

	     var button1 = '<button type="button" class="btn btn-sm btn-light">Quarter Day</button>';
	     var button2 = '<button type="button" class="btn btn-sm btn-light">Half Day</button>';
	     var button3 = '<button type="button" class="btn btn-sm btn-light">Day</button>';
	     var button4 = '<button type="button" class="btn btn-sm btn-light active">Week</button>';
	     var button5 = '<button type="button" class="btn btn-sm btn-light">Month</button>';

	     $("#htmlwidget_container").append(button1,button2,button3,button4,button5);

       $(function() {
        $("button").click(function(){
            $btn = $(this);
            var mode = $btn.text();
            gantt.change_view_mode(mode);
            $btn.parent().find('button').removeClass('active');
            $btn.addClass('active');
            $('.gantt .bar-progress').css('fill', x.barcolor);
        });
       });

       $('.gantt .bar-progress').css('fill', x.barcolor);




    },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
