package ch.ivyteam.rule.engine.demo;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import ch.ivyteam.ivy.environment.IvyTest;
import ch.ivyteam.ivy.rule.engine.api.Rules;
import rule.engine.demo.Member;
import rule.engine.demo.enums.MemberType;

@IvyTest
class RuleDrlTest
{
  @Test
  void test() throws IOException
  {
    var testCases = Files
            .lines(Path.of("src_test/ch/ivyteam/rule/engine/demo/test-cases.csv"), StandardCharsets.UTF_8)
            .skip(1)
            .map(RuleDrlTest::toTestCase)
            .collect(Collectors.toList());

    for (var testCase : testCases)
    {
      var member = new Member();
      member.setPurchaseAmount(testCase.purchaseAmount);
      member.setMemberType(testCase.memberType);

      Rules.create()
              .namespace("rule.engine.drl")
              .executor()
              .execute(member);

      Assertions.assertEquals(testCase.discount, member.getDiscount());
    }
  }

  private static TestCase toTestCase(String line)
  {
    var data = line.split(",");

    var testCase = new TestCase();
    testCase.memberType = MemberType.valueOf(data[0]);
    testCase.purchaseAmount = Integer.valueOf(data[1]);
    testCase.discount = Integer.valueOf(data[2]);

    return testCase;
  }
}
