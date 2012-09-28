logger = Object.new

def logger.info(*args)
  p args
end

logger.info 'some message'
