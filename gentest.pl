my %cmd =
      ( # key commands
        DEL         => undef,
        EXISTS      => 1,
        EXPIRE      => 2,
        EXPITEAT    => 2,
        KEYS        => 1,
        MOVE        => 2,
        OBJECT      => undef,
        PERSIST     => 1,
        RANDOMKEY   => 0,
        RENAME      => 2,
        RENAMENX    => 2,
        SORT        => undef,
        TTL         => 1,
        TYPE        => 1,
        EVAL        => undef,
       
        # string commands
        APPEND      => 2,
        DECR        => 1,
        DECRBY      => 2, 
        GET         => 1,
        GETBIT      => 2,
        GETRANGE    => 3,
        GETSET      => 2,
        INCR        => 1,
        INCRBY      => 2,
        MGET        => undef,
        MSET        => undef,
        MSETNX      => undef,
        SET         => 2,
        SETBIT      => 3,
        SETEX       => 3,
        SETNX       => 2,
        SETRANGE    => 3,
        STRLEN      => 1,

        # list commands
        BLPOP       => undef,
        BRPOP       => undef,
        BRPOPLPUSH  => 3,
        LINDEX      => 2,
        LINSERT     => 4,
        LLEN        => 1,
        LPOP        => 1,
        LPUSH       => undef,
        LPUSHX      => 2,
        LRANGE      => 3,
        LREM        => 3,
        LSET        => 3,
        LTRIM       => 3,
        RPOP        => 1,
        RPOPLPUSH   => 2,
        RPUSH       => undef,
        RPUSHX      => 2,

        # hash commands
        HDEL        => undef,
        HEXISTS     => 2,
        HGET        => 2,
        HGETALL     => 1,
        HINCRBY     => 3,
        HKEYS       => 1,
        HLEN        => 1,
        HMGET       => undef,
        HMSET       => undef,
        HSET        => 3,
        HSETNX      => 3,
        HVALS       => 1,

        # set commands
        SADD        => undef,
        SCARD       => 1,
        SDIFF       => undef,
        SDIFFSTORE  => undef,
        SINTER      => undef,
        SINTERSTORE => undef,
        SISMEMBER   => 2,
        SMEMBERS    => 1,
        SMOVE       => 3,
        SPOP        => 1,
        SRANDMEMBER => 1,
        SREM        => undef,
        SUNION      => undef,
        SUNIONSTORE => undef,

        # zset commands
        ZADD        => undef,
        ZCARD       => 1,
        ZCOUNT      => 3,
        ZINCRBY     => 3,
        ZINTERSTORE => undef,
        ZRANGE      => undef,
        ZRANGEBYSCORE => undef,
        ZRANK       => 2,
        ZREM        => undef,
        ZREMRANGEBYRANK => 3,
        ZREMRANGEBYSCORE => undef,
        ZREVRANK    => 2,
        ZSCORE      => 2,
        ZUNIONSTORE => undef,

        # connection commands
        AUTH        => 1,
        ECHO        => 1,
        PING        => 0,
        QUIT        => 0,
        SELECT      => 1,

        # server commands
        BGREWRITEAOF => 0,
        BGSAVE      => 0,
        'CONFIG GET' => 1,
        'CONFIG SET' => 2,
        'CONFIG RESETSTAT' => 0,
        DBSIZE      => 0,
        'DEBUG OBJECT' => 1,
        'DEBUG SEGFAULT' => 0,
        FLUSHALL    => 0,
        FLUSHDB     => 0,
        INFO        => 0,
        LASTSAVE    => 0,
        SAVE        => 0,
        SHUTDOWN    => 0,
        SLAVEOF     => 2,
        SLOWLOG     => undef,
        SYNC        => 0,
      );


foreach my $cmd( keys %cmd ) { 
    my $fn = 'cmd_' . lc $cmd;
    $fn =~ s/ /_/g;
    $fn .= '.t';

    open my $fh, '>', 't/' . $fn or die $!;
    print { $fh } <<"END";
#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use lib 't';

use Test::More;

# ABSTRACT: Tests for the Redis $cmd command.

use_ok 'RedisClientTest';

my \$redis = RedisClientTest->server;
done_testing && exit unless \$redis;

isa_ok \$redis, 'Redis::Client';

# TODO: write tests!

done_testing;

END

    print "wrote $fn\n";
}
