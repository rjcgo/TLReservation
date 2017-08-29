$ ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link) 
    false 

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    html = """
            <div class="modal-dialog" style="max-width: 396px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="modal-close dismiss">&times;</button>
                        <h3 class="modal-title">
                            <i class="fa fa-exclamation-triangle"></i> Confirm
                        </h3>
                    </div>
                    <div class="modal-body">
                        <p class="modal-text" style="text-align: center;">#{message}</p>
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group">
                            <div class="form-group">
                                <a class="modal-btn bg-red confirm">
                                    <i class="fa fa-check"></i> Confirm</a>
                            </div>
                            <div class="form-group">
                                <a class="modal-btn dismiss">
                                    <i class="fa fa-times"></i> Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           """
    confirmationDialog = $('#confirmationDialog');
    confirmationDialog.html($(html));
    confirmationDialog.addClass('show');
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)

    $('.dismiss').on 'click', -> $(this).closest('.modal').removeClass("show");