Facter.add(:dreadmin_os) do
    setcode do
        osname = Facter.value(:operatingsystem)
        maj = Facter.value(:os)['release']['major']
        min = Facter.value(:os)['release']['minor']
        osname + " " + maj + "." + min
    end
end
