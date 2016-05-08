package net.jeeshop.web.action.manage.report;import java.io.IOException;import java.util.LinkedHashMap;import java.util.List;import java.util.Map;import net.jeeshop.core.BaseAction;import net.jeeshop.services.manage.order.OrderService;import net.jeeshop.services.manage.order.bean.Order;import net.jeeshop.services.manage.orderdetail.OrderdetailService;import net.jeeshop.services.manage.product.ProductService;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.context.annotation.Scope;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.RequestMapping;import com.alibaba.fastjson.JSON;/** * 报表、图表 *  * @author huangf *  */@Scope("prototype")   @Controller   @RequestMapping("/manage/report")public class ReportAction extends BaseAction<ReportInfo> {	private static final long serialVersionUID = 1L;	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ReportAction.class);	@Autowired	private ProductService	productService;	@Autowired	private OrderService orderService;	@Autowired	private OrderdetailService orderdetailService;	private static String orderSales = null;	private static String productSales = null;	{		orderSales = "/manage/report/orderSales";		productSales = "/manage/report/productSales";	}		protected void selectListAfter() {//		pager.setPagerUrl("ReportInfo!selectList.action");		pager.setPagerUrl(getBasePath()+"/manage/report/selectList.action");	}	public ReportInfo getE() {		return this.e;	}	public void prepare() throws Exception {		if (this.e == null) {			this.e = new ReportInfo();		}		super.initPageSelect();	}	public void insertAfter(ReportInfo e) {		e.clear();	}		/**	 * 产品销售排行榜统计：图表的形式展示指定时间范围内的商品的销售情况，包括数量、金额等。	 * @return	 */	@RequestMapping("/productSales")	public String productSales(){//		List<ReportInfo> list = orderdetailService.reportProductSales(new Orderdetail());//		return null;		return productSales;	}		/**	 * 销量统计：统计选择的时间范围内的销量情况。	 * @return	 */	@RequestMapping("/orderSales")	public String orderSales(){//		logger.error("reportOrderSales....");//		try {//			Order order = new Order();//			order.setStartDate("2013-01");//			order.setEndDate("2014-05");//			List<ReportInfo> list = orderService.reportOrderSales(order);//			if(list==null){//				logger.error("reportOrderSales=0");//			}else{//				logger.error("reportOrderSales="+list.size());//			}//		} catch (Exception e) {//			e.printStackTrace();//		}		return orderSales;	}		/**	 * 查询指定时间范围内的订单的销量情况	 * @return	 * @throws IOException 	 */	@RequestMapping("/selectOrderSales")	public String selectOrderSales() throws IOException{		logger.error("selectOrderSales....startDate="+e.getStartDate()+",endDate="+e.getEndDate());//		try {//			Thread.sleep(5000L);//		} catch (InterruptedException e1) {//			e1.printStackTrace();//		}		Order order = new Order();		order.setStartDate(e.getStartDate());		order.setEndDate(e.getEndDate());//			if(StringUtils){//				order.setStartDate("2013-01");//				order.setEndDate("2014-05");//			}		List<ReportInfo> list = orderService.selectOrderSales(order);		if(list==null){			logger.error("reportOrderSales=0");		}else{			logger.error("reportOrderSales="+list.size());		}		if(list!=null && list.size()>0){			Map<String, String> map = new LinkedHashMap<String, String>();			StringBuilder amountBuff = new StringBuilder("[");			StringBuilder createdateBuff = new StringBuilder("[");			for(int i=0;i<list.size();i++){				ReportInfo item = list.get(i);				logger.error("item="+item.toString());				amountBuff.append(item.getSumAmount());				createdateBuff.append(item.getCreatedate());				if(i!=list.size()-1){					amountBuff.append(",");					createdateBuff.append(",");				}			}			amountBuff.append("]");			createdateBuff.append("]");						map.put("amountArr", amountBuff.toString());			map.put("orderdateArr", createdateBuff.toString());						logger.error("json="+JSON.toJSONString(map).toString());			response.getWriter().write(JSON.toJSONString(map).toString());		}else{			response.getWriter().write("0");		}		return null;	}		/**	 * 查询指定时间范围内的产品的销量情况	 * @return	 * @throws IOException 	 */	@RequestMapping("/selectProductSales")	public String selectProductSales() throws IOException{		logger.info("selectProductSales....startDate="+e.getStartDate()+",endDate="+e.getEndDate());//		try {//			Thread.sleep(5000L);//		} catch (InterruptedException e1) {//			e1.printStackTrace();//		}		Order order = new Order();		order.setStartDate(e.getStartDate());		order.setEndDate(e.getEndDate()); 		List<ReportInfo> list = orderService.selectProductSales(order);		if(list==null){			logger.error("reportOrderSales=0");		}else{			logger.error("reportOrderSales="+list.size());		}		if(list!=null && list.size()>0){			Map<String, String> map = new LinkedHashMap<String, String>();			StringBuilder productSellCountBuff = new StringBuilder("[");			StringBuilder productNameBuff = new StringBuilder("[");//			for(int i=0;i<list.size();i++){			for(int i=list.size()-1;i>=0;i--){				ReportInfo item = list.get(i);//				logger.error("item="+item.toString());				productSellCountBuff.append(item.getProductSellCount());				productNameBuff.append("'"+item.getProductName()+"'");//				if(i!=list.size()-1){				if(i!=0){					productSellCountBuff.append(",");					productNameBuff.append(",");				}			}			productSellCountBuff.append("]");			productNameBuff.append("]");						map.put("productSellCountArr", productSellCountBuff.toString());			map.put("productNameArr", productNameBuff.toString());						logger.error("json="+JSON.toJSONString(map).toString());			response.getWriter().write(JSON.toJSONString(map).toString());		}else{			response.getWriter().write("0");		}		return null;	}}