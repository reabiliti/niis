class OrderPdf < Prawn::Document
  def initialize(certificate, setting)
    super(margin: [0,0,0,0])
    @certificate = certificate
    @setting = setting
    bg_setup
    font_setup
    cer_number
  end

  def cer_number
    draw_text @certificate.cer_number, :at => [230,652], size: 12, style: :bold
    draw_text (@certificate.cer_validity_from).strftime("%d.%m.%Y"), :at => [315,630], size: 12, style: :bold unless @certificate.cer_validity_from.nil?
    draw_text (@certificate.cer_validity_to).strftime("%d.%m.%Y"), :at => [443,630], size: 12, style: :bold unless @certificate.cer_validity_to.nil?

    at_h = 590
    @setting.set_organization.split("\r\n").each_with_index do |sorg, index|
      index == 0 ? (draw_text sorg, :at => [230, at_h], size: 12, style: :bold) : (draw_text sorg, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    at_h = 519
    @certificate.cer_product_name.split("\r\n").each_with_index do |cpn, index|
      index == 0 ? (draw_text cpn, :at => [140, at_h], size: 12, style: :bold) : (draw_text cpn, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    draw_text @certificate.cer_code_okp, :at => [480,490], size: 12, style: :bold
    draw_text @certificate.cer_code_tn_ved, :at => [480,410], size: 12, style: :bold

    at_h = 425
    @certificate.cer_regulation.split("\r\n").each do |creg|
      draw_text creg, :at => [59, at_h], size: 12, style: :bold
      at_h -= 12
    end

    at_h = 350
    @certificate.cer_manufacturer.split("\r\n").each_with_index do |cmnf, index|
      index == 0 ? (draw_text cmnf, :at => [159, at_h], size: 12, style: :bold) : (draw_text cmnf, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    at_h = 299
    @certificate.cer_certificate_issued.split("\r\n").each_with_index do |cci, index|
      index == 0 ? (draw_text cci, :at => [190, at_h], size: 12, style: :bold) : (draw_text cci, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    at_h = 247
    @certificate.cer_based.split("\r\n").each_with_index do |cbased, index|
      index == 0 ? (draw_text cbased, :at => [165, at_h], size: 12, style: :bold) : (draw_text cbased, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    at_h = 146
    @certificate.cer_more_info.split("\r\n").each_with_index do |cmi, index|
      index == 0 ? (draw_text cmi, :at => [276, at_h], size: 12, style: :bold) : (draw_text cmi, :at => [59, at_h], size: 12, style: :bold)
      at_h -= 12
    end

    draw_text @certificate.cer_org_chief, :at => [428,85], size: 12, style: :bold
    draw_text @certificate.cer_org_expert, :at => [428,60], size: 12, style: :bold

  end

  def bg_setup
    bg = "public/pdf/cert_filled.jpg"
    image bg, at: [ 0, bounds.height ], width: bounds.width, height: bounds.height
  end

  def font_setup
    font_families.update("TimesNewRoman" => {
      :normal => "vendor/assets/fonts/TimesNewRomanRegular/TimesNewRomanRegular.ttf",
      :italic => "vendor/assets/fonts/TimesNewRomanItalic/TimesNewRomanItalic.ttf",
      :bold => "vendor/assets/fonts/TimesNewRomanBold/TimesNewRomanBold.ttf",
    })
    font "TimesNewRoman"
  end

end
