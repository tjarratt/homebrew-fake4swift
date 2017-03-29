class Fake4swift < Formula
  desc "Mock generator for swift"
  homepage "https://github.com/tjarratt/fake4swift"
  url "https://github.com/tjarratt/fake4swift.git",
    :tag => "v3.1.0",
    :revision => "ee72121f071f6432686fd90f3c38f59981edf576"
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
