# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require_tree .

getTooltipPos = (element, tooltip) ->
  top = element.position().top
  left = element.position().left

  top -= tooltip.outerHeight()
  left += element.outerWidth()

  {top: top, left: left}
 
showTooltip = (event) ->
  $('div.tooltip').remove()
  hint = $(this).find("span.hint").text()
  return if not hint.length
  tooltip = $('<div class="tooltip">'+hint+'</div>')
  tooltip.css(getTooltipPos($(this), tooltip))
  tooltip.appendTo(this)
  tooltip.fadeIn()
 
hideTooltip = -> $('div.tooltip').fadeOut()

button_replace = (form, button, text) ->
  link = "<a href=\""
  link += "javascript:$('"
  link += form
  link += "').find('"
  link += button
  link += "').click();\">"
  link += text
  link += "</a>"
  $(form).find(button).after(link)
  $(form).find(button).css({display: "none"})

$(document).ready ->
  $('.product-small').click ->
    window.location=$(this).find('a').attr('href')

  button_replace("#navigation form", "#logout", "Logout")
 
	$(".simple_form .input").bind({
	   mouseenter: showTooltip,
	   mouseleave: hideTooltip
  })

  $("button#change-payment").bind({
    click: ->
      $("#payment-form").show()
      $("#payment-summary").hide()
  })

###
# Google web fonts
WebFontConfig = {
  google: { families: [ 'Arvo:700:latin', 'Molengo:latin' ] }
}
(->
  wf = document.createElement('script')
  wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
    '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js'
  wf.type = 'text/javascript'
  wf.async = 'true'
  s = document.getElementsByTagName('script')[0]
  s.parentNode.insertBefore(wf, s)
)()
###
