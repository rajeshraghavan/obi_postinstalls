require 'erb'
@environment_name='pbi'
@version_number='poc'
@bu_name = 'crp'
@env_name = 'dev'
@ver_no = '11_1_1_7'
temp = File.open("/local/mnt/workspace/repos/obiee_11117_install/templates/response.erb", "rb").read
#temp = File.open("/tmp/test.erb", "rb").read
renderer = ERB.new(temp)
puts output = renderer.result()
