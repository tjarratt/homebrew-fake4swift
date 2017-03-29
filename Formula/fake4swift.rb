class Fake4swift < Formula
  desc "Mock generator for swift"
  homepage "https://github.com/tjarratt/fake4swift"
  url "https://github.com/tjarratt/fake4swift.git",
    :tag => "v3.1.1",
    :revision => "7afacdf7a68d4c62573d57d655a124ab8bfbdd5f"
  head "https://github.com/tjarratt/fake4swift.git"

  depends_on :xcode => ["8.1", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}", "-j", "1"
  end

  test do
    (testpath/"ExampleProtocol.swift").write <<-EOF
    protocol Example { }
    EOF

    system bin/"fake4swift", "ExampleProtocol.swift", "Example"
  end
end
