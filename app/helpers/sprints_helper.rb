module SprintsHelper
  def datepicker_input form, field, startValue
    form.text_field(field, data: { provide: "datepicker",
                                   'date-format': 'yyyy-mm-dd',
                                   'date-autoclose': 'true',
                                   'date-today-btn': 'linked',
                                   'date-today-highlight': 'true',
                                   'value': startValue}).html_safe
  end
end
