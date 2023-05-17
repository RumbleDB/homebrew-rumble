class Rumble < Formula
  desc "RumbleDB 1.21.0 'Hawthorn blossom' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.21.0/rumbledb-brew-1.21.0.zip"
  sha256 "cf4d56d9001a38dffbcb1d4d0aec0f10b0a9e346cccda9e6c072a1d1fc414c38"
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
