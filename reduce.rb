# Ruby code for reduce.rb

@validation_array = []
@fieldgrabber = false
md5 = nil
FIELDGRABBER_PAYLOAD = '0'


def store_row(value)
    if value == FIELDGRABBER_PAYLOAD
        warn "setting fieldgrabber true"
        @fieldgrabber = true
    else
        warn "adding row to storage"
        @validation_array.push(value)
    end
end

def reset_storage()
    @validation_array.clear()
    @fieldgrabber = false
end

def print_rows()
    warn "Fieldgrabber value is: #{@fieldgrabber}"
    warn @validation_array.inspect
    if !@fieldgrabber
        @validation_array.each do |line|
            puts line
        end
    end
end

ARGF.each do |line|
    line = line.chomp
    (key, value) = line.split(/\t/)
    warn "#{md5}, #{key} "
    if md5 != key
        warn "printing rows"
        print_rows()
        md5 = key
        reset_storage()
    end
    store_row(value)
end
