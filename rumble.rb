class Rumble < Formula
  desc "RumbleDB 1.22.0 'Pyrenean oak' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.22.0/rumbledb-brew-1.22.0.zip"
  sha256 "8d3f63ed12564e6e3c356a08c3ab37511b60cb2065b3a53e2238390d76a0dbdd"
  license "MIT"

  depends_on "apache-spark"

  def install
    lib.install Dir["*"]
    bin.install Dir[lib/"bin/*"]
    bin.env_script_all_files(lib/"bin", SPARK_HOME_BIN: Formula["apache-spark"].bin)
  end

  test do
    assert_match "2",
      pipe_output(bin/"rumbledb -q '1+1'")
  end
end
