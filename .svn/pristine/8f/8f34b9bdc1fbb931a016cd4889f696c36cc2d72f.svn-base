package ssm;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wisezone.pojo.QuestionTypePojo;
import com.wisezone.service.QuestiontypeService;

@ContextConfiguration(locations="classpath:applicationContext.xml")
@RunWith(value=SpringJUnit4ClassRunner.class)
public class QuestionTypeServiceTest {

	@Autowired
	private QuestiontypeService questinTypeService;
	
	@Test
	public void testLoad(){
		
		List<QuestionTypePojo>  treeList=this.questinTypeService.selectQuestionTypeTree();
		
		System.out.println(treeList.size());
		
	}
	
	
}
