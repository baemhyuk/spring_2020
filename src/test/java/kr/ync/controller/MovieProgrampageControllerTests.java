package kr.ync.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

//Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
      "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
//Java Config
//@ContextConfiguration(classes = {
//org.zerock.config.RootConfig.class,
//org.zerock.config.ServletConfig.class} )
@Log4j
public class MovieProgrampageControllerTests {
   
   //@Setter(onMethod_ = { @Autowired })
      @Autowired
      private WebApplicationContext ctx; // 객체를 주입받음

      private MockMvc mockMvc; // 필드 선언  
      
      @Before
      public void setup() {
         this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
      }
      
      @Test
      public void testList() throws Exception {
   
         log.info(
               mockMvc.perform(MockMvcRequestBuilders.get("/front/index"))
               .andReturn() 
               .getModelAndView()
               .getModelMap());
      }
      
//  	@Test
//  	public void testListPaging() throws Exception {
//  		log.info("===================================================================");
//  		log.info(mockMvc.perform(
//  				MockMvcRequestBuilders.get("/front/index")
//  				.param("pageNum", "1")
//  				.param("amount", "18"))
//  				.andReturn().getModelAndView().getModelMap());
//  		log.info("==================================================================");
//  	}

}