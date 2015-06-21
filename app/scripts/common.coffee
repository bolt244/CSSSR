$ ->
	slide = ->
		val = $('.form__js__range').val()
		if val < 75 then val = 0
		else if val >= 75 && val < 265 then val = 150 
		else if val >=265 && val < 571 then	val = 379
		else if val >= 571 then val = 760
		$('.form__js__range').val val

	$('.form__js__range').on 'input', ->
		slide()

	$('.form__js__range').on 'change', ->
		slide()

	$('.form__js__label-one').click ->
		$('.form__js__range').val 0

	$('.form__js__label-two').click ->
		$('.form__js__range').val 150

	$('.form__js__label-three').click ->
		$('.form__js__range').val 379

	$('.form__js__label-four').click ->
		$('.form__js__range').val 762
