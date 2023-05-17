class Rumble < Formula
  desc "RumbleDB 1.21.0 'Hawthorn blossom' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.21.0/rumbledb-brew-1.21.0.zip"
  sha256 "f621f703e37858d213defde5412e069a12edccde7eb2b330388cb86f0bb1ac43"
  license "MIT"

  depends_on "apache-spark"
  depends_on "openjdk@11"

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
