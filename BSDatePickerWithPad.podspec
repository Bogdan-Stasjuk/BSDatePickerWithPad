Pod::Spec.new do |s|
  s.name             	= "BSDatePickerWithPad"
  s.version          	= "0.0.1"
  s.summary          	= "UIDatePicker with UITextField and BSNumPad."
  s.description      	= "UIDatePicker with UITextField and BSNumPad for entering datetime."
  s.homepage         	= "https://github.com/Bogdan-Stasjuk/BSDatePickerWithPad"
  s.license      		= { :type => 'MIT', :file => 'LICENSE' }
  s.author           	= { "Bogdan Stasjuk" => "Bogdan.Stasjuk@gmail.com" }
  s.source           	= { :git => "https://github.com/Bogdan-Stasjuk/BSDatePickerWithPad.git", :tag => '0.0.1' }
  s.social_media_url = 'https://twitter.com/Bogdan_Stasjuk'
  s.platform     		= :ios, '6.0'
  s.requires_arc 	= true
  s.source_files 	= 'BSDatePickerWithPad/*.{h,m}'
  s.public_header_files   	= 'BSDatePickerWithPad/*.h'
end
