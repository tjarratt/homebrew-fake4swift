class Fake4swift < Formula
  desc "Mock generator for swift"
  homepage "https://github.com/tjarratt/fake4swift"
  url "https://github.com/tjarratt/fake4swift.git",
    :tag => "2.0.0",
    :revision => "b6593710792258b280e9f9d27a2b3ccb9747269a"
  head "https://github.com/tjarratt/fake4swift.git"

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
