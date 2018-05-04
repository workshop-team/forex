var Layout = {
  showPanel: function(state){
    $.ajax({
      type: 'POST',
      url: '/requests/show_panel',
      data: { state: state }
    })
  }
}

$(document).on('collapsed.pushMenu', function(){
  Layout.showPanel(false)
});

$(document).on('expanded.pushMenu', function(){
  Layout.showPanel(true)
});
