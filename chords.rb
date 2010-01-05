require 'rubygems'
require 'pp'
$KCODE = 'u'
input1 = "У [Am]синего мо[Dm]ря, где[G] бушу[C]ют бураны"
input2 = "Ты моряка, я моряк, ты рыбачка, я рыбак"

def parse input
  input = input.gsub(' ', '&nbsp;')
  chords = []
  text = []
  input.split(%r{\[(.*?)\]}).each_with_index do |element, index|
    if index % 2 != 0
      chords << element
    else
      text << element
    end
  end
  chords.insert(0, '&nbsp;') if chords != [] && input[0..0] != '['
  return {:text => text, :chords => chords}
end

def line text, chords = nil
  result = '<table cellspacing="0" cellpadding="0">'
  if chords and !chords.empty?
    result +=  '<tr>'
    chords.each { |chord| result +=  "<td>#{chord}</td>"}
    result +=  '</tr>'
  end
  result +=  '<tr>'
  text.each { |txt| result +=  "<td>#{txt}</td>"}
  result +=  '</tr>'
  result += '</table>'
  return result
end

result = parse(input1)
puts line(result[:text], result[:chords])
result = parse(input2)
puts line(result[:text], result[:chords])