#include <gtest/gtest.h>

#include <dummy.h>

namespace BDD::GIVEN {

    struct SomeAssumption {
        void operator()() const
        {
            // do setup for the test
            // any tests that run shoiuld
            // be sanity checks only.
            ;
        }
    };
};

namespace BDD::WHEN {

    struct SomeCondition {
        void operator()() const
        {
            //DO SOMETHING this should
            //be an action of some sort
            ;
        }
    };
};

namespace BDD::THEN {

    struct SomeResult {
        void operator()() const
        {
            //here we test the results
            //of the previous actions
            //preferebly with meaningful
            //names
            ;
        }
    };

};
using namespace BDD; 
TEST(dummyTest, doSomethingElse)
{
    GIVEN::SomeAssumption{}();
    WHEN::SomeCondition{}();
    THEN::SomeResult{}();
}

TEST(dummyTest, doesSomethingAndFails)
{
    dummy test{};
    EXPECT_EQ(test.doSomething("poo"), "poo");
}

TEST(dummyTest, doesSomethingAndPasses)
{
    dummy test{};
    EXPECT_EQ(test.doSomething("poo"), "hello world");
}
