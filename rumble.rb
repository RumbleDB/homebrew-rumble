class Rumble < Formula
  desc "RumbleDB 1.22.0 'Pyrenean oak' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.22.0/rumbledb-brew-1.22.0.zip"
  sha256 "10799baa62b930a6bbc62f8cfb7cd4bfbf76080cc491c0ebfe42f6f5f2e0f9ad"
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
