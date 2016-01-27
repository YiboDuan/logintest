class Author
    def self.authenticate(username, password, uip)
        usr = User.find_by(username: username)
        if ! usr
            return nil
        end

        if ! usr.authenticate(password)
            return nil
        end

        ip = IPAddr.new uip

        usr.rules.each do |r|
            range = IPAddr.new r.cidr
            in_range = range.include?(ip)
            if r.deny? and in_range
                return false
            end

            if r.allow? and not in_range
                return false
            end
        end

        return usr.id
    end
end
