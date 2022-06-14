class Rumble < Formula
  desc "RumbleDB 1.18.0 'Scarlet Ixora' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.19.0/rumbledb-brew-1.19.0.zip"
  sha256 "5a648f259d5b7cbc8597f26e8e9a38f31acdfc9e34284b1f0712897ae0b2715c"
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
