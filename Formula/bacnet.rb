class Bacnet < Formula
  desc "An open-source implementation of the BACnet application, network layer, and MAC layers."
  homepage "http://bacnet.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/bacnet/bacnet-stack/bacnet-stack-0.8.5/bacnet-stack-0.8.5.tgz"
  sha256 "4b80e2909162082e6b0025319ff8b360472a0eee41593ef4fb40fbe27a098217"

  def install
    system "make", "BACNET_PORT=bsd"

    system "install", "-d", "#{prefix}/lib"
    system "install", "-m", "644", "lib/libbacnet.a", "#{prefix}/lib"
    system "install", "-d", "#{prefix}/include/bacnet"
    system "find", "include", "-name", "*.h", "-exec",
           "install", "-m", "644", "{}", "#{prefix}/include/bacnet", "\;"
    system "install", "-m", "644",
           "ports/bsd/net.h",
           "ports/bsd/stdbool.h",
           "ports/bsd/timer.h",
           "#{prefix}/include/bacnet"
    system "install", "-d", "#{prefix}/bin"
    system "install",
           "bin/bacarf",
           "bin/bacawf",
           "bin/bacdcc",
           "bin/bacepics",
           "bin/baciamr",
           "bin/bacinitr",
           "bin/bacrbdt",
           "bin/bacrd",
           "bin/bacroute.sh",
           "bin/bacrp",
           "bin/bacrpd.sh",
           "bin/bacrpm",
           "bin/bacrr",
           "bin/bacscov",
           "bin/bacserv",
           "bin/bacts",
           "bin/bacucov",
           "bin/bacupt",
           "bin/bacwh",
           "bin/bacwi",
           "bin/bacwir",
           "bin/bacwp",
           "bin/bvlc.sh",
           "#{prefix}/bin"
  end

end
