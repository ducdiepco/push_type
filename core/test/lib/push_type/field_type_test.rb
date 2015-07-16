require "test_helper"

module PushType
  describe FieldType do

    let(:field) { PushType::FieldType.new :foo, opts }
    let(:val)   { '1' }
    
    describe 'default' do
      let(:opts) { {} }
      it { field.name.must_equal 'foo' }
      it { field.param.must_equal :foo }
      it { field.kind.must_equal 'field' }
      it { field.json_key.must_equal :foo }
      it { field.template.must_equal 'default' }
      it { field.label.must_equal 'Foo' }
      it { field.html_options.must_equal({}) }
      it { field.form_helper.must_equal :text_field }
      it { field.column_class.must_equal nil }
      it { field.to_json(val).must_equal '1' }
      it { field.from_json(val).must_equal '1' }
    end

    describe 'with options' do
      let(:opts)  { { template: 'my_template', label: 'Bar', html_options: { some: 'opts' }, form_helper: :number_field, colspan: 2 } }
      it { field.template.must_equal opts[:template] }
      it { field.label.must_equal opts[:label] }
      it { field.html_options.must_equal opts[:html_options] }
      it { field.form_helper.must_equal opts[:form_helper] }
      it { field.column_class.must_equal 'medium-6' }
    end

  end
end
