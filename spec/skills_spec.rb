require 'spec_helper'

module BlackSpeech
  describe ".speak" do
    it "creates a skill template" do
      BlackSpeech.speak { skill :new_skill_for_tests }
      
      # A new template module must have been created
      WarTroll::Skills::Templates.exists?(:new_skill_for_tests).must_equal true
      
      # The new module should respond to #name, #full_name, #dependent_stat and #category
      t = WarTroll::Skills::Templates.fetch(:new_skill_for_tests)
      o = Object.new.extend(t)
      o.handle.must_equal :new_skill_for_tests
      o.handle.must_equal :new_skill_for_tests
      o.dependent_stat.must_be_nil
      o.category.must_be_nil
    end
    
    it "creates a new Skill module with a dependent_stat" do
      BlackSpeech.speak { skill :new_skill_for_tests, stat: :foo }
      
      o = Object.new.extend(WarTroll::Skills::Templates.fetch(:new_skill_for_tests))
      o.dependent_stat.must_equal :foo
    end
  end
  
  describe "Skills" do
    describe "category" do
      it "creates a Skills::Templates with a category" do
        BlackSpeech.speak do
          category :new_category_for_tests do
            skill :new_skill_for_tests
          end
        end
      
        # A new namespaced module has been created
        WarTroll::Skills::Templates.category_exists?(:new_category_for_tests).must_equal true
        WarTroll::Skills::Templates.exists?(:'new_category_for_tests/new_skill_for_tests').must_equal true
        
        t = WarTroll::Skills::Templates.fetch(:'new_category_for_tests/new_skill_for_tests')
        o = Object.new.extend(t)
        o.handle.must_equal :'new_category_for_tests/new_skill_for_tests'
        o.dependent_stat.must_be_nil
        o.category.must_equal :new_category_for_tests
      end
    
      it "assigns its own dependent_stat to its skills" do
        BlackSpeech.speak do
          category :new_category_for_tests, stat: :bar do
            skill :new_skill_for_tests
          end
        end
      
        o = Object.new.extend(WarTroll::Skills::Templates.fetch(:'new_category_for_tests/new_skill_for_tests'))
        o.dependent_stat.must_equal :bar
      end
    
      it "forces the category of its skills" do
        BlackSpeech.speak do
          category :new_category_for_tests do
            skill :new_skill_for_tests, category: :a_wrong_category
          end
        end
      
        o = Object.new.extend(WarTroll::Skills::Templates.fetch(:'new_category_for_tests/new_skill_for_tests'))
        o.category.must_equal :new_category_for_tests
      end
    end
  end
end
