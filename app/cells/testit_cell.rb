class TestitCell < Cell::ViewModel

  def show
    Rails.logger.debug "DEBUG(testit.call(:show)) This: #{model} #{__method__}, #{__FILE__}:#{__LINE__}"
    render
  end

  def test
    Rails.logger.debug "DEBUG(testit.call(:test)): #{__method__}, #{__FILE__}:#{__LINE__}"
    "METHOD: this is a test"
  end
end