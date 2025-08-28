class Rumble < Formula
  desc "RumbleDB 1.22.0 'Pyrenean oak' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v2.0.0/rumbledb-2.0.0-brew.zip"
  sha256 "227684dd26b8d6bb6e431a66eff61b169b5c8f1214ee628ed6d8c60148da3c2a"
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
