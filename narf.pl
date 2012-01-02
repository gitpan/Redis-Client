        if (!$@) {
        print "sending commands\n";
            $ssh->exec("stty raw -echo");
            $ssh->send("php -version\n");
            my $return = $ssh->peek(5);
            $return =~ s/(PHP [0-9]+.[0-9]+.[0-9]+) [^#]+# [^#]+#/$1/;
            print $return . "\nDone\n";
        }
