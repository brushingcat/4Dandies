module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| msg }.join
    html = <<-HTML
        <script>
          $(document).ready(function(){(function() {
            setTimeout( function() {
              // create the notification
              var notification = new NotificationFx({
                message : '<div class="ns-thumb"><img src="http://findicons.com/files/icons/42/basic/64/warning.png" height="64" width="64"/></div><div class="ns-content"><p>#{messages}</p></div>',
                layout : 'other',
                ttl : 6000,
                effect : 'thumbslider',
                type : 'notice', // notice, warning, error or success
                onClose : function() {
                }
              });

              // show the notification
              notification.show();

            }, 1200 );
          })();
          });
        </script>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end