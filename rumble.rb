class Rumble < Formula
  desc "RumbleDB 1.21.0 'Hawthorn blossom' for Apache Spark"
  homepage "https://rumbledb.org/"
  url "https://github.com/RumbleDB/rumble/releases/download/v1.21.0/rumbledb-brew-1.21.0.zip"
  sha256 "7525273c0b7dda417fba4eb6dab59b37a05878a5dfd8b4e85bde20094956e94f"
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
