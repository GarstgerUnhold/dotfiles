module MyIRB

  raise LoadError, "This needs to be Rubinius." unless rubinius?

  def get_source an_object
    case an_object
    when String then an_object
    else raise ArgumentError, "Don't know how to get source of #{an_object}"
    end
  end

end