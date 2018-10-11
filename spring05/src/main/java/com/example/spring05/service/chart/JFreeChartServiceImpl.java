package com.example.spring05.service.chart;

import java.awt.Color;
import java.awt.Font;
import java.util.List;

import javax.inject.Inject;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Service;

import com.example.spring05.model.shop.dao.CartDAO;
import com.example.spring05.model.shop.dto.CartDTO;


@Service //Service bean으로 등록
public class JFreeChartServiceImpl implements JFreeChartService {

	@Inject //의존관계 주입(DI)
	CartDAO cartDao;
	
	@Override
	public JFreeChart createChart() {
		//장바구니 상품 목록
		List<CartDTO> list=cartDao.cartMoney();
		//파이차트용 데이터셋 생성
		DefaultPieDataset dataset=new DefaultPieDataset();
		for(CartDTO dto : list) {
			dataset.setValue(dto.getProduct_name(), dto.getMoney());
		}
		
		//차트에 입력할 데이터셋 객체(파이차트가 아닌 경우)
/*		DefaultCategoryDataset dataset
		  =new DefaultCategoryDataset();
		for(CartDTO dto : list) {
			dataset.setValue(
					dto.getMoney(), "과일", dto.getProduct_name());
		}*/
		
		//차트 객체
		JFreeChart chart=null;
		String title="장바구니 통계"; //차트 제목
		try {
			//막대 그래프(파이차트가아닌 차트)
			//createBarChart(제목,x축라벨,y축라벨,데이터셋,그래프방향,
			//범례,툴팁,url)
/*			chart=ChartFactory.createBarChart(title, "상품명", 
					"금액", dataset, PlotOrientation.VERTICAL,
					true,true,false);*/
			//파이차트인 경우
			//createPieChart(제목,데이터셋,범례,툴팁,url)
			chart=ChartFactory.createPieChart(
					title, dataset, true, true, false);
			
			//라인 차트(파이차트가아닌 차트)
/*			chart=ChartFactory.createLineChart(title, "상품명", 
					"금액", dataset, PlotOrientation.VERTICAL,
					true,true,false);*/
			
			//import java.awt.Font
			//차트 제목 폰트
			chart.getTitle().setFont(new Font("돋움",Font.BOLD,15));
			//범례 폰트
			chart.getLegend().setItemFont(
					new Font("돋움",Font.PLAIN,10));
			Font font=new Font("돋움",Font.PLAIN, 12);
			Color color=new Color(0,0,0); //R.G.B black
			StandardChartTheme chartTheme=
				(StandardChartTheme)StandardChartTheme.createJFreeTheme();
			chartTheme.setExtraLargeFont(font);
			chartTheme.setLargeFont(font);
			chartTheme.setRegularFont(font);
			chartTheme.setSmallFont(font);
			
			chartTheme.setAxisLabelPaint(color);//x,y축 글자라벨
			chartTheme.setLegendItemPaint(color);
			chartTheme.setItemLabelPaint(color);
			//폰트,컬러를 차트에 적용
			chartTheme.apply(chart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chart;
	}

}
