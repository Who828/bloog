require 'minitest/autorun'
require_relative '../../app/models/post'

describe Post do
    before do
        @it = Post.new
    end

    it "starts with blank attributes" do
        @it.title.must_be_nil
        @it.body.must_be_nil
    end

    it "supports reading and writing title attribute" do
        @it.title = "foo"
        @it.title.must_equal "foo"
    end

     it "supports reading and writing body attribute" do
        @it.body = "foo"
        @it.body.must_equal "foo"
    end

    it "supports reading and writing blog referene" do
        blog = Object.new
        @it.blog = blog
        @it.blog.must_equal blog
    end

    it "supports setting the attributes in initializer" do
        it = Post.new(title: "mytitle", body: "mybody")
        it.title.must_equal "mytitle"
        it.body.must_equal "mybody"
    end

    describe '#publish' do
        before do
            @blog = MiniTest::Mock.new
            @it.blog = @blog
        end

        after do
            @blog.verify
        end

        it "adds the post to the blog" do
            @blog.expect :add_entry,nil, [@it]
            @it.publish
        end
    end
end