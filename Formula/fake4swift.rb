class Fake4Swift < Formula
  desc "Mock generator for swift"
  homepage "https://github.com/tjarratt/fake4swift"
  url "https://github.com/tjarratt/fake4swift.git"

  depends_on :xcode => ["8.1", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"ExampleProtocol.swift").write <<-EOF
    protocol Example { }
    EOF

    system bin/"fake4swift", "ExampleProtocol.swift", "Example"
  end
end
