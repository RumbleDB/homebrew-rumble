class Rumble < Formula
  desc "RumbleDB 1.18.0 'Scarlet Ixora' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.18.0/rumbledb-brew-1.18.0.zip"
  sha256 "6978bfe36659493affbbf4e058497f435392620d57565ccd473b803de5d49810"
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
