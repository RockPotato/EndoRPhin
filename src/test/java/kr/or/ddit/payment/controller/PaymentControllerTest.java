package kr.or.ddit.payment.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Test;

import kr.or.ddit.set.WebConfig;

public class PaymentControllerTest extends WebConfig{

	@Test
	public void testView() throws Exception {
		/***Given***/
		mockMvc.perform(get("/addPayment"))
					.andExpect(status().isOk())
					.andExpect(view().name("mvc/view"));
		/***When***/

		/***Then***/
	}

}
